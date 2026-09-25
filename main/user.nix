{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, ... }:

{

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs self username hostname system; };
      users.${username} = {
        home = {
          stateVersion = "26.11";
          username = username;
          homeDirectory = "/home/${username}";
          };
        imports = [
          ../user/modules.nix
          ../user/programs.nix
          ../user/spicetify.nix
          ../user/variables.nix
          ../user/xdg.nix
          ];
        };
      };

}
