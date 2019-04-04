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
  version = "0.4.1";

  src = fetchFromGitHub {
    owner = "paritytech";
    repo = "polkadot";
    rev = "v${version}";
    sha256 = "1nar29h6kpvavv3sd7wh3s6zpxcf8pfz1nl56fkwnhbxqwyp0rql";
  }; 

  cargoSha256 = "17sig942g5xxs5444ckrg6rw8f5h9dsgbmckhj43xhzb09yk6wjh";

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
