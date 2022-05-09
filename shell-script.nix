with import <nixpkgs> {};

let
  script = pkgs.writeShellScriptBin "helloWorld.sh" ''
        figlet "Hello World"
    '';
in
stdenv.mkDerivation rec {
    name = "script-environment";

    buildInputs = [ 
        figlet
        script 
    ];
}