let
  pkgs = import <nixpkgs> {};
  ruby_gem_dev_shell = pkgs.callPackage
    ../../ruby_gem_dev_shell
    {
      project_root = ./fixtures;
    };
in
  pkgs.runCommand "ensure_files_exist" {
    nativeBuildInputs = [ ruby_gem_dev_shell pkgs.which ];
    src = "";
  } ''
    assert_file () {
      local file_path=$1
      if [ ! -f "$file_path" ]; then
        echo "failure: expected file $file_path to exist"
        exit 1
      fi
    }
    assert_file "${ruby_gem_dev_shell}/configs/Gemfile"
    assert_file "${ruby_gem_dev_shell}/configs/Gemfile.lock"
    assert_file "${ruby_gem_dev_shell}/configs/gemset.nix"
    assert_file "${ruby_gem_dev_shell}/configs/gem.gemspec"
    assert_file "${ruby_gem_dev_shell}/makefiles/Makefile"
    assert_file "${ruby_gem_dev_shell}/scripts/bin/release_to_github"
    assert_file "${ruby_gem_dev_shell}/scripts/bin/release_to_rubygems"

    touch $out
  ''
