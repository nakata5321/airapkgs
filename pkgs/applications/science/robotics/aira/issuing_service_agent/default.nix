{ pkgs ? import <nixpkgs> { }
, stdenv
, fetchFromGitHub
, mkRosPackage
, robonomics_comm
}:

mkRosPackage rec {
  name = "${pname}-${version}";
  pname = "issuing-service-agent";
  version = "master";

  src = fetchFromGitHub {
    owner = "DAO-IPCI";
    repo = "issuing-service-package";
    rev = "e38edc1dcb6e681f6ba8395db909d896248f9a21";
    sha256 = "sha256:1z1xbdwbv51maqqqn0yhs72ry7rpvrvlavd5q7kjpn6x95y0knbl";
  };

  propagatedBuildInputs = [ robonomics_comm ];

  meta = with stdenv.lib; {
    description = "The agent is responsible for checking the data and issuing the green certificates";
    homepage = http://github.com/DAO-IPCI/issuing-service-package;
    license = licenses.bsd3;
    maintainers = with maintainers; [ vourhey ];
  };
}

