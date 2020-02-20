{ lib
, python3
, python3Packages
}:

python3Packages.buildPythonApplication rec {
  pname = "graphql-core";
  version = "2.3.1";

  propagatedBuildInputs = with python3Packages; [ rx promise ];

  src = python3Packages.fetchPypi {
    inherit version;
    pname  = "graphql-core";
    sha256 = "0yh5zqdh9n2jlbg65ar1d08ysjjvqzalcssx3wkmhjlcmq4zba3l";
  };

  doCheck = false;

  meta = with lib; {
    description = "GraphQL-core 3 is a Python 3.6+ port of GraphQL.js, the JavaScript reference implementation for GraphQL, a query language for APIs created by Facebook.";
    homepage = https://github.com/graphql-python/graphql-core-next;
    license = licenses.mit;
    maintainers = with maintainers; [ vourhey ];
  };
}

