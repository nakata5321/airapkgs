{ lib
, python3
, python3Packages
}:

python3Packages.buildPythonApplication rec {
  pname = "trytond";
  version = "5.4.4";

  propagatedBuildInputs = with python3Packages; [
    lxml genshi python-sql dateutil polib passlib relatorio werkzeug wrapt
  ];

  src = python3Packages.fetchPypi {
    inherit version pname;
    sha256 = "1yahhyw4n0pwr2pscnb3pjxvyl5vvf2dsx5bkbarrpmq4gk31310";
  };

  doCheck = false;

  meta = with lib; {
    description = "The server of Tryton";
    homepage = http://www.tryton.org/;
    license = licenses.mit;
    maintainers = with maintainers; [ vourhey ];
  };
}

