{ ... }:
{
  inherit (builtins)
    getEnv
    currentSystem
    currentTime
    ;

  NIX_PATH = builtins.nixPath;
}
