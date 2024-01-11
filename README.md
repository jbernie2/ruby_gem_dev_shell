# Ruby Gem Dev Shell
This repo hopes to provide a simple ruby gem development environment powered by
Nix. It provides built in functionality for releasing gems to github and
rubygems.org.

This repo builds on top of the [bundlerEnv](https://github.com/NixOS/nixpkgs/tree/master/pkgs/development/ruby-modules/bundler-env)
derivation provided by [nixpkgs](https://github.com/NixOS/nixpkgs) and the
[bundix](https://github.com/nix-community/bundix) gem.

## Setup
If you don't already have a flake.nix file, you can run the following to command
to create one from this project's template
```
nix --extra-experimental-features 'nix-command flakes' flake init --refresh --template github:jbernie2/ruby_gem_dev_shell
```
this will copy flake.nix, and the Makefile into your current directory.

to then start the development environment run
```
make env
```

## Artifacts
Creating a ruby environment in Nix requires a `gemset.nix` file. This file is
essentially a nix-compatable version of `Gemfile.lock`. Runing `make env`
will generate this file for you. It is advisable to commit this file to git.

## Built in commands
run `make` to see the list of convience commands provided

## Updating Dependencies
Updating or adding dependencies, either to the Gemfile or the .gemspec file,
requires exiting the environment and re-running `make env`

## Contributing
Please create a github issue to report any problems.
Thanks for your help in making testing easier for everyone!

## License
This code is free to use under the terms of the MIT license.
