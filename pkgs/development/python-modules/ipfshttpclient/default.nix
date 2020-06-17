{ buildPythonPackage
, fetchPypi
, isPy27
, lib
, multiaddr
, requests
, fetchFromGitHub
}:

buildPythonPackage {
  pname = "ipfshttpclient";
  version = "0.4.13.2";

  disabled = isPy27;

  src = fetchFromGitHub {
    owner = "ipfs-shipyard";
    repo = "py-ipfs-http-client";
    rev = "5e3edf5f8e9e117738c77b5773c78d7b48942bc2";
    sha256 = "1i3vw1fxck6ail99lm47d8q3g259s0fqsjmjagyfxb5zjvkh30y1";
  };

  propagatedBuildInputs = [ multiaddr requests ];

  patches = [ ./ipfshttpclient.patch ];

  meta = {
    description = "A python client library for the IPFS API.";
    homepage = https://github.com/ipfs/py-ipfs-http-client;
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.akru ];
  };
}
