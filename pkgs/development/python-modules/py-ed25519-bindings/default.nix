{ lib
, buildPythonPackage
, rustPlatform
, fetchFromGitHub
, fetchPypi
}:

let url = "https://files.pythonhosted.org/packages/d6/13/14440c23ca8599f6e023f5c31b4f25e16c08180aaa3bf82d392cd33f6190/py_ed25519_bindings-0.1.2-cp39-cp39-manylinux2010_x86_64.whl";

in buildPythonPackage rec {
  pname = "py_ed25519_bindings";
  version = "0.1.2";

  format = "wheel";
  src = builtins.fetchurl {
    inherit url;
    sha256 = "sha256:0dzmlminb4mw8n7d7xf3hsppr7xaibkl1brk0h4ry33gr9l7d9mm";
  };



  meta = {
    description = "Python bindings for the ed25519-dalek RUST crate";
    homepage = "https://github.com/polkascan/py-ed25519-bindings";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ vourhey ];
  };
}

