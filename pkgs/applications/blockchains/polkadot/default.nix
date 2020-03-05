{ stdenv
, fetchFromGitHub
, rustPlatform
, llvmPackages
, pkgconfig
, openssl
, clang
}:

rustPlatform.buildRustPackage rec {
  name = "polkadot-${version}";
  version = "0.4.4";

  src = fetchFromGitHub {
    owner = "akru";
    repo = "polkadot";
    rev = "v${version}";
    sha256 = "1zq2fhpgyhhfjr7hvhpp0lghs76l722mswb1rlxih96kma6xafsj";
  }; 

  # Delete this on next update; see #79975 for details
  legacyCargoFetcher = true;

  cargoSha256 = "0gc3w0cwdyk8f7cgpp9sfawczk3n6wd7q0nhfvk87sry71b8vvwq";

  buildInputs = [ pkgconfig openssl openssl.dev clang ];
  LIBCLANG_PATH = "${llvmPackages.libclang}/lib";

  meta = with stdenv.lib; {
    description = "Polkadot Node Implementation";
    homepage = https://polkadot.network;
    license = licenses.gpl3;
    maintainers = [ maintainers.akru ];
    platforms = platforms.linux;
    broken = true;
  };
}
