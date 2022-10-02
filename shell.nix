{ pkgs ? import <nixpkgs> {}}:
	pkgs.mkShell {
		name = "My Awesome Shell"; 
		buildInputs = with pkgs; [
			figlet
			cowsay
			htop
		];

		shellHook = ''
                        unset PROMPT_COMMAND
			echo "Welcome!"
		'';
}
