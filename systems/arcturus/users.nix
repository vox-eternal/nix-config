{
  home-manager.users.voxxus = {
    garden.programs.defaults.shell = "fish";

    programs = {
      fish.enable = true;
      firefox.enable = true;
      fht-compositor.enable = true;
      ghostty.enable = true;
      quickshell.enable = true;
    };
  };
}
