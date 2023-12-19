let
  pkgs = import <nixpkgs> {};
  ruby_gem_dev_shell = pkgs.callPackage
    ../../ruby_gem_dev_shell
    {
      project_root = ./.;
      gemspec = ./dryer_services.gemspec;
    };
in
  ruby_gem_dev_shell
