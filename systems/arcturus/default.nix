{
  imports = [
    ./users.nix
    ./hardware-configuration.nix
  ];

  garden = {
    profiles = {
      graphical.enable = true;
      workstation.enable = true;
      gaming.enable = true;
    };

    device.gpu = "nvidia";

    system.boot.secureBoot = true;
  };
}
