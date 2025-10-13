{ config, pkgs, ... }:
let
	lock-false = { Value = false; Status = "locked"; };
	lock-true = { Value = true; Status = "locked"; };
in
{
	programs.firefox = {
		enable = config.garden.profiles.graphical.enable;
		languagePacks = [ "en_US" ];

		# check about:policies#documentation for details on how this works
		policies = {
			DisableTelemetry = true;
			DisableFirefoxStudies = true;
			EnableTrackingProtection = {
				Value = true;
				Locked = true;
				Cryptomining = true;
				Fingerprinting = true;
				EmailTracking = true;
				SuspectedFingerprinting = true;
				Category = "strict";
				BaselineExceptions = true;
			};
		};
	};
}
