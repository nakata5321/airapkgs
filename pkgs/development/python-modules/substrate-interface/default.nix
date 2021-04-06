{ lib
, buildPythonPackage
, fetchPypi
, scalecodec
, py-ed25519-bindings
}:

buildPythonPackage rec {
  pname = "substrate-interface";
  version = "0.12.3";
  GITHUB_REF="refs/tags/v0.12.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "125rgspip6ipyazrzq7la1bda1ivxcpz3bcyixzz78lmy1yyrqfw";
  };

  propagatedBuildInputs = [ scalecodec py-ed25519-bindings];  # зависимости
  

  meta = {
    description = "мета";
    homepage = "https://github.com/polkascan/py-substrate-interface";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ Vourhey ];
  };
}
