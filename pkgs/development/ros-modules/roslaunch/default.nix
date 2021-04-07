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
    sha256 = "0lfmav7by91ibpnlw47jz6fdwb3l903cpfz4c7zs1lzxyjsqf0kg";
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
