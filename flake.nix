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
        default = pkgs.writeTextFile {
          name = "hello-world.txt";
          text = "Hello, world!";
        };
      };
    });
}
