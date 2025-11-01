{ config, osConfig, pkgs, self, lib, ... }:
{
	programs.quickshell = {
		systemd.enable = true;
	};	
}
