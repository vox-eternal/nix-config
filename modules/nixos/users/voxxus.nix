{
  lib,
  config,
  ...
}: let
  inherit (lib) elem mkIf;
in {
  config = mkIf (elem "voxxus" config.garden.system.users) {
    users.users.voxxus = {
      hashedPassword = "$y$j9T$OXq5JUYgWM77HThszspu80$075wymoQPl1c4wgZo6frvNqwdI.gl73ci1N2yqxm7Y3";
    };
  };
}
