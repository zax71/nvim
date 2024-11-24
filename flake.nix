# Based off https://primamateria.github.io/blog/neovim-nix/
{
    description = "Zax71's Neovim flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        neovim = {
            url = "github:nix-community/neovim-nightly-overlay";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, neovim }:
        let
            overlayFlakeInputs = prev: final: {
                neovim = neovim.packages.x86_64-linux.neovim;
            };

            overlayMyNeovim = prev: final: {
                zax-neovim = import ./packages/zax-neovim.nix {
                    pkgs = final;
                };
            };

            pkgs = import nixpkgs {
                system = "x86_64-linux";
                overlays = [ overlayFlakeInputs overlayMyNeovim ];
            };

        in {
            packages.x86_64-linux.default = pkgs.myNeovim;
            apps.x86_64-linux.default = {
                type = "app";
                program = "${pkgs.zax-neovim}/bin/nvim";
            };
        };
}