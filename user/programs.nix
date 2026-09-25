{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, ... }:

{

  programs = {
    fastfetch = {
    enable = true;
      };
    distrobox = {
      enable = true;
      enableSystemdUnit = true;
      containers = {

      ## Arch
        Arch = {
          entry = true;
          nvidia = true;
          init = false;
          root = false;
          pull = true;
          image = "archlinux:latest";
          home = "/home/${username}/db/home/Arch";
          hostname = hostname;
          volume= [ "/ZIN:/ZIN" "/I:/I" "/II:/II" "/III:/III" ];
#          additional_flags = [ "device=nvidia.com/gpu=all" ];
          additional_packages = [ "git" "nano" ];
          };

      # Fedora
        Fedora = {
          entry = true;
          nvidia = true;
          init = false;
          root = false;
          pull = true;
          image = "fedora:rawhide";
          home = "/home/${username}/db/home/Fedora";
          hostname = hostname;
          volume= [ "/ZIN:/ZIN" "/I:/I" "/II:/II" "/III:/III" ];
#          additional_flags = [ "device=nvidia.com/gpu=all" ];
          additional_packages = [ "git" ];
          };

      # Debian
        Debian = {
          entry = true;
          nvidia = true;
          init = false;
          root = false;
          pull = true;
          image = "debian:unstable";
          home = "/home/${username}/db/home/Debian";
          hostname = hostname;
          volume= [ "/ZIN:/ZIN" "/I:/I" "/II:/II" "/III:/III" ];
#          additional_flags = [ "device=nvidia.com/gpu=all" ];
          additional_packages = [ "git" ];
          };

        };
      };
    };

}
