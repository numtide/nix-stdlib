let
  # The first layer is pure types
  types = import ./types;

  # Then come more utility on top
  stdlib = types // {
    inherit types;
    asserts = import ./asserts.nix stdlib;
    fetchers = import ./fetchers.nix stdlib;
    formats = import ./formats stdlib;
    
    impure = import ./impure stdlib;
    nix = import ./nix.nix;
    systems = import ./systems.nix stdlib;
    versions = import ./versions.nix stdlib;
  };
in
stdlib
