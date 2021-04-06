{ lib
, buildPythonPackage
, fetchPypi
, pyhamcrest
, pytest-benchmark
, pytestCheckHook
, pythonOlder
}:

buildPythonPackage rec {
  pname = "base58";
  version = "2.0.1";
  disabled = pythonOlder "3.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0n2hh91h4l44sc4d78gnsm99hyass7n9gly6zy3jjr3b1msxqyj4";
    format = "wheel";
    python = "py3";
    abi = "none";

    platform = "any";
  };

    format = "wheel";
  checkInputs = [
     pyhamcrest
     pytest-benchmark
  #   pytestCheckHook
  ];

  #pythonImportsCheck = [ "base58" ];

  meta = with lib; {
    description = "Base58 and Base58Check implementation";
    homepage = "https://github.com/keis/base58";
    license = licenses.mit;
    maintainers = with maintainers; [ nyanloutre ];
  };
}
