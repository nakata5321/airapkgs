{ lib
, buildPythonPackage
, fetchPypi
, scalecodec_0_11_16
, websocket_client
, py-sr25519-bindings
, py-ed25519-bindings
, py-bip39-bindings
, base58-2_0_1
, requests
, xxhash
# , python3Packages
}:

buildPythonPackage rec {
  pname = "substrate_interface";
  version = "0.13.8";
  GITHUB_REF="refs/tags/v0.13.8";

  src = fetchPypi {
    # substrate_interface-0.12.3-py3-none-any.whl
    inherit pname version;
    sha256 = "11q35xi3x827fprplb840a0yh7ihc90n8np2w5pwvp91qpsfq6kk";
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
    scalecodec_0_11_16
    websocket_client
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