{ lib
, buildPythonPackage
, rustPlatform
, fetchPypi
}:

buildPythonPackage rec {
  pname = "py_sr25519_bindings";
  version = "0.1.2";


  format = "wheel";

  src = fetchPypi {
    # py_sr25519_bindings-0.1.2-cp39-cp39-manylinux2010_x86_64.whl
    inherit pname version;
    sha256 = "0dmnngxv6pnsh2qfa5pisnnqc0zzv0xbh3w1q4fy4gj6b29yiakg";
    format = "wheel";
    python = "cp38";
    abi = "cp38";
    platform = "manylinux2010_x86_64";

  };


  meta = {
    description = "мета";
    homepage = "https://github.com/polkascan/py-ed25519-bindings";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ Vourhey ];
  };
}
