let
	pkgs = import (builtins.fetchTarball { url = "https://github.com/NixOS/nixpkgs/archive/19f768a97808da4c8700ae24513ab557801be12c.tar.gz"; }) {};
	nodejs-pkg = pkgs.nodejs;

in

{ pkgs ? import <nixpkgs> {}
}:

	pkgs.mkShell {
		buildInputs = with pkgs; [
			maven
			jdk8
			nodejs-pkg
			git
		];

		shellHook = ''
			echo "Welcome!"
		'';
}
