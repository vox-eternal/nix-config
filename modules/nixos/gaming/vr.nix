{
	services.monado = {
		enable = true;
		defaultRuntime = true;
	};
	
	systemd.user.services.mondao.environment = {
		STEAMVR_LH_ENABLE = "1";
		XRT_COMPOSITOR_COMPUTE = "1";
	};
}
