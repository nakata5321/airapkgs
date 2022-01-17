{ lib, fetchPypi, buildPythonPackage }:

buildPythonPackage rec {
  version = "3.11.0";
  pname = "pycryptodome";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256:1l3a80z3lxcj1q0hzj1d3plavy2d51y4vzcd85zj0zm7yyxrd022";
  };

  meta = with lib; {
    homepage = "https://www.pycryptodome.org/";
    description = "Python Cryptography Toolkit";
    platforms = platforms.unix;
  };
}
