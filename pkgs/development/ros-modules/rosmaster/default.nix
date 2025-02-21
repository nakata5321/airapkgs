{ lib
, mkRosPackage
, fetchFromGitHub
, catkin
, rosgraph
}:

let
  pname = "rosmaster";
  version = "1.14.4";
  rosdistro = "melodic";

in mkRosPackage {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "sha256-Hm8YhwhDIh8yL5uxVtZ+w9jpJNF07D54TqcwHF7EnNU=";
  };

  propagatedBuildInputs = [ catkin rosgraph ];

  meta = with lib; {
    description = "ROS Master implementation";
    homepage = http://wiki.ros.org/rosmaster;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
