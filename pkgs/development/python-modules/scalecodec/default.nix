{ lib
, buildPythonPackage
, fetchPypi
, more-itertools
, requests
, base58
}:

buildPythonPackage rec {
  pname = "scalecodec";
  version = "0.10.72";
  GITHUB_REF="refs/tags/v0.10.72";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1rfdcp2gnvrpyx0bzchh12ir8lh30wqkgjmq2m394zgdjrxfilp0";
  };

  propagatedBuildInputs = [ more-itertools requests base58];  # зависимости
  
  meta = {
    description = "мета";
    homepage = "https://polkascan.github.io/py-scale-codec/";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ Vourhey ];
  };
}
