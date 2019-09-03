{ stdenv
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "varint";
  version = "1.0.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "19ac46adalgva1chlh0rxv6cinpikxfd92kabbbfjpmcfwiw1v56";
  };


  meta = with stdenv.lib; {
    description = "A basic varint implementation in python";
    homepage = https://github.com/fmoo/python-varint;
    license = licenses.mit;
    maintainers = [ maintainers.strdn ];
  };
}
