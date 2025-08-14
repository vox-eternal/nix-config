{NAME}: {
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  sops = {
    age.keyFile = "/home/${NAME}/.config/sops/age/keys.txt";
    defaultSopsFile = ../../secrets.yaml;
    defaultSopsFormat = "yaml";
    secrets = {
      password = {
        neededForUsers = true;
      };
    };
  };
  environment = {
    systemPackages = with pkgs; [
      ssh-to-age
    ];
  };
  users = {
    users = {
      ${NAME} = {
        hashedPasswordFile = config.sops.secrets.password.path;
      };
    };
  };
}
