{ pkgs, .. }:
{
	programs.quickshell = {
		systemd.enable = true;
	};
}
