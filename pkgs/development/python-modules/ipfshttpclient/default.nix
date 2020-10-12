{ buildPythonPackage
, fetchPypi
, isPy27
, lib
, multiaddr
, requests
, httpx
}:

buildPythonPackage rec {
  name = "${pname}-${version}";
  pname = "ipfshttpclient";
  version = "0.6.1";

  disabled = isPy27;

  src = fetchPypi {
    inherit pname version;
    sha256 = "160hcczkrnbqwqjx86vri5kvmvn17v01csll1c8w8ifx96r14azv";
  };

  propagatedBuildInputs = [ multiaddr requests httpx ];
  patchPhase = ''
sed -i 's/0.7.0/0.8.0/' ipfshttpclient/client/__init__.py
  '';


  meta = {
    description = "A python client library for the IPFS API.";
    homepage = https://github.com/ipfs/py-ipfs-http-client;
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.akru ];
  };
}
