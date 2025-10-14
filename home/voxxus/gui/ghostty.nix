{
	lib,
	pkgs,
	config,
	...
}:
{
	programs.ghostty = {
		settings = {
			background-opacity = 0.95;
			cursor-style = "bar";
			window-padding-x = "4,4";
			gtk-titlebar = false;
			
			window-save-state = "always";
		};
	};
}
