{ stdenv
, ros_comm
, mkRosPackage
, python3Packages
, fetchFromGitHub
}:

mkRosPackage rec {
  name = "${pname}-${version}";
  pname = "robonomics_comm";
  version = "1.1.1";

  src = fetchFromGitHub {
    owner = "airalab";
    repo = "robonomics_comm";
    rev = "v${version}";
    sha256 = "1k6357piyzrd2f2mv4x0b0nxdg0j2pvpqvinc9vcbj9aij182q9n";
  };

  propagatedBuildInputs = with python3Packages;
  [ ros_comm web3 base58 voluptuous ipfshttpclient python-persistent-queue setuptools ];

  meta = with stdenv.lib; {
    description = "Robonomics communication stack";
    homepage = http://github.com/airalab/robonomics_comm;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
