{ lib
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "py_ed25519_bindings";
  version = "0.1.2";


  src = fetchPypi {
    inherit pname version;
    sha256 = "cb3266cf7863815ed5ba402cc298997f6e7e00e1036d34ea9c31f0bd0a6e8515";
  };

  propagatedBuildInputs = [ ];  # зависимости
  

  meta = {
    description = "мета";
    homepage = "https://github.com/polkascan/py-ed25519-bindings";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ Vourhey ];
  };
}