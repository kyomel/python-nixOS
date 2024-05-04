let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = { allowUnfree = true; }; overlays = []; };

  git = pkgs.git.overrideAttrs (oldAttrs: rec {
    version = "2.42.0";
  });

  podman = pkgs.podman.overrideAttrs (oldAttrs: rec {
    version = "4.7.2";
  });
in

pkgs.mkShell {
  packages = with pkgs; [
    git
    podman
    nodejs_20
    python311
    python311Packages.pip
    pkgs.pdm
  ];
}