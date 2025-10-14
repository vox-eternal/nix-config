{ config, pkgs, ... }:
{
	config.garden.packages = {
		inherit (pkgs) alacritty;
	};
}
