{ mkDerivation, aeson, async, base, base58string, bytestring
, exceptions, generics-sop, hashable, hpack, pipes, memory, http-conduit
, microlens, monad-control, monad-logger, mtl, optparse-applicative
, unordered-containers, heap, cryptonite, data-default, process, stdenv, text, web3
, fetchFromGitHub
}:

mkDerivation rec {
  pname = "robonomics-tools";
  version = "0.6.0.0";

  src = fetchFromGitHub {
    owner = "airalab";
    repo = pname;
    rev = "v${version}";
    sha256 = "176b0ml5r0fh0f4lmwgkb73v21g2lmqw9wlm9wrmvn5affr87cpj";
  };

  isLibrary = false;
  isExecutable = true;

  preConfigure = "${hpack}/bin/hpack";
  executableHaskellDepends = [
    aeson async base base58string bytestring pipes http-conduit
    unordered-containers cryptonite data-default exceptions generics-sop
    memory microlens monad-control monad-logger mtl hashable
    optparse-applicative process text heap web3
  ];

  homepage = "https://github.com/airalab/robonomics-tools#readme";
  description = "Robonomics.network tools";
  license = stdenv.lib.licenses.bsd3;
  maintainers = with stdenv.lib.maintainers; [ akru ];
}
