{ stdenv
, mkRosPackage
, fetchFromGitHub
, catkin
, cpp_common
, message_generation
, message_runtime
, rosconsole
, roscpp_serialization
, roscpp_traits
, rosgraph_msgs
, roslang
, rostime
, std_msgs
, xmlrpcpp
}:

let
  pname = "roscpp";
  version = "1.14.4";
  rosdistro = "melodic";

in mkRosPackage {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "0vi8hb1ll4qkzqb008nk5144hrmk0khp83i1adj3761cqf5i1zk9";
  };

  propagatedBuildInputs =
  [ catkin cpp_common message_generation message_runtime
    rosconsole roscpp_serialization roscpp_traits rosgraph_msgs
    roslang rostime std_msgs xmlrpcpp ];

  meta = with stdenv.lib; {
    description = "C++ implementation of ROS client library";
    homepage = http://wiki.ros.org/roscpp;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
