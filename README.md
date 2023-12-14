# Ruby Gem Dev Shell
This repo hopes to provide a simple ruby gem development environment powered by
Nix. It provides built in functionality for releasing gems to github and
rubygems.org.

This repo builds on top of the [bundlerEnv](https://github.com/NixOS/nixpkgs/tree/master/pkgs/development/ruby-modules/bundler-env)
derivation provided by [nixpkgs](https://github.com/NixOS/nixpkgs) and the
[bundix](https://github.com/nix-community/bundix) gem.

## Setup
Add this repository as an input to your gem's `flake.nix` file
[Example](https://github.com/jbernie2/dryer_services/blob/main/flake.nix)

## Sample Makefile
Check out the sample `Makefile` in this repo. You will probably want to copy
this file into your project to make development even easier.

## Running the enviroment
The command I use to start the environment is
```
nix \
    --extra-experimental-features 'nix-command flakes' \
    develop --ignore-environment \
    --show-trace \
    --keep GITHUB_TOKEN \
    --keep GEM_HOST_API_KEY \
    --keep TERM
```
which I have set as a make task `make env`
this will install all the dependencies and plop you into the development shell

## Built in commands
Once you are in the environment there are several convience commands set up for
you. These commands can be run directly from the development shell.
I will list them here, but I have also included a sample Makefile which makes
them even easier to use.

### Releasing to github
This command takes a single argument, the path to your gem's gemspec file and
then uploads the gem release to github.
```
release_to_github <gemspec_file>
```

### Releasing to rubygems.org
This command takes a single argument, the path to your gem's gemspec file and
then uploads the gem release to rubygems.
```
release_to_rubygems <gemspec_file>
```

## Artifacts
Creating a ruby environment in Nix requires a `gemset.nix` file. This file is
esstentially a nix-compaitable version of `Gemfile.lock`. Starting the shell
will generate this file for you. It is advisable to commit this file to git.

## Contributing
Please create a github issue to report any problems.
Thanks for your help in making testing easier for everyone!

## License
This code is free to use under the terms of the MIT license.
