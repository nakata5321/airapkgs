{ lib
, mkRosPackage
, fetchFromGitHub
, catkin
, cpp_common
, console_bridge
, roscpp_serialization
, roscpp_traits
, roslz4
, bzip2
, rostime
, pluginlib
, gpgme
, openssl
, std_msgs
}:

let
  pname = "rosbag_storage";
  version = "1.14.4";
  rosdistro = "melodic";

in mkRosPackage {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "sha256-euIauiSLzmWQCDgvCOFM7b+q2/SWtZbg7Txe+ppdPj4=";
  };

  propagatedBuildInputs = [ catkin cpp_common console_bridge roscpp_serialization
                            roscpp_traits roslz4 bzip2 rostime
                            pluginlib gpgme openssl std_msgs ];

  meta = with lib; {
    description = "This is a set of tools for recording from and playing back ROS message without relying on the ROS client library";
    homepage = http://wiki.ros.org/rosbag_storage;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
