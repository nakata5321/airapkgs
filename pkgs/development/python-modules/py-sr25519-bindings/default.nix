{ lib
, buildPythonPackage
, rustPlatform
, fetchPypi
}:

let url = "https://files.pythonhosted.org/packages/a5/87/93b3815113f11bda8b783d63e4248bef8b24e80c47b281d85269fb5e9f12/py_sr25519_bindings-0.1.2-cp39-cp39-manylinux2010_x86_64.whl"; 

in buildPythonPackage rec {
  pname = "py_sr25519_bindings";
  version = "0.1.2";


  format = "wheel";

  src = builtins.fetchurl {
    inherit url;
    sha256 = "sha256:08vps61c80g32hp8pgkxa0s7cbpz6q6fa6mr12nc56pgzbk7ryhd";

  };


  meta = {
    description = "Python bindings for sr25519 library";
    homepage = "https://github.com/polkascan/py-ed25519-bindings";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ vourhey ];
  };
}
