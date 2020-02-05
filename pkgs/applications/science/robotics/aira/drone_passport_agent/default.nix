{ stdenv
, fetchFromGitHub
, robonomics_comm
, mkRosPackage
, pkgs
}:

mkRosPackage rec {
  name = "${pname}-${version}";
  pname = "drone_passport_agent";
  version = "0.2.1";

  src = fetchFromGitHub {
    owner = "DistributedSky";
    repo = "${pname}";
    rev = "e5f221a03f63ffeeac2f819b6ad23b7216fc6bcc";
    sha256 = "sha256:0xichhkiw1b4sr3z4arsgpww7r2gwvjl9bv528hsbwpzlxxv1afw";
  };
  propagatedBuildInputs = [ robonomics_comm pkgs.python37Packages.flask-restful ];

  meta = with stdenv.lib; {
    description = "ROS-enabled drone passport agent";
    homepage = http://github.com/DistributedSky/drone_passport_agent;
    license = licenses.bsd3;
    maintainers = [ maintainers.vourhey ];
  };
}

