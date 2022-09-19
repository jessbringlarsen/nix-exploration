# nix-exploration

## Nix Shell

Start an interactive shell with the `btop` package installed. This temporarily modify the `PATH` of the shell.

```bash
$ nix-shell -p btop
$ which btop
/nix/store/invwkxjijiky4w1cbg0cf6nk648hz965-btop-1.2.6/bin/btop
```
Adding `--pure` will ensure the environment is almost entirely cleared before the interactive shell is started except for some environment variables.

### Versioning

See `https://status.nixos.org/` for status on channels and to get the git commit hash to use in the pinning statements see `shell-pinning.nix`.
Use `https://search.nixos.org/packages` to search for packages and an this unofficial site to search for previous versions of a package: `https://lazamar.co.uk/nix-versions/`

#### Channels

Use the `nix-channel --list` to inspect the current channel in use.


## Nix Language

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
