{ stdenv
, ros_comm
, mkRosPackage
, python3Packages
, python3
, fetchFromGitHub
}:

let
  rev = "f3916e16714064e36227dbd48f2d23d32fbf62a3";
  sha256 = "12gn7fmwx79qvqav1bmaq3sxir9zd7vb3ppn3valk5r42pyrays2";

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
