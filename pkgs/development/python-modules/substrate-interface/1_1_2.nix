{ lib
, buildPythonPackage
, fetchPypi
, scalecodec_1_0_23
, websocket-client-0-58-0 
, py-sr25519-bindings
, py-ed25519-bindings
, py-bip39-bindings
, base58-2_0_1
, requests
, xxhash
, ecdsa
, pycryptodome_3_11_0
, eth-keys_0_3_3
# , python3Packages
}:

let url = "https://files.pythonhosted.org/packages/d9/29/64ff51209e008784cd66d09952d6a956810c4338f56c4e3de2604da5fd83/substrate_interface-1.1.2-py3-none-any.whl";

in buildPythonPackage rec {
  pname = "substrate_interface";
  version = "1.1.2";
  format = "wheel";


  src = builtins.fetchurl {
    inherit url;
    sha256 = "sha256:0wv68qds2z4vyysgcialc893i0zx3sjllfr4qdbmigc8x75vcsdj";

  };

  buildInputs = [
    base58-2_0_1
    requests
    xxhash
    pycryptodome_3_11_0
    eth-keys_0_3_3
  ];

  propagatedBuildInputs =  [
    scalecodec_1_0_23
    websocket-client-0-58-0 
    py-sr25519-bindings
    py-ed25519-bindings
    py-bip39-bindings
    ecdsa
    pycryptodome_3_11_0
  ];  # зависимости

  doCheck=false;
  
  meta = {
    description = "interfacing with a Substrate node version 1.1.2";
    homepage = "https://github.com/polkascan/py-substrate-interface";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ vourhey ];
  };
}