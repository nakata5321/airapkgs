{ lib
, buildPythonPackage
, fetchPypi
, more-itertools
, requests
, base58-2_0_1
}:

buildPythonPackage rec {
  pname = "scalecodec";
  version = "0.11.16";
  GITHUB_REF="refs/tags/v0.11.16";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1nmay84fspf04ml1z92g8amczv53skldv1c6jiyiai5fy872qya2";
  };

  propagatedBuildInputs = [ more-itertools requests base58-2_0_1 ];  # зависимости

  meta = {
    description = "Substrate RPCs output scale decodec";
    homepage = "https://polkascan.github.io/py-scale-codec/";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ vourhey ];
  };
}
