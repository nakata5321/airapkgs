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
    sha256 = "0yfaqp76kbdb62hikr5n4jkkfjfmii89grwfy6sw3fmsv5hrap1n";
  };

  checkInputs = [
    pyhamcrest
    pytest-benchmark
    pytestCheckHook
  ];

  pythonImportsCheck = [ "base58" ];

  meta = with lib; {
    description = "Base58 and Base58Check implementation";
    homepage = "https://github.com/keis/base58";
    license = licenses.mit;
    maintainers = with maintainers; [ nyanloutre ];
  };
}

