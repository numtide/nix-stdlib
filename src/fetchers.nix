{ ... }:
# TODO: wrap the fetchers so they look like build-time fetchers.
# TODO: add mappings for github and friends?
{
  git = builtins.fetchGit;
  mercurial = builtins.fetchMercurial;
  tarball = builtins.fetchTarball;
  url = builtins.fetchurl;
  tree = builtins.fetchTree;
}
