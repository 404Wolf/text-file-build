let
  pkgs = import (builtins.getFlake "github:NixOS/nixpkgs/nixos-unstable") {system = "x86_64-linux";};
  flake = builtins.getFlake "/home/wolf/Documents/projects/Active/cliquet/text-file-build_1";
  options =
    (pkgs.lib.evalModules
      (flake
        .paramabuilds
        .x86_64-linux
        .file))
    .options;

  collect = {
    description = "description";
    type = "type";
  };
in (
  pkgs.writeTextFile {
    name = "foobar.json";
    text = builtins.toJSON (
      pkgs.lib.mergeAttrsList (
        builtins.map (option:
          pkgs.lib.setAttrByPath option.loc
          (builtins.mapAttrs (key: value: option.${value}) collect))
        (pkgs.lib.options.optionAttrSetToDocList options)
      )
    );
  }
)
