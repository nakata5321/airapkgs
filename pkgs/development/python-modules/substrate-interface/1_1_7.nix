{ lib
, python38Packages
, fetchPypi
, scalecodec_1_0_28
, websocket-client-0-58-0 
, py-sr25519-bindings_38
, py-ed25519-bindings_1_0_1
, py-bip39-bindings_38
, base58_38
, requests_38
, xxhash
, ecdsa
, pycryptodome
, eth-keys_0_3_3
, certifi38
# , python3Packages
}:

let url = "https://files.pythonhosted.org/packages/b1/ef/0675e507d98bf7ea08cd1dc928b0c0c304bcc15086a2c849743fb1baa77f/substrate_interface-1.1.7-py3-none-any.whl";

in python38Packages.buildPythonPackage rec {
  pname = "substrate_interface";
  version = "1.1.7";
  format = "wheel";


  src = builtins.fetchurl {
    inherit url;
    sha256 = "sha256:100kxamrcaf2mvlqvbk0pql3bdwm85aim84fdg085hdr6swbl6c7";

  };

  buildInputs = [
    base58_38
    requests_38
    xxhash
    pycryptodome
    eth-keys_0_3_3
    certifi38
  ];

  propagatedBuildInputs =  [
    scalecodec_1_0_28
    websocket-client-0-58-0 
    py-sr25519-bindings_38
    py-ed25519-bindings_1_0_1
    py-bip39-bindings_38
    ecdsa
    pycryptodome
  ];  # зависимости

  doCheck=false;
  
  meta = {
    description = "interfacing with a Substrate node version 1.1.2";
    homepage = "https://github.com/polkascan/py-substrate-interface";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ vourhey ];
  };
}
