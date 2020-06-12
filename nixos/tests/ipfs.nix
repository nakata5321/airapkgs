import ./make-test-python.nix ({ pkgs, ...} : {
  name = "ipfs";
  meta = with pkgs.stdenv.lib.maintainers; {
    maintainers = [ mguentner ];
  };

<<<<<<< HEAD
  nodes = {
    adder =
      { ... }:
      {
        services.ipfs = {
          enable = true;
          extraConfig = { Bootstrap = []; };
          gatewayAddress = "/ip4/127.0.0.1/tcp/2323";
          apiAddress = "/ip4/127.0.0.1/tcp/2324";
        };
        networking.firewall.allowedTCPPorts = [ 4001 ];
      };
    getter =
      { ... }:
      {
        services.ipfs = {
          enable = true;
          extraConfig = { Bootstrap = []; };
        };
        networking.firewall.allowedTCPPorts = [ 4001 ];
      };
  };

  testScript = ''
    startAll;
    $adder->waitForUnit("ipfs");
    $getter->waitForUnit("ipfs");

    # wait until api is available
    $adder->waitUntilSucceeds("ipfs --api /ip4/127.0.0.1/tcp/2324 id");
    my $addrId = $adder->succeed("ipfs --api /ip4/127.0.0.1/tcp/2324 id -f=\"<id>\"");
    my $addrIp = (split /[ \/]+/, $adder->succeed("ip -o -4 addr show dev eth1"))[3];

    $adder->mustSucceed("[ -n \"\$(ipfs --api /ip4/127.0.0.1/tcp/2324 config Addresses.Gateway | grep /ip4/127.0.0.1/tcp/2323)\" ]");

    # wait until api is available
    $getter->waitUntilSucceeds("ipfs --api /ip4/127.0.0.1/tcp/5001 id");
    my $ipfsHash = $adder->mustSucceed("echo fnord | ipfs --api /ip4/127.0.0.1/tcp/2324 add | cut -d' ' -f2");
    chomp($ipfsHash);
=======
  nodes.machine = { ... }: {
    services.ipfs = {
      enable = true;
      apiAddress = "/ip4/127.0.0.1/tcp/2324";
    };
  };

  testScript = ''
    start_all()
    machine.wait_for_unit("ipfs")
>>>>>>> upstream/nixos-unstable

    machine.wait_until_succeeds("ipfs --api /ip4/127.0.0.1/tcp/2324 id")
    ipfs_hash = machine.succeed(
        "echo fnord | ipfs --api /ip4/127.0.0.1/tcp/2324 add | awk '{ print $2 }'"
    )

    machine.succeed(f"ipfs cat /ipfs/{ipfs_hash.strip()} | grep fnord")
  '';
})
