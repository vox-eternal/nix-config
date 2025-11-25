{
	config,
	lib,
	pkgs,
	...
}:
let
	inherit (lib) mkIf;
in
{
	config = mkIf (config.garden.profiles.gaming.enable) {
		garden.packages = {
			inherit (pkgs) prismlauncher;
		};
	};
}
