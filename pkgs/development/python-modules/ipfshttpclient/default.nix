{ buildPythonPackage
, fetchPypi
, isPy27
, lib
, multiaddr
, requests
}:

buildPythonPackage rec {
  name = "${pname}-${version}";
  pname = "ipfshttpclient";
  version = "0.4.12";

  disabled = isPy27;

  src = fetchPypi {
    inherit pname version;
    sha256 = "1dwvx0zy53vi4qg9vb5s02krrc5hhm3szd98vbwvyi7y0l89l68a";
  };

  propagatedBuildInputs = [ multiaddr requests ];

  meta = {
    description = "A python client library for the IPFS API.";
    homepage = https://github.com/ipfs/py-ipfs-http-client;
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.akru ];
  };
}
