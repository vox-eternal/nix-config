{pkgs,inputs,...}:
{
  imports = [
    ./users.nix
    ./hardware-configuration.nix
  ];

  garden = {
    profiles = {
      graphical.enable = true;
      workstation.enable = true;
      gaming.enable = true;
    };

    device.gpu = "nvidia";

    system.boot.secureBoot = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
	FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
  	xorg.libX11
	xorg.libXcursor
	xorg.libXext
	xorg.xinput
	xorg.libXi
	xorg.libXcomposite
	xorg.libXdamage
	glib
	nspr
	nss_latest
	dbus
	at-spi2-atk
	cups
	cairo
	gtk3
	pango
	libxfixes
	libxrandr
	libgbm
	expat
	libxcb
	libxkbcommon
	alsa-lib
	libGL
  ];

  services.flatpak.enable = true;
}
