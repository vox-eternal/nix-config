{ self, config, inputs, ... }:
{
	imports = [ inputs.sops.nixosModules.sops ];
	sops = {
		age = {
			sshKeyFile = "/etc/ssh/ssh_host_ed25519_key";
			sshKeyPaths = [];
		};
		defaultSopsFile = "${self}/secrets/voxxus.yaml";
		gnupg.sshKeyPaths = [];
	};
}
