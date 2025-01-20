{
  description = "Ignis Desktop Shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    ignis = {
      url = "github:linkfrg/ignis";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ignis, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system} = {
        default = pkgs.mkShell {
          buildInputs = [
            ignis.packages.${system}.default
            pkgs.python312
            pkgs.python312Packages.pip

            pkgs.pkg-config
            pkgs.meson
            pkgs.ninja
            pkgs.git
            pkgs.makeWrapper

            pkgs.glib
            pkgs.gtk4
            pkgs.gtk4-layer-shell
            pkgs.libpulseaudio
            pkgs.python312Packages.pygobject3
            pkgs.python312Packages.pycairo
            pkgs.python312Packages.click
            pkgs.python312Packages.charset-normalizer
            pkgs.gst_all_1.gstreamer
            pkgs.gst_all_1.gst-plugins-base
            pkgs.gst_all_1.gst-plugins-good
            pkgs.gst_all_1.gst-plugins-bad
            pkgs.gst_all_1.gst-plugins-ugly
            pkgs.pipewire
            pkgs.dart-sass
          ];
        };
      };
    };
}
