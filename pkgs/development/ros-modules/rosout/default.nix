{ stdenv
, mkRosPackage
, fetchFromGitHub
, catkin
, roscpp
, rosgraph_msgs
}:

let
  pname = "rosout";
  version = "1.14.4";
  rosdistro = "melodic";

in mkRosPackage {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "1vch76vn1rdam7c02lnlqavai90ddngi6hz56xlyj3by306i1nbg";
  };

  propagatedBuildInputs = [ catkin roscpp rosgraph_msgs ];

  meta = with stdenv.lib; {
    description = "System-wide logging mechanism for messages sent to the /rosout topic";
    homepage = http://wiki.ros.org/rosout;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
