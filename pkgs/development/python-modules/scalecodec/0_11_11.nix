{ lib
, buildPythonPackage
, fetchPypi
, more-itertools
, requests
, base58-2_0_1
}:

buildPythonPackage rec {
  pname = "scalecodec";
  version = "0.11.11";
  GITHUB_REF="refs/tags/v0.11.11";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1pb5sihlxn071xh7fmvy134zbji6rl7nhxrynis1qpq0zkwqk3dm";
  };

  propagatedBuildInputs = [ more-itertools requests base58-2_0_1 ];  # зависимости

  meta = {
    description = "Substrate RPCs output scale decodec";
    homepage = "https://polkascan.github.io/py-scale-codec/";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ vourhey ];
  };
}
