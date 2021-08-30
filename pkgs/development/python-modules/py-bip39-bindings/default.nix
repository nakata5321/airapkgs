{ lib
, buildPythonPackage
, rustPlatform
, fetchFromGitHub
, fetchPypi
}:

let url = "https://files.pythonhosted.org/packages/70/e8/77546c1ac722d08aa1f0efe8efe5713c101ec22556f72f21fd176db1a61c/py_bip39_bindings-0.1.6-cp39-cp39-manylinux2010_x86_64.whl";

in buildPythonPackage rec {
  pname = "py_bip39_bindings";
  version = "0.1.6";
  format = "wheel";

  src = builtins.fetchurl {
    inherit url;
    sha256 = "sha256:0lkz1vdm3g2qjz6i5zl7vcvhh1r3rdg1scrwwaj93mmw3hqbxssy";
  };



  meta = {
    description = "Python bindings for the tiny-bip39 library";
    homepage = "https://github.com/polkascan/py-ed25519-bindings";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ vourhey ];
  };
}


