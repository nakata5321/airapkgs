{ lib
, stdenv
, fetchFromGitHub
, cmake
, pkg-config
}:

let
  pname = "console_bridge";
  version = "0.3.2";

in stdenv.mkDerivation {
  name = "${pname}-${version}"; 

  src = fetchFromGitHub {
    owner = "ros";
    repo = "${pname}";
    rev = "${version}";
    sha256 = "0yzzi2dx4plflnas7ipn1xpmaw2rcy45wd19da24r31fkv7xjys0";
  };

  nativeBuildInputs = [ cmake pkg-config ];

  meta = with lib; {
    description = "Logging that seamlessly pipes into rosconsole/rosout";
    homepage = http://wiki.ros.org/console_bridge;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
