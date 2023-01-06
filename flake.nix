{
  description = "experimental nix prelude";

  outputs = { self }: {
    lib = import ./src;
  };
}
