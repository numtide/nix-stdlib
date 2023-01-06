{ ... }:
{
  # Compares two semver-abiding versions.
  #
  # -1: the first argument is lower than the second
  #  0: both arguments are the same
  #  1: the first argument is higher than the second
  #
  # str -> str -> int
  compare = builtins.compareVersions;

  # Splits a semver version according to its components
  #
  # Example:
  #    > builtins.splitVersion "1.2.3-rc1"
  #    [ "1" "2" "3" "rc" "1" ]
  #
  split = builtins.splitVersion;

  # Returns the version of the current Nix interpreter
  nix = builtins.nixVersion;

  # Returns the version of the language
  lang = builtins.langVersion;
}
