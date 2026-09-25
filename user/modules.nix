{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, ... }:

{

  imports = with inputs; [
                spicetify.homeManagerModules.spicetify
                ];

}
