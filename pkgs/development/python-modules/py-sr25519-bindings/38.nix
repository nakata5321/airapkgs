{ lib
, python38Packages
, rustPlatform
, fetchPypi
}:

let url = "https://files.pythonhosted.org/packages/a3/6a/da96376c02c6b11bb1ec84dd225016bcaebd39e73ed0635b39017e0c919a/py_sr25519_bindings-0.1.4-cp38-cp38-manylinux_2_5_x86_64.manylinux1_x86_64.whl"; 

in python38Packages.buildPythonPackage rec {
  pname = "py_sr25519_bindings";
  version = "0.1.4";


  format = "wheel";

  src = builtins.fetchurl {
    inherit url;
    sha256 = "sha256:128fp3wpri7s3hznwb6pr1sv49dlb715p8z8cw3ngigl9dxj9hfi";

  };


  meta = {
    description = "Python bindings for sr25519 library";
    homepage = "https://github.com/polkascan/py-ed25519-bindings";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ vourhey ];
  };
}