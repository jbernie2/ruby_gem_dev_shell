let
  pkgs = import <nixpkgs> {};
in
  pkgs.callPackage
    ../../ruby_gem_dev_shell
    {
      project_root = ./.;
      gemspec = ./dryer_services.gemspec;
    }
