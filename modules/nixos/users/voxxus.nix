{
	lib,
	config,
	...
}:
let
	inherit (lib) elem mkIf;
in
{
	config = mkIf (elem "voxxus" config.garden.system.users) {
		users.users.voxxus = {
			hashedPassword = "$y$j9T$A5HCKvZvetaO6TcjuP90Q1$xCeEe6b2ZuqkPHeLBNtfy0REbiLsui6xABOU4o.W0k6";
		};
	};
}
