{ lib
, mkRosPackage
, fetchFromGitHub
, catkin
, rosclean
, rosgraph_msgs
, roslib
, rosmaster
, rosout
, rosparam
, rosunit
, python3Packages
}:

let
  pname = "roslaunch";
  version = "1.14.4";
  rosdistro = "melodic";

in mkRosPackage {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "0lagvdsq0vxw5ah8g3m6z6jn0rxgms7rvbs3014kdd1nmb6b0lxz";
  };

  propagatedBuildInputs = [ catkin rosclean rosgraph_msgs roslib
                            rosmaster rosout rosparam rosunit python3Packages.defusedxml ];

  meta = with lib; {
    description = "Tool for easily launching multiple ROS nodes";
    homepage = http://wiki.ros.org/roslaunch;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
