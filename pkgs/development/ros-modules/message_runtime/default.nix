{ lib
, mkRosPackage
, fetchFromGitHub
, genmsg
, gencpp
, genpy
, cpp_common
, roscpp_serialization
, roscpp_traits
, rostime
}:

mkRosPackage rec {
  name = "${pname}-${version}";
  pname = "message_runtime";
  version = "0.4.12";
  rosdistro = "melodic";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "${pname}-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "sha256-HoP8ImTvmlfgIm3C0qwAr5njF2HjPQ44kO/srMIFBlY=";
  };

  propagatedBuildInputs =
  [ genmsg gencpp genpy cpp_common roscpp_serialization roscpp_traits rostime ];

  meta = with lib; {
    description = "Package modeling the run-time dependencies for language bindings of messages";
    homepage = http://wiki.ros.org/message_runtime;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
