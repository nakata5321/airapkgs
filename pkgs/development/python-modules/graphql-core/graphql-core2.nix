{ buildPythonPackage
, fetchFromGitHub
, lib

, coveralls
, promise
, pytest
, pytest-benchmark
, pytest-mock
, rx161
, six
}:

buildPythonPackage rec {
  pname = "graphql-core";
  version = "2.3.2";

  src = fetchFromGitHub {
    owner = "graphql-python";
    repo = "graphql-core-legacy";
    rev = "v${version}";
    sha256 = "0hy7ixxlc17g7bs97fdj687ba35nvq53kyhiv90h8h302gzvx0r3";
  };

  propagatedBuildInputs = [
    promise
    rx161
    six
  ];

  checkInputs = [
    coveralls
    pytest
    pytest-benchmark
    pytest-mock
  ];

  checkPhase = "pytest";

  configurePhase = ''
    substituteInPlace setup.py \
      --replace 'pytest-mock==1.2' 'pytest-mock==1.13.0' \
      --replace 'pytest-benchmark==3.0.0' 'pytest-benchmark==3.2.2'
  '';

  meta = with lib; {
    description = "Port of graphql-js to Python";
    homepage = "https://github.com/graphql-python/graphql-core";
    license = licenses.mit;
    maintainers = with maintainers; [
      kamadorueda
    ];
  };
}
