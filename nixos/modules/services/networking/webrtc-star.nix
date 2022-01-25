{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.webrtc-star;
in

{

  ###### interface

  options = {

    services.webrtc-star = {

      enable = mkEnableOption "Enable LibP2P WebRTC star signalling server service"; 

      port = mkOption {
        type = types.int;
        default = 9090;
        description = "Specify a port number server to listen to. Default: 9090";
      };

      host = mkOption {
        type = types.str;
        default = "127.0.0.1";
        description = "Specify a host address  server to listen to. Default: 127.0.0.1";
      };
    };
  };


  ###### implementation

  config = mkIf config.services.webrtc-star.enable {

    systemd.services.webrtc-star =
      {
        description = "LibP2P WebRTC star signalling server";
        after = [ "network.target" ];
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
          User = "nobody";
          ExecStart = "${pkgs.libp2p-webrtc-star-signalling-server}/bin/webrtc-star --port=${toString cfg.port} --host=${toString cfg.host}";
          Restart = "always";
        };
      };

  };

}
