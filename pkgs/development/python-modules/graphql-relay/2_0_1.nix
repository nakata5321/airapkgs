{ lib, buildPythonPackage, fetchPypi, graphql-core2, pytestCheckHook }:

buildPythonPackage rec {
  pname = "graphql-relay";
  version = "2.0.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256:1fzsi99bi351kz9hrx3b8rdcxb11w2n9x9qmnah3hfhj0i9nn2w7";
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