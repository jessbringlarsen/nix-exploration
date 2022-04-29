{ pkgs ? import <nixpkgs> {}}:
	pkgs.mkShell {
		name = "My Awesome Shell"; 
		buildInputs = with pkgs; [
			figlet
			cowsay
		];

		shellHook = ''
			echo "Welcome!"
		'';
}
