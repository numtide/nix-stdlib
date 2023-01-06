rec {
  decode = builtins.fromTOML;
  encode = throw "TODO: format.toml.encode is not implemented";
  import = path: decode (builtins.readFile path);
}