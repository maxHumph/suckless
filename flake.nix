{
  description = "Suckless build environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
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
            meson

            # X11 libraries
            libX11
            libXft
            libXinerama
            libXrender
            libXrandr
            libxkbcommon

            # Wayland
            wayland-scanner
            wlroots_0_20
            libinput
            scdoc
            fcft
            libxcb-wm

            # Fonts
            fontconfig
            freetype

            # GTK / Surf
            gtk3
            gcr
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
