{ stdenv
, fetchFromGitHub
, rustPlatform
, llvmPackages
, pkgconfig
, openssl
, clang
}:

rustPlatform.buildRustPackage rec {
  name = "${pname}-${version}";
  pname = "substrate-node-robonomics";
  version = "0.10.0";

  src = fetchFromGitHub {
    owner = "airalab";
    repo = "substrate-node-robonomics";
    rev = "v${version}";
    sha256 = "198qg8i7bssn60wddhbdrpilg5j209xydg1k5mldfr7nbsn8bs3n";
  }; 

  cargoSha256 = "11chizn479h94iisrgfkiijymd1ficq9zyppvxkwlf4a9ji8d2z1";

  buildInputs = [ pkgconfig openssl openssl.dev clang ];
  LIBCLANG_PATH = "${llvmPackages.libclang}/lib";

  meta = with stdenv.lib; {
    description = "Robonomics on Substrate";
    homepage = https://github.com/airalab/substrate-node-robonomics;
    license = licenses.asl2;
    maintainers = [ maintainers.akru ];
    platforms = platforms.linux;
  };
}
