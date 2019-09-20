let
  version     = "2.5.8";
  sha256      = "0sqcmawyblszh35x3m1p1xvfh80xi2wf7iclinbq4h2c7jwlzns8";
  cargoSha256 = "1kdy0bnmyqx4rhpq0a8gliy6mws68n035kfkxrfa6cxr2cn53dyb";
in
  import ./parity.nix { inherit version sha256 cargoSha256; }
