{ lib
, buildPythonPackage
, fetchPypi
, python-markdown-math
, markdown
}:

buildPythonPackage rec {
  pname = "substrate-interface";
  version = "1.2.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1ea19458dfca6a4562044e701aa8698089a0c659fc535689ed260f89a04f8d39";
  };

  propagatedBuildInputs = [ python-markdown-math markdown];  # зависимости

  meta = {
    description = "мета";
    homepage = "https://github.com/polkascan/py-substrate-interface";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ Vourhey ];
  };
}