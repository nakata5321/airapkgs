{ config, ... }:

let
  web3_http_provider = "https://mainnet.infura.io/v3/61518717e71a4f638fefd247f7a6617b";
  web3_ws_provider = "wss://mainnet.infura.io/ws";
  lighthouse = "airalab.lighthouse.5.robonomics.eth";
  factory = "factory.5.robonomics.eth";
  graph_topic = "graph.5.robonomics.eth";
  token = "xrt.5.robonomics.eth";
  ipfs_public_providers="/dns/ipfs.infura.io/tcp/5001/https";
  ipfs_swarm_connect_addresses="/dnsaddr/bootstrap.aira.life";

in {
  # Enable light robot liability service
  services.liability-nightly = {
    enable = true;
    inherit web3_http_provider web3_ws_provider lighthouse factory graph_topic ipfs_public_providers ipfs_swarm_connect_addresses;
  };

  # Set params for XRT
  services.erc20-nightly = {
    enable = true;
    inherit web3_http_provider web3_ws_provider token factory;
  };

  # enable separated roscore nodes
  services.roscore = {
    enable = true;
  };

}
