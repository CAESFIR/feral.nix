{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, ... }:

{

#   programs.plasma = {
#     enable = true;
#     workspace = {
#       cursor = {
#         theme = "Bibata-Modern-Ice";
#         size = 24;
#         };
#       };
#     };

  fonts.fontconfig.enable = false;

  home.file.".distroboxrc".text = ''
    container_manager="lilipod"
    export LILIPOD_HOME="/home/${username}/db"
    '';

  wayland.windowManager.hyprland = {
    enable = true;
    sourceFirst = true;
    configType = "lua";
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = ["--all"];
      };
    xwayland = {
      enable = true;
      };
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    LILIPOD_HOME="/home/${username}/db";
    };

  xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";

}
