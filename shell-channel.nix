{ pkgs ? import <nixos-22.05> {}}:
	pkgs.mkShell {
		name = "My Awesome Shell"; 
		buildInputs = with pkgs; [
			figlet
			htop
		];

		shellHook = ''
			echo "Welcome!"
		'';
}
