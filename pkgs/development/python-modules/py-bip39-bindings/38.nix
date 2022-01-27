{ lib
, python38Packages
, rustPlatform
, fetchFromGitHub
, fetchPypi
}:

let url = "https://files.pythonhosted.org/packages/27/b2/f7fe7b498a2f49743a636ab0780b0dfbbe724316a6f04ae699ba57115c61/py_bip39_bindings-0.1.8-cp38-cp38-manylinux_2_5_x86_64.manylinux1_x86_64.whl";

in python38Packages.buildPythonPackage rec {
  pname = "py_bip39_bindings";
  version = "0.1.8";
  format = "wheel";

  src = builtins.fetchurl {
    inherit url;
    sha256 = "sha256:0r0f9wc72yjzc9d5bg76xzharalg8mnnqr3y7icjqc3blrx9w3jg";
  };



  meta = {
    description = "Python bindings for the tiny-bip39 library";
    homepage = "https://github.com/polkascan/py-ed25519-bindings";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ vourhey ];
  };
}
