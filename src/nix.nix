{
  inherit (builtins)
    langVersion

    # returns the configured nix store root directory
    # (eg: /nix/store)
    #
    # string
    storeDir
    ;

  # returns the version of nix
  version = builtins.nixVersion;
}
