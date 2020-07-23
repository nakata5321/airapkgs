# This jobset is used to generate a NixOS channel that contains a
# small subset of Nixpkgs, mostly useful for servers that need fast
# security updates.

{ nixpkgs ? { outPath = (import ../lib).cleanSource ./..; revCount = 56789; shortRev = "gfedcba"; }
, stableBranch ? false
, supportedSystems ? [ "x86_64-linux" "aarch64-linux" ]
}:

let

  nixpkgsSrc = nixpkgs; # urgh

  pkgs = import ./.. {};

  lib = pkgs.lib;

  nixos' = import ./release.nix {
    inherit stableBranch;
    inherit supportedSystems;
#    supportedSystems = [ "x86_64-linux" ];
    nixpkgs = nixpkgsSrc;
  };

  nixpkgs' = builtins.removeAttrs (import ../pkgs/top-level/release.nix {
    inherit supportedSystems;
    nixpkgs = nixpkgsSrc;
  }) [ "unstable" ];

in rec {

  nixos = {
    inherit (nixos') channel;
    tests = {
      inherit (nixos'.tests)
        ipv6
        parity
        ipfs;
        #cjdns
        #liability;
    };
  };

  nixpkgs = {
    inherit (nixpkgs')
      tarball
      parity
      #parity-beta
      #polkadot

      ros_comm
      rosserial
      mavros
      dji_sdk

      websocket-star-rendezvous
      webrtc-star

      robonomics_dev
      robonomics_comm
      robonomics_comm-nightly
      robonomics_tutorials
      robonomics-tools;
      #      substrate-node-robonomics;
  };

  tested = lib.hydraJob (pkgs.releaseTools.aggregate {
    name = "nixos-${nixos.channel.version}";
    meta = {
      description = "Release-critical builds for the AIRA channel";
      maintainers = with lib.maintainers; [ akru strdn spd ];
    };
    constituents =
      [
        nixpkgs.tarball
      ]
      ++ lib.collect lib.isDerivation nixos;
  });
}
