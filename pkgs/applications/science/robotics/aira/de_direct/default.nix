{ stdenv
, fetchFromGitHub
, robonomics_comm
, mkRosPackage
, pkgs
}:

mkRosPackage rec {
  name = "${pname}-${version}";
  pname = "de_direct";
  version = "master";

  src = fetchFromGitHub {
    owner = "airalab";
    repo = "${pname}";
    rev = "a4ee07ffd9a67d805464047ad48a3ed407d8fe34";
    sha256 = "sha256:1sj6n2jix5a48c0q2bkis9bmqhix4mbqps9v5569kwwgyrw62f2b";
  };
  propagatedBuildInputs = [ robonomics_comm pkgs.python37Packages.flask-restful ];

  meta = with stdenv.lib; {
    description = "DE direct";
    homepage = http://github.com/airalab/de_direct;
    license = licenses.bsd3;
    maintainers = [ maintainers.vourhey ];
  };
}

