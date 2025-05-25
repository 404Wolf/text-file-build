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
      cliquers.${system} = {
        # This will match the path expected by your Builder class
        "paramabuilds.file" = {first-line ? "default text"}:
          pkgs.runCommand "generated-file" {} ''
            echo "${first-line}" > $out
          '';
      };
    });
}
