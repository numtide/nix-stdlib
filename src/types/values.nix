types:
rec {
  type = builtins.typeOf;

  optional = cond: x:
    let
      t = type x;
    in
    if cond then x else types."${t}s".empty;

  # assuming a and b are of the same type
  append = a: b:
    let
      t = type a;
      tb = type b;
    in
    assert t == tb;
    types."${t}s".append a b;

  # returns the underlying size consumption
  # ??? not sure if it's worth exporting that
  size = builtins.valueSize;
}
