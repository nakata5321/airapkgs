{ lib
, buildPythonPackage
, fetchPypi
, pyhamcrest
, pytest-benchmark
, pytestCheckHook
, pythonOlder
}:

let url = "https://files.pythonhosted.org/packages/3c/03/58572025c77b9e6027155b272a1b96298e711cd4f95c24967f7137ab0c4b/base58-2.0.1-py3-none-any.whl";

in buildPythonPackage rec {
  pname = "base58";
  version = "2.0.1";
  format = "wheel";

  src = builtins.fetchurl {
    inherit url;
    sha256 = "0n2hh91h4l44sc4d78gnsm99hyass7n9gly6zy3jjr3b1msxqyj4";
  };
  
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
