{ lib
, buildPythonPackage
, rustPlatform
, fetchFromGitHub
, fetchPypi
}:

buildPythonPackage rec {
  pname = "py_bip39_bindings";
  version = "0.1.6";

  format = "wheel";
  src = fetchPypi {
    inherit pname version;
    sha256 = "1xkhhfv5dvpb06ypq98w97i4lmwfiz638c3hihj9wwgjsgzrvdyf";
    format = "wheel";
    python = "cp38";
    abi = "cp38";
    platform = "manylinux2010_x86_64";

  };



  meta = {
    description = "Python bindings for the tiny-bip39 library";
    homepage = "https://github.com/polkascan/py-ed25519-bindings";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ Vourhey ];
  };
}


