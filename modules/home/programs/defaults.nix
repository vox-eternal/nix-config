{
  lib,
  osClass,
  ...
}: let
  inherit (lib) mkOption mapAttrs;
  inherit (lib.types) enum nullOr str;

  mkDefault = name: args: mkOption ({description = "default ${name} for the system";} // args);
in {
  options.garden.programs.defaults = mapAttrs mkDefault {
    shell = {
      type = enum [
        "bash"
        "zsh"
        "fish"
        "nushell"
      ];
      default = "bash";
    };

    terminal = {
      type = enum [
        "ghostty"
        "alacritty"
        "kitty"
        "wezterm"
        "foot"
      ];
      default = "ghostty";
    };

    fileManager = {
      type = enum [
        "cosmic-files"
        "dolphin"
        "nemo"
      ];
      default = "cosmic-files";
    };

    browser = {
      type = enum [
        "firefox"
        "chromium"
        "thorium"
        "zen"
      ];
      default = "firefox";
    };

    editor = {
      type = enum [
        "nvim"
        "codium"
      ];
      default = "nvim";
    };
  };
}
