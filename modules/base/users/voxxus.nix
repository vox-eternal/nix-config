{
  lib,
  config,
  ...
}: let
  inherit (lib) elem mkIf;
in {
  config = mkIf (elem "voxxus" config.garden.system.users) {
    users.users.voxxus = {
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOvfKXZIlS+G2z2Aws7MjGUHdVqoGNCFkWeKvX2w41Wl"
      ];
    };
  };
}
