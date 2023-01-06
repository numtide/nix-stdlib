{ lists, ... }:
rec {
  isType = builtins.isAttrs;

  concat = a: b: a // b;

  size = set: builtins.length (keys set);

  optional = cond: x: if cond then x else empty;

  empty = { };

  isEmpty = x: x == empty;

  get = builtins.getAttr;

  has = builtins.hasAttr;

  map = builtins.mapAttrs;

  # NOTE: putting the attrs as the last argument
  remove = keys: attrs: builtins.removeAttrs attrs keys;

  keys = builtins.attrNames;

  values = builtins.attrValues;

  # key:string -> [{ key = value; }] -> [value]
  cat = builtins.catAttrs;

  intersect = builtins.intersectAttrs;

  nameValuePair = name: value: { inherit name value; };

  gen = names: f:
    lists.toAttrs (map (n: nameValuePair n (f n)) names);

  # filter = pred: set:
  # lists.toAttrs
  # (lists.concatMap
  # (name: let v = set.${name}; in if pred name v then [(nameValuePair name v)] else []) (keys set));

  /* Call a function for each attribute in the given set and return
     the result in a list.

     Example:
       mapAttrsToList (name: value: name + value)
          { x = "a"; y = "b"; }
       => [ "xa" "yb" ]
  */
  mapToList = f: attrs:
    builtins.map (name: f name attrs.${name}) (keys attrs);
}
