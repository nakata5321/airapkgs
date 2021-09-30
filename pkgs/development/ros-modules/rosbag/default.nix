{ lib
, mkRosPackage
, fetchFromGitHub
, python3Packages
, catkin
, cpp_common
, genmsg
, genpy
, rosbag_storage
, rosconsole
, std_srvs
, roscpp
, roscpp_serialization
, roslib
, rospy
, topic_tools
, xmlrpcpp
, pluginlib
, openssl
}:

let
  pname = "rosbag";
  version = "1.14.4";
  rosdistro = "melodic";

in mkRosPackage {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "0qi22bd58wxb786calx8ccg5iyj1b3mn1k6wn6jspz3ajv4hb9h7";
  };

  propagatedBuildInputs =
  [ catkin cpp_common genmsg genpy rosbag_storage rosconsole std_srvs
    roscpp roscpp_serialization roslib rospy topic_tools xmlrpcpp
    pluginlib openssl python3Packages.python-gnupg python3Packages.pycrypto python3Packages.pycryptodomex ];

  meta = with lib; {
    description = "Set of tools for recording from and playing back to ROS topics";
    homepage = http://wiki.ros.org/rosbag;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
