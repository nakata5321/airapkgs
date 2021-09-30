{ lib
, mkRosPackage
, fetchFromGitHub
, catkin
, lz4
, cpp_common
}:

let
  pname = "roslz4";
  version = "1.14.4";
  rosdistro = "melodic";

in mkRosPackage {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "14clpx27dxcmgm46cr8zf91jxq55sv0yqvnfj66ngqkczh911h89";
  };

  propagatedBuildInputs = [ catkin lz4 cpp_common ];

  meta = with lib; {
    description = "A Python and C++ implementation of the LZ4 streaming format";
    homepage = http://wiki.ros.org/roslz4;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
