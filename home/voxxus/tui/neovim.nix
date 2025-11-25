{
  pkgs,
  config,
  lib,
  self,
  ...
}:
let
	inherit (lib) mkIf;
in
{
  config = mkIf config.garden.profiles.workstation.enable {
	programs.neovim.enable = true;
    garden.packages = { inherit (pkgs) nil; };
	home.file.nvim = {
		recursive = true;
		source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/dotfiles/nvim";
		target = "./.config/nvim";
	};
  };
}
