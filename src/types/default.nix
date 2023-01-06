let
  types = {
    attrs = import ./attrs.nix types;
    bools = import ./bools.nix types;
    floats = import ./floats.nix types;
    ints = import ./ints.nix types;
    lambdas = import ./lambdas.nix types;
    lists = import ./lists.nix types;
    nulls = import ./nulls.nix types;
    paths = import ./paths.nix types;
    strings = import ./strings.nix types;

    # "sets" is used for the generic type dispatcher
    sets = types.attrs;

    # generic values
    values = import ./values.nix types;
  };
in
types
