{ stdenv
, ros_comm
, mkRosPackage
, python3Packages
, python3
, fetchFromGitHub
}:

let
  rev = "0c583342584775e7a81c3f85dfc91748a22fbc78";
  sha256 = "0qh7c4ir75x1xbb89z8vg7c3g3b5d905ycwhliwc9zlarpq8iijw";

in mkRosPackage rec {
  name = "${pname}-${version}";
  pname = "robonomics_comm";
  version = builtins.substring 0 8 rev;

  src = fetchFromGitHub {
    owner = "airalab";
    repo = pname;
    inherit rev sha256;
  };

  propagatedBuildInputs = with python3Packages;
  [ ros_comm web3 voluptuous ipfsapi base58 python-persistent-queue setuptools ];

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
