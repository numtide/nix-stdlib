{ ... }:
rec {
  isType = builtins.isList;

  inherit (builtins)
    all
    any
    elem
    elemAt
    map
    filter
    foldl'
    head
    isList
    length
    tail
    ;

  # [a] -> [a] -> [a]
  append = a: b: a ++ b;

  # [[a]] -> [a]
  concat = builtins.concatLists;

  concatMap = builtins.concatMap;

  optional = cond: x: if cond then x else empty;

  empty = [ ];

  isEmpty = x: x == empty;

  singleton = x: [ x ];

  slice = start: count: list:
    let
      len = length list;
    in
    gen
      (n: elemAt list (n + start))
      (
        if start >= len then 0
        else if start + count > len then len - start
        else count
      );

  take = count: slice 0 count;

  drop = count: list: slice count (length list) list;

  toAttrs = builtins.listToAttrs;

  # sort: (a -> a -> bool) -> [a] -> [a]
  sort = builtins.sort;

  #
  gen = builtins.genList;

  replace = builtins.replaceStrings;
}
