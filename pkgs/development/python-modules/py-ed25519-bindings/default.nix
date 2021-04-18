{ lib
, buildPythonPackage
, rustPlatform
, fetchFromGitHub
, fetchPypi
}:

buildPythonPackage rec {
  pname = "py_ed25519_bindings";
  version = "0.1.2";

  format = "wheel";
  src = fetchPypi {
    # substrate_interface-0.12.3-py3-none-any.whl
    inherit pname version;
    sha256 = "14qhy17knazvpp9sd1xpyamf2fd0xcpq7z3v3mcg06r4p8id9jsq";
    format = "wheel";
    python = "cp38";
    abi = "cp38";
    platform = "manylinux2010_x86_64";

  };



  meta = {
    description = "Python bindings for the ed25519-dalek RUST crate";
    homepage = "https://github.com/polkascan/py-ed25519-bindings";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ Vourhey ];
  };
}

