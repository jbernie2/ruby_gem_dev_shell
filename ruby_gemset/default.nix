{ name ? "gemset-nix"
  , src
  , ruby
  , bundler
  , bundix
  , lib
  , stdenv
  , callPackage
}:
stdenv.mkDerivation (finalAttrs:
let
  package = finalAttrs.finalPackage;
  out = package.out;
in {
  inherit name src;
  buildInputs = [ruby bundler bundix ];
  buildPhase = ''
    rm -f Makefile # don't want this to be accidentally used by nix stdenv
    bundler lock
    HOME=$TMP bundix --lock
  '';

  installPhase = ''
    mkdir $out
    cp ./gemset.nix $out/gemset.nix
    cp ./Gemfile.lock $out/Gemfile.lock
    cp ./Gemfile $out/Gemfile
  '';

  passthru = {
    gemsetPath = "${out}/gemset.nix";
    gemfilePath = "${out}/Gemfile";
    gemfileLockPath = "${out}/Gemfile.lock";
    tests.suite = (
      callPackage ../tests/ruby_gemset/test_suite.nix { gemset-nix = package; }
    );
  };
})

