{ lib
, mkRosPackage
, fetchFromGitHub
, catkin
, python3Packages
}:

let
  pname = "rosgraph";
  version = "1.14.4";
  rosdistro = "melodic";


in mkRosPackage {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "sha256-lAV3tP4ZqDhkCPoAwwZU4pg5AUmZ2UBm636qgjFPQs4=";
  };

  propagatedBuildInputs = [ catkin python3Packages.netifaces ];

  meta = with lib; {
    description = "Command-line tool, which prints information about the ROS Computation Graph";
    homepage = http://wiki.ros.org/rosgraph;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
