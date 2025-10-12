{ config, ... }:
{
	home.shell = {
		enableShellIntegration = false;
		
		enableBashIntegration = config.programs.bash.enable;
		enableIonIntegration = config.programs.ion.enable;
		enableNushellIntegration = config.programs.nushell.enable;
		enableZshIntegration = config.programs.zsh.enable;
		enableFishIntegration = config.programs.fish.enable;
	};
}
