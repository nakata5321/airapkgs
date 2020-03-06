{ stdenv
, mkRosPackage
, fetchFromGitHub
, catkin
, rosgraph
, rostopic
}:

let
  pname = "rosnode";
  version = "1.14.4";
  rosdistro = "melodic";


in mkRosPackage {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "1yn772yprx9csvpmbabd5lpmry924nzxfaj709nmf3z9g35kxldg";
  };

  propagatedBuildInputs = [ catkin rosgraph rostopic ];

  meta = with stdenv.lib; {
    description = "Command-line tool for displaying debug information about ROS Nodes";
    homepage = http://wiki.ros.org/rosnode;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
