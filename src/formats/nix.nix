{
  encode = 
}

{ sets, strings, lists, values, ... }:
let
  # Escape Nix strings
  stringToNix = str:
    "\"" + (
      strings.replace
        [ "\\" "\"" "\n" "\r" "\t" ]
        [ "\\\\" "\\" "\\n" "\\r" "\\t" ]
        str
    )
    + "\"";

  attrsToNix = attrs:
    strings.concatSep " " (
      [ "{" ] ++ (sets.mapToList (k: v: "${k} = ${toNix v};") attrs)
      ++ [ "}" ]
    );

  listToNix = list:
    strings.concatSep " " (
      [ "[" ] ++ (lists.map toNix list)
      ++ [ "]" ]
    );

  table = {
    "bool" = (x: if x then "true" else "false");
    "int" = toString;
    "list" = listToNix;
    "null" = (x: "null");
    "path" = toString;
    "set" = attrsToNix;
    "string" = stringToNix;
  };

  # Like builtins.JSON but outputs Nix code instead
  # TODO:
  # * support floats
  # * escape attrs keys
  # * formatting options?
  toNix = value:
    let
      t = values.type value;
    in
    table.${t} or (x: throw "type '${t}' not supported")
      value
  ;
in
{
  encode = toNix;
  # FIXME: use the same type signature as the other decoders.
  decode = builtins.tryEval;

  import = builtins.import;
}