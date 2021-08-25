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
  version = "0.8.0a2";

  disabled = isPy27;

  src = fetchPypi {
    inherit pname version;
    sha256 = "0d91h4h2c2zpa9f4fra2nyx8yg7w6qdgi6z72kacf0hbwrgfk00d";
  };

  propagatedBuildInputs = [ multiaddr requests httpx ];
  #patchPhase = ''
  #sed -i 's/0.7.0/0.8.0/' ipfshttpclient/client/__init__.py
  #  '';


  meta = {
    description = "A python client library for the IPFS API.";
    homepage = https://github.com/ipfs/py-ipfs-http-client;
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.akru ];
  };
}
