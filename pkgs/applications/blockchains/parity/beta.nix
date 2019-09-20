let
  version     = "2.6.3";
  sha256      = "1pxx1cqbkv6lc9ibm6h55lsjqz3hnpalqf03jmm43rxy4sqwd1y4";
  cargoSha256 = "1q6cbms7j1h726bvq38npxkjkmz14b5ir9c4z7pb0jcy7gkplyxx";
in
  import ./parity.nix { inherit version sha256 cargoSha256; }
