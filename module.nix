{lib, ...}: {
  options = {
    filename = lib.mkOption {
      type = lib.types.string;
      default = "file.txt";
    };
    contents = {
      first-line = lib.mkOption {
        type = lib.types.string;
        default = "This is the first line";
      };
      second-line = lib.mkOption {
        type = lib.types.string;
        default = "This is the second line";
      };
    };
  };
}
