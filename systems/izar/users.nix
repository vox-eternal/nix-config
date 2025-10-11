{
  home-manager.users.voxxus = {
    garden.programs.defaults.shell = "fish";

    programs = {
      fish.enable = true;
    };
  };
}
