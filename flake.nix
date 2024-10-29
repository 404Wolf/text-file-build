{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = {...} @ inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import inputs.nixpkgs {inherit system;};
    in {
      packages = {
        file = pkgs.writeTextFile {
          name = "filename";
          text = "this is the file contents";
        };
      };
      paramabuilds = {
        file = {contents}:
          pkgs.writeTextFile {
            name = "filename";
            text = contents;
          };
      };
    });
}
