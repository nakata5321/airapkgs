{ buildPythonPackage
, fetchPypi
, requests
, isPy27
, lib
}:

buildPythonPackage rec {
  name = "${pname}-${version}";
  pname = "ipfsapi"; 
  version = "0.4.4";

  disabled = isPy27;

  src = fetchPypi {
    inherit pname version;
    sha256 = "17ddd54dxvvqc7a7bx0w8jp9bjcfik120lkks9nk4ph4mcn5zplg";
  };

  propagatedBuildInputs = [ requests ];

  meta = {
    description = "A python client library for the IPFS API.";
    homepage = https://github.com/ipfs/py-ipfs-api;
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.akru ];
  };
}
