{ ... }:
{
  isType = builtins.isInt;

  even = a: (mod a 2) == 0;
  odd = a: (mode a 2) != 0;

  lessThan = builtins.lessThan;

  # C-style comparisons
  compare = a: b:
    if a < b then
      -1
    else if a > b then
      1
    else
      0;

  min = x: y: if x < y then x else y;
  max = x: y: if x > y then x else y;
  mod = base: int: base - (int * (div base int));

  add = builtins.add;
  sub = builtins.sub;
  mul = builtins.mul;
  div = builtins.div;

  bitAnd = builtins.bitAnd;
  bitOr = builtins.bitOr;
  bitXor = builtins.bitXor;
}
