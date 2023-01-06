rec {
  decode = builtins.fromJSON;
  encode = builtins.toJSON;
  import = path: decode (builtins.readFile path);
}