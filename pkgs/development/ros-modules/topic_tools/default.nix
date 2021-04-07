{ lib
, mkRosPackage
, fetchFromGitHub
, cpp_common
, message_generation
, message_runtime
, rosconsole
, roscpp
, rostest
, rostime
, rosunit
, std_msgs
, xmlrpcpp
}:

mkRosPackage rec {
  name = "${pname}-${version}";
  pname = "topic_tools";
  version = "1.14.4";
  rosdistro = "melodic";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "0h1xaz5gs0i0r9pvwxxzv9fpd5gyjjf7r3k5mzp8i8l79jnfg54q";
  };

  propagatedBuildInputs =
  [ cpp_common message_generation message_runtime rosconsole
    roscpp rostest rostime rosunit std_msgs xmlrpcpp ];

  meta = with lib; {
    description = "Tools for directing, throttling, selecting, and otherwise messing with ROS topics";
    homepage = http://wiki.ros.org/topic_tools;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
