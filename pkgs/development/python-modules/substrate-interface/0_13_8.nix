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

let url = "https://files.pythonhosted.org/packages/cb/d4/164c1d653bfd8acf96350adce815fe0052551a04c9601ae66b98993617af/substrate_interface-0.13.8-py3-none-any.whl";

in buildPythonPackage rec {
  pname = "substrate_interface";
  version = "0.13.8";
  format = "wheel";


  src = builtins.fetchurl {
    inherit url;
    sha256 = "11q35xi3x827fprplb840a0yh7ihc90n8np2w5pwvp91qpsfq6kk";

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