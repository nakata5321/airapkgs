{ stdenv
, buildPythonPackage
, fetchPypi
, ipaddress
, python
}:

buildPythonPackage rec {
  version = "4.1.2";
  pname = "Inject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0f3sigp4bw4b9q9wngj1a9387h0y71id8bh28lmaa77klxyr3s4c";
  };

  propagatedBuildInputs = [ ];

  meta = with stdenv.lib; {
    homepage = https://github.com/ivankorobkov/python-inject;
    description = "Dependency injection the python way, the good way";
    license = licenses.asl20;
    maintainers = [ maintainers.vourhey ];
  };
}
