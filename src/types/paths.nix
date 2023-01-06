{ lambdas, strings, ... }:
{
  isType = builtins.isPath;

  # FIXME: is this correct?
  toType = str: /. + toString str;

  # path -> bool
  exists = builtins.pathExists;

  # path -> string
  read = builtins.readFile;

  # creates a new entry in the /nix/store
  #
  # name:string -> content:string -> path
  #
  # NOTE: the string cannot have context
  write = builtins.toFile;

  # path -> set{ name = filetype }
  readDir = builtins.readDir;

  dirname = builtins.dirOf;

  basename = builtins.baseNameOf;

  # resolves a given path to a /nix/store entry
  #
  # path -> string
  storePath = builtins.storePath;

  import = builtins.import;

  # Find a file in the Nix search path. Used to implement <x> paths,
  # which are desugared to 'findFile __nixPath "x"'. */
  findFile = builtins.findFile;

  # A proper source filter
  filter = { path, name ? "source", allow ? [ ], deny ? [ ] }:
    let
      # If an argument to allow or deny is a path, transform it to a matcher.
      #
      # This probably needs more work, I don't think that it works on
      # sub-folders.
      toMatcher = f:
        let
          path_ = toString f;
        in
        if isFunction f then f
        else
          (path: type: path_ == toString path);

      allow_ = builtins.map toMatcher allow;
      deny_ = builtins.map toMatcher deny;
    in
    builtins.path {
      inherit name path;
      filter = path: type:
        (builtins.any (f: f path type) allow_) &&
        (!builtins.any (f: f path type) deny_);
    };

  # Match paths with the given extension
  matchExt = ext:
    path: type:
      (strings.hasSuffix ".${ext}" path);

  # Returns a hash of the file.
  #
  # Valid algos are:
  #   md5
  #   sha1
  #   sha256
  #   sha512
  #
  # algo:string -> path -> hash:string
  hash = builtins.hashFile;
}
