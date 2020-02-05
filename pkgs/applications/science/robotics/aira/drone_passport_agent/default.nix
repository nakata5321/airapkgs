{ stdenv
, fetchFromGitHub
, robonomics_comm
, mkRosPackage
, pkgs
}:

mkRosPackage rec {
  name = "${pname}-${version}";
  pname = "drone_passport_agent";
  version = "0.2.2";

  src = fetchFromGitHub {
    owner = "DistributedSky";
    repo = "${pname}";
    rev = "628c021240410d02737ed7339137b9a77a0c042d";
    sha256 = "sha256:18l6rgv6gprxqvwic1cwi39a9x9fi7slghk1i1h8h9sgq4036qqn";
  };
  propagatedBuildInputs = [ robonomics_comm pkgs.python37Packages.flask-restful ];

  meta = with stdenv.lib; {
    description = "ROS-enabled drone passport agent";
    homepage = http://github.com/DistributedSky/drone_passport_agent;
    license = licenses.bsd3;
    maintainers = [ maintainers.vourhey ];
  };
}

