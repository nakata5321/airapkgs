{ lib
, python3
, python3Packages
}:

python3Packages.buildPythonApplication rec {
  pname = "pinatapy";
  version = "0.1.1";

  propagatedBuildInputs = with python3Packages; [ requests ];

  src = python3Packages.fetchPypi {
    inherit version;
    pname  = "pinatapy-vourhey";
    sha256 = "1jrpclrlq6c7ycmc8203rr2r4a0dmwcx1qn4482ld5iwchwkzpnc";
  };

  doCheck = false;

  meta = with lib; {
    description = "Non-official Pinata.cloud library.";
    homepage = https://github.com/vourhey/pinatapy;
    license = licenses.bsd3;
    maintainers = with maintainers; [ vourhey ];
  };
}

