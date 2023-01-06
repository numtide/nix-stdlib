{ attrs, lists, lambdas, paths, ... }:
{
  # Loads all the sub-folders in the baseDir using the importFn
  subdirs = importFn: baseDir:
    let
      dirEntries =
        attrs.keys
          (
            attrs.filter
              (k: v: v == "directory")
              (paths.readDir baseDir)
          );

      absDirs = lists.map (dir: baseDir + "/${dir}") dirEntries;

      imports =
        lists.map
          (dir: { name = paths.basename dir; value = importFn dir; })
          absDirs;
    in
    lists.toAttrs imports;

  # Loads a JSON file
  #
  # path -> a
  JSON = lambdas.compose builtins.fromJSON builtins.readFile;

  TOML = lambdas.compose builtins.fromTOML builtins.readFile;

  scoped = builtins.scopedImport;
}
