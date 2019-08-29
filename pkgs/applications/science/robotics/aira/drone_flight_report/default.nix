{ pkgs ? import <nixpkgs> { }
, stdenv
, fetchFromGitHub
, mkRosPackage
, robonomics_comm
}:

mkRosPackage rec {
  name = "${pname}-${version}";
  pname = "drone_flight_report";
  version = "master";

  src = fetchFromGitHub {
    owner = "Vourhey";
    repo = "${pname}";
    rev = "5cff6ef99989172f0ca0e5f6933e1e91538c2a18";
    sha256 = "sha256:1h7yka9lcyddi5nivg3zq9bz9hvi2c3hi9q105m8m3qp1mq5i1gy";
  };

  propagatedBuildInputs = [ robonomics_comm ];

  meta = with stdenv.lib; {
    description = "Service to register a drone flight via Robonmics Network";
    homepage = http://github.com/vourhey/drone_flight_report;
    license = licenses.bsd3;
    maintainers = with maintainers; [ vourhey ];
  };
}

