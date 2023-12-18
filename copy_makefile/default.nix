{ name ? "copy-makefile"
  , src
  , stdenv
}:
stdenv.mkDerivation {
  inherit name src;
  phases = ["installPhase"];
  installPhase = ''
    mkdir $out
    cp $src/Makefile $out/Makefile
  '';
}

