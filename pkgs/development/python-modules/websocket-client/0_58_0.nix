{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, pytestCheckHook
, python-socks
}:

let url = "https://files.pythonhosted.org/packages/08/33/80e0d4f60e84a1ddd9a03f340be1065a2a363c47ce65c4bd3bae65ce9631/websocket_client-0.58.0-py2.py3-none-any.whl";

in buildPythonPackage rec {
  pname = "websocket-client";
  version = "0.58.0";
  format = "wheel";

  src = builtins.fetchurl {
    inherit url;
    sha256 = "sha256:0qxnzdsk50apfmsz05wax6f80dj53z4gs041sa13sk67127xzda4";

  };

  propagatedBuildInputs =  [
    python-socks
  ];  # зависимости


  meta =  with lib; {
    description = "Websocket client for Python";
    homepage = "https://github.com/websocket-client/websocket-client";
    changelog = "https://github.com/websocket-client/websocket-client/blob/v${version}/ChangeLog";
    license = licenses.lgpl21Plus;
    maintainers = with maintainers; [ fab ];
  };
}