{ config, inputs, inputs', ... }:
let
	spicePkgs = inputs'.spicetify.legacyPackages;
in
{
	imports = [ inputs.spicetify.homeManagerModules.default ];

	programs.spicetify = {
		enable = true;

		enabledExtensions = with spicePkgs.extensions; [
			adblock
			hidePodcasts
			shuffle
		];
	};
}
