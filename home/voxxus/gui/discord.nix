{inputs, ...}: {
  imports = [inputs.nixcord.homeModules.nixcord];

  programs.nixcord = {
    enable = true;
    vesktop.enable = true;
    config = {
      themeLinks = ["https://refact0r.github.io/system24/build/system24.css"];
      frameless = true;
    };
  };
}
