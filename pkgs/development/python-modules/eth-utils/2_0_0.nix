{ lib, fetchFromGitHub, buildPythonPackage, pytestCheckHook, eth-hash_0_3_2, eth-typing,
  cytoolz, hypothesis }:

buildPythonPackage rec {
  pname = "eth-utils";
  version = "2.0.0";

  # Tests are missing from the PyPI source tarball so let's use GitHub
  # https://github.com/ethereum/eth-utils/issues/130
  src = fetchFromGitHub {
    owner = "ethereum";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256:137d7ry1q70z7j923mz420hri9n5bn5d2fa9scpw059nwx2d8sqk";
  };

#   checkInputs = [ pytestCheckHook hypothesis ];
  propagatedBuildInputs = [ eth-hash_0_3_2 eth-typing cytoolz ];

  pythonImportsCheck = [ "eth_utils" ];
  doCheck=false;
  meta = {
    description = "Common utility functions for codebases which interact with ethereum";
    homepage = "https://github.com/ethereum/eth-utils";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ jluttine ];
  };
}
