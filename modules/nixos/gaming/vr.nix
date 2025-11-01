{inputs,pkgs,...}:
{
	garden.packages = { inherit (pkgs) bs-manager; };
	nixpkgs.overlays = [ inputs.nixpkgs-xr.overlays.default ];
	services.monado = {
		enable = true;
		defaultRuntime = true;
	};

	systemd.user.services.monado.environment = {
		STEAMVR_LH_ENABLE = "1";
		XRT_COMPOSITOR_COMPUTE = "1";
		WMR_HANDTRACKING = "1";
		XRT_COMPOSITOR_FORCE_WAYLAND_DIRECT= "1";
		XRT_DEBUG_GUI = "1";
		XRT_CURATED_GUI = "1";
		XRT_COMPOSITOR_USE_PRESENT_WAIT = "1";
	};

	#boot.kernelPatches = [
	#  {
	#    name = "combined-bsb-6-10";
	#    patch = (builtins.fetchurl {
	#      sha256 = "sha256-NGmJqRyB9JS77wS1a1YKFE12ppxMoFIt/5EgZIG2ZLQ=";
	#      url = "https://gitea.seeseepuff.be/archlinux/linux-seba/raw/branch/master/bigscreenBeyond.patch";
	#    });
	#  }
	#];


}
