{ ... }@stdlib:
{
  json = import ./json.nix;
  nix = import ./nix.nix stdlib;
  toml = import ./toml.nix;
}