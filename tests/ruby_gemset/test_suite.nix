{ runCommand, lib, gemset-nix}:
runCommand "gemset-nix-test" {
  nativeBuildInputs = [ gemset-nix ];
  src = "";
} ''
  echo testing...
  touch $out
''
