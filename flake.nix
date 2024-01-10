{
  description = "template for ruby gem development";
  outputs = { self }: {
    templates = rec {
      ruby_gem = {
        path = ./flake_templates;
        description = "template for ruby gem development";
        welcomeText = ''
          Thanks for using ruby gem dev shell.
          Run the following command to get started:

          nix --extra-experimental-features 'nix-command flakes' develop
        '';
      };
      default = ruby_gem;
    };
  };
}
