{
  description = "component library flake";

  inputs = {
    laio-cli.url = "https://flakehub.com/f/ck3mp3r/laio-cli/0.8.3.tar.gz";
    flake-schemas.url = "https://flakehub.com/f/DeterminateSystems/flake-schemas/*.tar.gz";
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/*.tar.gz";
  };

  outputs = { self, flake-schemas, nixpkgs, laio-cli }: 
    let
      supportedSystems = [ "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in {
      schemas = flake-schemas.schemas;

      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            nixpkgs-fmt
            gum
            xc
            fzf
            mdcat
          ];

          shellHook = ''
            # Any custom shell hooks can be added here
          '';
        };
      });

      # Define the template
      templates.default = {
        src = ./.;
        postUnpack = ''
          cp -r ${self}/template-files $out/
        '';
      };
    };
}