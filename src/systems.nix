{ attrs, ... }:
rec {
  # contains the list of systems that are currently supported
  # by the NixOS project.
  default = [
    "x86_64-linux"
    "i686-linux"
    "x86_64-darwin"
    "aarch64-linux"
  ];

  # creates a generator for the given systems
  mkForAll = systems: f: attrs.gen systmes f;

  # a generator for all the default systems
  defaultForAll = mkForAll default;
}
