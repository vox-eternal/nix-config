{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      rustc
      cargo
      cargo-watch
      gcc
    ];
  };
}
