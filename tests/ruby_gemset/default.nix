let
  pkgs = import <nixpkgs> {};
  gemset_nix = pkgs.callPackage
    ../../ruby_gemset
    {
      src = ../fixtures;
    };
in
  gemset_nix.tests
