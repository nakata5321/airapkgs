{ lib
, buildPythonPackage
, fetchFromGitHub
, aniso8601_7_0_0
, iso8601
, graphql-core2
, graphql-relay_2_0_1
, pytestCheckHook
, pytest-asyncio
, pytest-benchmark
, pytest-mock
, pytz
, snapshottest
, fetchPypi
}:

buildPythonPackage rec {
  pname = "graphene";
  version = "2.1.8";

  format = "wheel";
  src = fetchPypi {
    inherit pname version;
    sha256 = "15m8qpwjl64k7j6n42jbqxraqvdyp4nlhcxiayzpc6srw41my5h9";
    format = "wheel";
    python = "py2.py3";
    abi = "none";
    platform = "any";

  };

  buildInputs = [ graphql-core2 aniso8601_7_0_0 ];
  propagatedBuildInputs = [
    graphql-relay_2_0_1
  ];

  doCheck = false;

  meta = with lib; {
    description = "GraphQL Framework for Python";
    homepage = "https://github.com/graphql-python/graphene";
    license = licenses.mit;
    maintainers = with maintainers; [ SuperSandro2000 ];
  };
}