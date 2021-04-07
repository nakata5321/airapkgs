{ lib, stdenv, fetchFromGitHub, cmake, pkg-config, zlib, jansson }:

stdenv.mkDerivation rec {
  name = "${pname}-${version}";
  pname = "alfred-json";
  version = "0.3.1";

  src = fetchFromGitHub {
    owner = "ffnord";
    repo = pname;
    rev = "v${version}";
    sha256 = "1lxhsfym4pq25p4wzirgvxmmpc1177dzpzs32n19fbqj6328fywn";
  };

  nativeBuildInputs = [ cmake pkg-config ];
  buildInputs = [ zlib jansson ];

  postPatch = ''
    sed -i 's/git describe --always --dirty --tags || //g' CMakeLists.txt
  '';

  meta = {
    homepage = https://github.com/ffnord/alfred-json;
    description = "Simple alfred client with JSON output.";
    license = lib.licenses.gpl2;
    maintainers = with lib.maintainers; [ akru ];
    platforms = with lib.platforms; linux;
  };
}
