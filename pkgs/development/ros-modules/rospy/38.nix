{ lib
, mkRosPackage
, fetchFromGitHub
, catkin_38
, genpy
, roscpp
, rosgraph
, rosgraph_msgs
, roslib
, std_msgs
}:

let
  pname = "rospy";
  version = "1.14.4";
  rosdistro = "melodic";

in mkRosPackage {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "00mkq2ac21l9mxfpwl9m1vp7a2r1rpvnnnhzhbl4vs97pq50798c";
  };

  propagatedBuildInputs = [ catkin_38 genpy roscpp rosgraph rosgraph_msgs roslib std_msgs ];

  meta = with lib; {
    description = "Python client library for ROS";
    homepage = http://wiki.ros.org/rospy;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
