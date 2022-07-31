# nix-exploration

## Nix Shell

Start an interactive shell with the `btop` package installed.

```bash
$ nix-shell -p btop
$ which btop
/nix/store/invwkxjijiky4w1cbg0cf6nk648hz965-btop-1.2.6/bin/btop
```
Adding `--pure` will ensure the environment is almost entirely cleared before the interactive shell is started except for some environment variables.

Start an interactive shell using `mkShell`. Create a file `shell.nix` with the content:

```bash
{ pkgs ? import <nixpkgs> {}}:
        pkgs.mkShell {
                name = "My Awesome Shell"; 
                buildInputs = with pkgs; [
                        figlet
                        cowsay
                        htop
                ];

                shellHook = ''
                        echo "Welcome!"
                '';
}
```
Start the shell using `nix-shell` optionally specifying a filename if file is not called `shell.nix`.
