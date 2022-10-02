# nix-exploration

_Why?_

If you’d like to use a tool that you do not have installed. You can use the tool without having to install the software.

If you’d like to try a tool for a few minutes. For example, there’s a shiny new tool for writing presentation slides.

If you’d like to give someone else a one-liner to install a set of tools and you want this to work on all Linux distributions and MacOS.

If you’d like to provide a script that is reproducible, meaning it will also provide any tools that it depends on.

`https://blog.wesleyac.com/posts/the-curse-of-nixos`

## Installation

Can either be installed or run using Docker:

    docker run -ti nixos/nix

## Nix Shell

Start an interactive shell with the `btop` package installed. This temporarily modify the `PATH` of the shell.

```bash
$ nix-shell -p btop
$ which btop
/nix/store/invwkxjijiky4w1cbg0cf6nk648hz965-btop-1.2.6/bin/btop
```
Adding `--pure` will ensure the environment is almost entirely cleared before the interactive shell is started except for some environment variables.

### Versioning

Either channels or git commit hash can be used.

See `https://status.nixos.org/` for status on channels and to get the git commit hash to use in the pinning statements see `shell-pinning.nix`.
Use `https://search.nixos.org/packages` to search for packages and an this unofficial site to search for previous versions of a package: `https://lazamar.co.uk/nix-versions/`

See `https://github.com/NixOS/nixpkgs/tree/master/pkgs/applications` for Nix expression for each package.

Example of a shell pinned to specific versions:

	nix-shell --pure -p git -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/2a601aafdc5605a5133a2ca506a34a3a73377247.tar.gz


#### Channels

Use the `nix-channel --list` to inspect the current channel in use.

    nix-shell -p '(import <mychannel> {}).hello'

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

## Docker support

    nix-build docker.nix -o result
    docker load -i ./result
    docker run -ti nix-hello:latest hello
