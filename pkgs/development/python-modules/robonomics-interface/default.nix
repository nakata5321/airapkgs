{ lib
, fetchPypi
, python38Packages
, substrate-interface_1_1_7
, xxhash
, eth-keys_0_3_3

}:

python38Packages.buildPythonPackage rec {
  pname = "robonomics-interface";
  version = "0.2.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256:0djzsihrmm38hynjdl9ysmi7bymh4yz8rhr56caikrgl6qgin9cw";
  };

  buildInputs = [
    substrate-interface_1_1_7
    xxhash
    eth-keys_0_3_3
  ];

  doCheck=false;

  meta = {
    description = "A simple wrapper over https://github.com/polkascan/py-substrate-interface used to facilitate writing code for applications using Robonomics.";
    homepage = "https://github.com/Multi-Agent-io/robonomics-interface";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ tubleronchik ];
  };
}