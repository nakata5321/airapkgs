{ lib
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
    sha256 = "1ciddabnakxfay0ayhibqnx62w0ihiqvdlrsip960ky624khr2ln";
  };

  propagatedBuildInputs = [ catkin cpp_common rostime ];

  meta = with lib; {
    description = "C++ implementation of the XML-RPC protocol";
    homepage = http://wiki.ros.org/xmlrpcpp;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
