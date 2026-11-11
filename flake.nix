{
  description = "Suckless build environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = f:
        nixpkgs.lib.genAttrs systems (system:
          f (import nixpkgs { inherit system; }));
    in {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            gcc
            gnumake
            pkg-config
            git

            # X11 libraries
            libX11
            libXft
            libXinerama
            libXrender
            libXrandr

            # Fonts
            fontconfig
            freetype

            # GTK / Surf
            gtk3
            gcr_4
            webkitgtk_4_1

            # Graphics and GTK dependencies
            glib
            cairo
            pango
            gdk-pixbuf
            atk
            harfbuzz

            # Additional libraries
            libsoup_3
          ];

          shellHook = ''
            echo "Environment loaded..."
          '';
        };
      });
    };
}
