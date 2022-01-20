{ lib
, python38Packages
, rustPlatform
, fetchFromGitHub
, fetchPypi
}:

let url = "https://files.pythonhosted.org/packages/51/bd/b52665f34888e0c0ddfd3e0ce621cb1cd994d4b27a8e088e3f66f0d2ce9a/py_ed25519_bindings-1.0.1-cp38-cp38-manylinux_2_5_x86_64.manylinux1_x86_64.whl";
in python38Packages.buildPythonPackage rec {
  pname = "py_ed25519_bindings";
  version = "1.0.1";
  format = "wheel";
  src = builtins.fetchurl {
    inherit url;
    sha256 = "sha256:0g1d4pnc2m55q29zcfbl82vjhpjm5nv9xmxcdq3pljxs72iqg7lm";
  };


  meta = {
    description = "Python bindings for the ed25519-dalek RUST crate";
    homepage = "https://github.com/polkascan/py-ed25519-bindings";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ vourhey ];
  };
}