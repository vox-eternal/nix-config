{
	lib,
	pkgs,
	config,
	...
}:
let
	inherit (lib) mkIf;
in
{
	config = mkIf config.garden.profiles.graphical.enable {
		garden.packages = {
			inherit (pkgs) qemu;
		};
	};
}
