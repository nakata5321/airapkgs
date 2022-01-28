{ lib
, mkRosPackage
, fetchFromGitHub
, message_generation
, std_msgs
}:

let

in mkRosPackage rec {
  name = "${pname}-${version}";
  pname = "actionlib_msgs";
  version = "1.12.8";
  rosdistro = "melodic";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "common_msgs-release";
    rev = "release/${rosdistro}/${pname}/${version}-1";
    sha256 = "sha256-oqc/PapJAPLrWxNn+pAiadVHMJW/pFP0BvOuUp+d0Ig=";
  };

  propagatedBuildInputs = [ message_generation std_msgs ];

  meta = with lib; {
    description = "Common messages to interact with an action server and an action client";
    homepage = http://wiki.ros.org/actionlib_msgs;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
