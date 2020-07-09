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
    sha256 = "1x2va3d2ja7m5jaqy45w9wl04k0m0884da68ad3zdc5z8cgzr7in";
  };

  propagatedBuildInputs = [ catkin rosgraph rostopic ];

  meta = with stdenv.lib; {
    description = "Command-line tool for displaying debug information about ROS Nodes";
    homepage = http://wiki.ros.org/rosnode;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
