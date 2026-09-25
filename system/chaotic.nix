{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, ... }:

{

  chaotic = {
    nyx = {
      cache = {
        enable = true;
        };
      nixPath = {
        enable = true;
        };
      overlay = {
        enable = true;
        };
      registry = {
        enable = true;
        };
      };
    };

}
