{ lib, buildPythonPackage, fetchPypi, flask, python3Packages }:

buildPythonPackage rec {
  pname = "graphql-server-core";
  version = "1.2.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "04dxzl51lhvyk4sphzaspppsj89sirl0asgz95xrz5120gd91vh4";
  };

  propagatedBuildInputs = with python3Packages; [ promise graphql-core ];

  meta = with lib; {
    description = "GraphQL-Server-Core is a base library that serves as a helper for building GraphQL servers or integrations into existing web frameworks using GraphQL-Core";
    homepage = "https://github.com/graphql-python/graphql-server-core";
    license = licenses.mit;
    maintainers = with maintainers; [ vourhey ];
  };
}
