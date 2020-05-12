{ stdenv
, ros_comm
, mkRosPackage
, fetchFromGitHub
, catkin
, genpy
, roscpp
, rosgraph
, rosgraph_msgs
, roslib
, std_msgs
}:

mkRosPackage rec {
  pname = "mqtt_bridge";
  version = "0.1.7";

  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "vourhey";
    repo = "mqtt_bridge";
    rev = "93c48bbf7f2cf0bf6ea8f757520b2a231f6f646e";
    sha256 = "13lh4ndsj1jrbaz79hppznzbsah266nkf8d3lg2cw1s4nqabm6kz";
  };

  propagatedBuildInputs =
  [ catkin ros_comm ];

  meta = with stdenv.lib; {
    description = "MQTT Bridge for ROS";
    homepage = https://github.com/Vourhey/mqtt_bridge http://wiki.ros.org/rospy;
    license = licenses.mit;
    maintainers = [ maintainers.vourhey ];
  };
}
