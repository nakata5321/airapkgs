{ lib
, mkRosPackage
, fetchFromGitHub
, catkin
, genpy
, rosgraph
, roslib
, rosmsg
, rospy
}:

let
  pname = "rosservice";
  version = "1.14.4";
  rosdistro = "melodic";

in mkRosPackage {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "1ad2pq4c3p2as6gkgkvk9vj9lznbsdciikzr73yn42pd3mjx2j38";
  };

  propagatedBuildInputs = [ catkin genpy rosgraph roslib rosmsg rospy ];

  meta = with lib; {
    description = "Command-line tool for listing and querying ROS Services";
    homepage = http://wiki.ros.org/rosservice;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
