{ stdenv
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
    sha256 = "0a92nkk2fyk37bff0fq2jlr7xi0r4yb2dxzw62vin93is6vzxhjz";
  };

  propagatedBuildInputs = [ catkin genpy rosgraph roslib rosmsg rospy ];

  meta = with stdenv.lib; {
    description = "Command-line tool for listing and querying ROS Services";
    homepage = http://wiki.ros.org/rosservice;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
