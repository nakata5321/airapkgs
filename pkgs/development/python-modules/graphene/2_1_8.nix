{ lib
, buildPythonPackage
, fetchFromGitHub
, aniso8601
, iso8601
, graphql-core
, graphql-relay
, pytestCheckHook
, pytest-asyncio
, pytest-benchmark
, pytest-mock
, pytz
, snapshottest
}:

buildPythonPackage rec {
  pname = "graphene";
  version = "2_1_8";

  src = fetchFromGitHub {
    owner = "graphql-python";
    repo = "graphene";
    rev = "v${version}";
    sha256 = "sha256-bVCCLPnV5F8PqLMg3GwcpwpGldrxsU+WryL6gj6y338=";
  };

  propagatedBuildInputs = [
    aniso8601
    graphql-core
    graphql-relay
  ];

  doCheck = false;

  meta = with lib; {
    description = "GraphQL Framework for Python";
    homepage = "https://github.com/graphql-python/graphene";
    license = licenses.mit;
    maintainers = with maintainers; [ SuperSandro2000 ];
  };
}