{ ... }:
{
  # Returns true for user-defined lambdas
  #
  # a -> Bool
  isType = builtins.isFunction;

  # (b -> c) -> (a -> b) -> a -> c
  compose = f: g: x: f (g x);

  # (a -> b) -> a -> b
  apply = f: a: f a;

  # (a -> a) -> a
  fix = f:
    let x = f x; in x;

  # a -> a
  id = x: x;

  # a -> b -> a
  const = a: b: a;

  # Reverses the two first arguments.
  # (a -> b -> c) -> b -> a -> c
  flip = fn: a: b: fn b a;

  # Returns the set of attributes and defaults for functions that
  # take keyword arguments.
  #
  # fn -> Set
  args = builtins.functionArgs;

  # builtins.genericClosure
}
