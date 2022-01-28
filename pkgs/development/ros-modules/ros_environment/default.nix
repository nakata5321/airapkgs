{ lib
, mkRosPackage
, fetchFromGitHub
}:

mkRosPackage rec {
  name = "${pname}-${version}";
  pname = "ros_environment";
  version = "1.2.1";
  rosdistro = "melodic";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_environment-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "sha256-xSY21cE/RuCxF+eZiOgVTSPpgUHgIRKGDP9JY82qZl4=";
  };

  propagatedBuildInputs = [ ];

  meta = with lib; {
    description = "The package provides the environment variables `ROS_VERSION`, `ROS_DISTRO`, `ROS_PACKAGE_PATH`, and `ROS_ETC_DIR`.";
    homepage = http://wiki.ros.org/ros_environment;
    license = licenses.asl20;
    maintainers = [ maintainers.akru ];
  };
}
