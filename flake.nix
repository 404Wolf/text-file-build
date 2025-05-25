{
  description = "A simple text file builder";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      cliquers = {
        "paramabuilds.file" = {text ? "default text"}:
          pkgs.runCommand "generated-file" {} ''
            echo "text" > $out
          '';
      };
    });
}
