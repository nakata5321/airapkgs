{ lib
, mkRosPackage
, fetchFromGitHub
, catkin
, genmsg
, rosbag
, roslib
}:

let
  pname = "rosmsg";
  version = "1.14.4";
  rosdistro = "melodic";

in mkRosPackage {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "0dhcdhxza8mnr02f4isyixb5b6jd93sq0f5acmadyf0h21fsgv73";
  };

  propagatedBuildInputs = [ catkin genmsg rosbag roslib ];

  meta = with lib; {
    description = "Command-line tool for displaying information about ROS Message/Service types";
    homepage = http://wiki.ros.org/rosmsg;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
