{ stdenv
, mkRosPackage
, fetchFromGitHub
, message_generation
, message_runtime
, geographic_msgs
, sensor_msgs
}:

mkRosPackage rec {
  name = "${pname}-${version}";
  pname = "mavros_msgs";
  version = "0.32.2";
  rosdistro = "melodic";

  src = fetchFromGitHub {
    owner = "mavlink";
    repo = "mavros-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "096c1vwxd9q93m1jwp1ncfl7v5ahqrslrb4iy27zsa38mmznzmw1";
  };

  propagatedBuildInputs = [ message_generation message_runtime geographic_msgs sensor_msgs ];

  meta = with stdenv.lib; {
    description = "MAVLink extendable communication node messages.";
    homepage = https://github.com/mavlink/mavros;
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = [ maintainers.akru ];
  };
}
