let
	pkgs = import (builtins.fetchTarball { url = "https://github.com/NixOS/nixpkgs/archive/19f768a97808da4c8700ae24513ab557801be12c.tar.gz"; }) {};
	nodejs-pkg = pkgs.nodejs;

in

{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/3590f02e7d5760e52072c1a729ee2250b5560746.tar.gz") {}
}:

	pkgs.mkShell {
		buildInputs = with pkgs; [
			maven
			jdk8
			nodejs-pkg
			git
		];
		ENVIRONMENT="dev";

		shellHook = ''
			echo "Welcome!"
		'';
}
