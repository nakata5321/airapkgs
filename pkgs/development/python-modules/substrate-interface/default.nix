{ lib
, buildPythonPackage
, fetchPypi
, scalecodec
, websocket_client
, py-sr25519-bindings
, py-ed25519-bindings
, py-bip39-bindings
, base58-2_0_1
, requests
, xxhash
#, python3Packages
}:

buildPythonPackage rec {
  pname = "substrate_interface";
  version = "0.12.3";
  GITHUB_REF="refs/tags/v0.12.3";

  src = fetchPypi {
    # substrate_interface-0.12.3-py3-none-any.whl
    inherit pname version;
    sha256 = "1y4fyw4q9f1g6q0zbx9r556zp3hzj9v9mmilcd43kwgq7zcdz9dz";
    format = "wheel";
    python = "py3";
    abi = "none";
    platform = "any";

  };

  buildInputs = [
    base58-2_0_1
    requests
    xxhash
  ];

  format = "wheel";

  propagatedBuildInputs =  [
    scalecodec
    websocket_client
    py-sr25519-bindings
    py-ed25519-bindings
    py-bip39-bindings
  ];  # зависимости


  meta = {
    description = "interfacing with a Substrate node";
    homepage = "https://github.com/polkascan/py-substrate-interface";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ Vourhey ];
  };
}

