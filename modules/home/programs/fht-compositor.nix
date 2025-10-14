{
	lib,
	pkgs,
	config,
	inputs,
	osConfig,
	...
}:
{
	imports = [ inputs.fht-compositor.homeModules.default ];

	config = lib.mkIf config.programs.fht-compositor.enable {
		systemd.user.services.xwayland-satellite = {
			Unit = {
				Description = "Xwayland satellite service";
				After = [ "graphical-session.target" ];
				PartOf = [ "graphical-session.target" ];
				BindsTo = [ "graphical-session.target" ];
				Requisite = [ "graphical-session.target" ];
			};
			Service = {
				Type = "notify";
				NotifyAccess = "all";
				ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
				StandardOutput = "journal";
			};
			Install.WantedBy = [ "graphical-session.target" "fht-compositor.service" ];
		};
	};
}
