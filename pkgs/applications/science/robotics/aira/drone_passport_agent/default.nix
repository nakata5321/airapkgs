{ stdenv
, fetchFromGitHub
, robonomics_comm
, mkRosPackage
, pkgs
}:

mkRosPackage rec {
  name = "${pname}-${version}";
  pname = "drone_passport_agent";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "DistributedSky";
    repo = "${pname}";
    rev = "c783b73d4c184bd1a3c94df31ac4703d768ae319";
    sha256 = "sha256:1lmpmf0ng0l3cjh090fzhvbazdr48zkwflz5znvjbj4fs7mi067m";
  };
  propagatedBuildInputs = [ robonomics_comm pkgs.python37Packages.flask-restful ];

  meta = with stdenv.lib; {
    description = "ROS-enabled drone passport agent";
    homepage = http://github.com/DistributedSky/drone_passport_agent;
    license = licenses.bsd3;
    maintainers = [ maintainers.vourhey ];
  };
}

