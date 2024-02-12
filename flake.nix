{
  description = "template for ruby gem development";
  outputs = { self }: {
    templates = rec {
      ruby_gem = {
        path = ./flake_templates;
        description = "template for ruby gem development";
        welcomeText = ''
          Thanks for using ruby gem dev shell.

          To get started...

          1. Edit the provided sample.gemspec file
            - change file name to <your_gem_name>.gemspec
            - fill in details in gemspec file
            - List dependencies

          2. Enter dev shell by running
            make env

          Note: exit/reopen dev shell when adding new dependencies
        '';
      };
      default = ruby_gem;
    };
  };
}
