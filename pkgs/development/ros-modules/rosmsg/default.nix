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
    sha256 = "06fh7wqq7ijyywl24l7inypha2g064jprbm7x3s3kk6xpm0jmmh6";
  };

  propagatedBuildInputs = [ catkin genmsg rosbag roslib ];

  meta = with lib; {
    description = "Command-line tool for displaying information about ROS Message/Service types";
    homepage = http://wiki.ros.org/rosmsg;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
