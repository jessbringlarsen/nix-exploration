{ pkgs ? import <nixpkgs> {}}:
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
