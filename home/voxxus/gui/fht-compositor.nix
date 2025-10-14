{
	lib,
	pkgs,
	config,
	...
}:
let
	inherit (config.garden.programs) defaults;
in
{
	config = lib.mkIf config.programs.fht-compositor.enable {
	};
}
