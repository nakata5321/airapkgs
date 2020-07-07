{ stdenv
, ros_comm
, mkRosPackage
, python3Packages
, python3
, fetchFromGitHub
}:

let
  rev = "b41274a8130cdb8425b01ff62e26731ad6e908ee";
  sha256 = "1ifxh3mfkhrwwqzzw35lk2psik0zaq0sf37xb8gjz0rji20z9pgv";

in mkRosPackage rec {
  name = "${pname}-${version}";
  repo = "robonomics_comm";
  pname = "robonomics_comm-nightly";
  version = builtins.substring 0 8 rev;

  src = fetchFromGitHub {
    owner = "airalab";
    repo = "${repo}";
    inherit rev sha256;
  };

  propagatedBuildInputs = with python3Packages;
  [ ros_comm web3 voluptuous ipfsapi ipfshttpclient base58 python-persistent-queue setuptools ];

  postInstall = ''
    patch $out/lib/${python3.libPrefix}/site-packages/ethereum_common/msg/_UInt256.py $src/ethereum_common/msg/_UInt256.py.patch
  '';

  meta = with stdenv.lib; {
    description = "Robonomics communication stack";
    homepage = http://github.com/airalab/robonomics_comm;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
