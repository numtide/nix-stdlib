{ values, ... }:
{
  isEqual = a: b:
    if a != b then throw "expected ${toString a} == ${toString b}" else true;

  isTrue = cond:
    if !cond then throw "expected true, got ${toString cond}" else true;

  isType = type: val:
    let
      t = values.type val;
    in
    if t != type then
      throw "expected type to be ${type}, not ${t}"
    else true;
}
