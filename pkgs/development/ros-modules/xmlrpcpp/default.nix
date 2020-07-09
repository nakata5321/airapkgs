{ stdenv
, mkRosPackage
, fetchFromGitHub
, catkin
, cpp_common
, rostime
}:

mkRosPackage rec {
  name = "${pname}-${version}";
  pname = "xmlrpcpp";
  version = "1.14.4";
  rosdistro = "melodic";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "040rc9x58w7f881v2kxksgakdv47m8y3g8pm0fnr9lq2bw4hk7cf";
  };

  propagatedBuildInputs = [ catkin cpp_common rostime ];

  meta = with stdenv.lib; {
    description = "C++ implementation of the XML-RPC protocol";
    homepage = http://wiki.ros.org/xmlrpcpp;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
