{ lib
, mkRosPackage
, fetchFromGitHub
, catkin
, rosgraph
}:

let
  pname = "rosparam";
  version = "1.14.4";
  rosdistro = "melodic";

in mkRosPackage {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "0i7h0gjmbi58xg3mp9d0hcdkp3rpgx11n5kgh8i8dmsqwscfgh16";
  };

  propagatedBuildInputs = [ catkin rosgraph ];

  meta = with lib; {
    description = "Command-line tool for getting and setting ROS Parameters";
    homepage = http://wiki.ros.org/rosparam;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
