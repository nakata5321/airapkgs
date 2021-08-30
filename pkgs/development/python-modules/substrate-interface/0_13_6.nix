{ lib
, buildPythonPackage
, fetchPypi
, scalecodec_0_11_16
, websocket-client-0-58-0 
, py-sr25519-bindings
, py-ed25519-bindings
, py-bip39-bindings
, base58-2_0_1
, requests
, xxhash
# , python3Packages
}:

let url = "https://files.pythonhosted.org/packages/93/98/b5d7c5d21a0705c026f041dd4d1c73735140e8f9e2582ee661d9c426889a/substrate_interface-0.13.6-py3-none-any.whl";

in buildPythonPackage rec {
  pname = "substrate_interface";
  version = "0.13.6";
  format = "wheel";


  src = builtins.fetchurl {
    inherit url;
    sha256 = "sha256:102bvgpndk8q6rysxp2af8xj7fv1cww6w0wayw8x7yqvc9n85nfv";

  };

  buildInputs = [
    base58-2_0_1
    requests
    xxhash
  ];


  propagatedBuildInputs =  [
    scalecodec_0_11_16
    websocket-client-0-58-0 
    py-sr25519-bindings
    py-ed25519-bindings
    py-bip39-bindings
  ];  # зависимости


  meta = {
    description = "interfacing with a Substrate node version 0.13.8";
    homepage = "https://github.com/polkascan/py-substrate-interface";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ vourhey ];
  };
}