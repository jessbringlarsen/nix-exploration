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

Install a major version a package:
```bash
nix-shell -p nodejs-14_x
```



### Versioning

Either channels or git commit hash can be used.

See `https://status.nixos.org/` for status on channels and to get the git commit hash to use in the pinning statements see `shell-pinning.nix`.
Use `https://search.nixos.org/packages` to search for packages and an this unofficial site to search for previous versions of a package: `https://lazamar.co.uk/nix-versions/`

See `https://github.com/NixOS/nixpkgs/tree/master/pkgs/applications` for Nix expression for each package.

Example of a shell pinned to specific versions:

	nix-shell --pure -p git -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/2a601aafdc5605a5133a2ca506a34a3a73377247.tar.gz


#### Channels

See [this](https://status.nixos.org/) for available channels. There are different types of channels. The `nixospkgs*` channels is not to be used if you use nixos - se [this](https://jorel.dev/NixOS4Noobs/channels.html).  


Use the `nix-channel --list` to inspect the current channel in use.

    nix-shell -p '(import <mychannel> {}).hello'

By default the unstable channel is available `nixospkgs`. To install the latest (currently) stable channel:

         nix-channel --add https://channels.nixos.org/nixos-22.05
         nix-channel --update nixos-22-05

After that imports can be done from the `nixos-22.05` channel.

https://jorel.dev/NixOS4Noobs/channels.html


The nixos channels have different tests to the nixpkgs channels and are designed for the operating system as a whole, unlike the nixpkgs channels.

_Stable channels_

Stable channels provide conservative updates for fixing bugs and security vulnerabilities, but do not receive major updates after initial release. 
New stable channels are released every six months.

_Unstable channels_

Unstable channels (nixos-unstable, nixpkgs-unstable) correspond to the main development branch (master) of Nixpkgs, delivering the latest tested updates on a rolling basis.

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
