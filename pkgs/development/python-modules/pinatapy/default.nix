{ lib
, python3
, python3Packages
}:

python3Packages.buildPythonApplication rec {
  pname = "pinatapy";
  version = "0.1.2";

  propagatedBuildInputs = with python3Packages; [ requests ];

  src = python3Packages.fetchPypi {
    inherit version;
    pname  = "pinatapy-vourhey";
    sha256 = "1fgpx1yykwcb2ni31g5a8nba95yzxxkxxv4h8iwc3gfpxz017k9z";
  };

  doCheck = false;

  meta = with lib; {
    description = "Non-official Pinata.cloud library.";
    homepage = https://github.com/vourhey/pinatapy;
    license = licenses.bsd3;
    maintainers = with maintainers; [ vourhey ];
  };
}

