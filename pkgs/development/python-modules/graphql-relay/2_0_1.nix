{ lib, buildPythonPackage, fetchPypi, graphql-core2, pytestCheckHook }:

buildPythonPackage rec {
  pname = "graphql_relay";
  version = "2.0.1";

  format = "wheel";
  src = fetchPypi {
    inherit pname version;
    sha256 = "0gci1phs4g8abym2w6qhy0nc2yhk47ai2dg7swa3195rdnw4qldc";
    format = "wheel";
    python = "py3";
    abi = "none";
    platform = "any";
  };

  propagatedBuildInputs = [ graphql-core2 ];

  checkInputs = [ pytestCheckHook ];

  doCheck = false;

  meta = with lib; {
    description = "A library to help construct a graphql-py server supporting react-relay";
    homepage = "https://github.com/graphql-python/graphql-relay-py/";
    license = licenses.mit;
    maintainers = with maintainers; [ SuperSandro2000 ];
  };
}