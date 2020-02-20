{ lib
, python3
, python3Packages
}:

python3Packages.buildPythonApplication rec {
  pname = "promise";
  version = "2.3";

  propagatedBuildInputs = with python3Packages; [ six ];

  src = python3Packages.fetchPypi {
    inherit version;
    pname  = "promise";
    sha256 = "1l4kknj97dj5pxfpsz3ln78x9a843561c740b1m4pfi3qlvq7lfz";
  };

  doCheck = false;

  meta = with lib; {
    description = "This is a implementation of Promises in Python";
    homepage = https://github.com/syrusakbary/promise;
    license = licenses.mit;
    maintainers = with maintainers; [ vourhey ];
  };
}

