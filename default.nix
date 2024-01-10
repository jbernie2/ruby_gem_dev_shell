{ name ? "ruby-gem-dev-shell"
  # user supplied
  , project_root

  # from nix packages
  , callPackage
  , bundlerEnv
  , mkShell
  , ruby
  , bundler
  , bundix
  , git
  , gh
  , libpcap
  , libxml2
  , libxslt
  , pkg-config
  , gnumake
  , libyaml
  , which
}:
let
  buildGemset = callPackage ./ruby_gemset { src = project_root; };
  copyMakefile = callPackage ./copy_makefile { src = ./copy_makefile; };

  gems = bundlerEnv {
    name = "gem-dependencies";
    gemfile = buildGemset.gemfilePath;
    gemset = buildGemset.gemsetPath;
    lockfile = buildGemset.gemfileLockPath;
    extraConfigPaths = [buildGemset.gemspecPath];
  };

  wrappedScripts = (callPackage 
    ./scripts_wrapper
    {
      name = "gem_scripts";
      scripts = [
        {
          name = "release_to_github";
          file = ./scripts/release_to_github.sh;
        }
        {
          name = "release_to_rubygems";
          file = ./scripts/release_to_rubygems.sh;
        }
        {
          name = "assert_env_var.sh";
          file = ./scripts/assert_env_var.sh;
        }
        {
          name = "assert_arg.sh";
          file = ./scripts/assert_arg.sh;
        }
      ];
      buildInputs = [ ruby gh bundler bundix ];
    }
  );

in
  mkShell {
    packages = [
      gems
      gems.wrappedRuby
    ];
    buildInputs = [
      git
      libpcap
      libxml2
      libxslt
      pkg-config
      bundix
      gnumake
      libyaml
      which
      wrappedScripts
    ];
    buildPhase = ''
      rm -rf $out
      mkdir -p $out
      ln -sf ${wrappedScripts} $out/scripts
      ln -sf ${buildGemset} $out/configs
      ln -sf ${copyMakefile} $out/makefiles
    '';
    shellHook = ''
      genericBuild
      cp -f $out/configs/gemset.nix .
      cp -f $out/configs/Gemfile.lock .
      cp -f $out/makefiles/Makefile .
    '';
  }
