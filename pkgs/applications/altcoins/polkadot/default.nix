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
  version = "0.4.3";

  src = fetchFromGitHub {
    owner = "akru";
    repo = "polkadot";
    rev = "v${version}";
    sha256 = "1in9nabgmprz8l8yykdijaq6x8vb54nn7gvpxwcn1w8r8m4rv6r4";
  }; 

  cargoSha256 = "067i8z6w5xc3swn8ldia1l42kpni8xiq0gs3jwr4hhn6fb26x5xd";

  buildInputs = [ pkgconfig openssl openssl.dev clang ];
  LIBCLANG_PATH = "${llvmPackages.libclang}/lib";

  meta = with stdenv.lib; {
    description = "Polkadot Node Implementation";
    homepage = https://polkadot.network;
    license = licenses.gpl3;
    maintainers = [ maintainers.akru ];
    platforms = platforms.linux;
  };
}
