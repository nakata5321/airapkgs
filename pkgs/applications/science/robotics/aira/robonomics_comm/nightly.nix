{ stdenv
, ros_comm
, mkRosPackage
, python3Packages
, python3
, fetchFromGitHub
}:

let
  rev = "01bb95914c51c1855224011055f869063b5cbc81";
  sha256 = "0mpx2mhi3cwnqpcwgq737k3vx2hjj3p1h0j49xa577vdkbphwzqw";

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
