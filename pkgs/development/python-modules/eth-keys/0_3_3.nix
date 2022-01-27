{ lib
, fetchFromGitHub 
, buildPythonPackage
, eth-utils
}:

let
  pname = "eth-keys";
  version = "0.3.3";
in buildPythonPackage rec {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "${pname}";
    rev = "v${version}";
    sha256 = "sha256:05b2h12y3rhjadbnki7rnhpza3f2ihxhx89ciwxhd7yc7asdw6aq";
  };

  propagatedBuildInputs = [ eth-utils ];

  prePatch = ''
    sed -i '/setuptools-markdown/d' setup.py
  '';
  doCheck=false;
  meta = {
    description = "Common API for Ethereum key operations";
    homepage = https://github.com/ethereum/eth-keys;
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.akru ];
  };
}