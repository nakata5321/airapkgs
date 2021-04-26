{ lib	
, stdenv
, fetchurl
, libgcc
, openssl
, zlib
, systemd
}:

let
  arch = if stdenv.hostPlatform.system == "x86_64-linux" then "x86_64"
    else if stdenv.hostPlatform.system == "aarch64-linux" then "linux-aarch64"
    else throw "Encryptr for ${stdenv.hostPlatform.system} not supported!";

  sha256 = if stdenv.hostPlatform.system == "x86_64-linux" then "00wcjbdwq91nk3znsy12w28fcwz5c53gayillb5cqacsw1zi935k"
    else if stdenv.hostPlatform.system == "aarch64-linux" then "1qbhzx4965icx8ql5fqjba749yd7vyif4p8hw144ln1ys734444f"
    else throw "Encryptr for ${stdenv.hostPlatform.system} not supported!";

in stdenv.mkDerivation rec {
   name = "substrate-node-robonomics-bin-${version}";
   version = "0.28.0";
   repoUrl = "https://github.com/airalab/robonomics";
   src = fetchurl {
      url = "${repoUrl}/releases/download/v${version}/robonomics-${version}-${arch}-unknown-linux-gnu.tar.gz";
      inherit sha256;
   };
  dontBuild = true;
  sourceRoot = ".";
  libPath = lib.makeLibraryPath
    [ libgcc
      openssl
      stdenv.cc.cc.lib # libstdc++.so.6
      zlib
      systemd
    ];

  phases = "installPhase fixupPhase";

  installPhase = ''
   mkdir -p $out/bin
   tar -xf ${src} --directory $out/bin
   chmod +x $out/bin/robonomics
   patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
   --set-rpath "$libPath" $out/bin/robonomics
  '';

   meta = {
      description = "Robonomics on Substrate node";
      homepage = https://github.com/airalab/substrate-node-robonomics;
      license = lib.licenses.asl20;
      maintainers = [ "spd - spd@aira.life" ];
      platforms = [ "x86_64-linux" "aarch64-linux" ];
   };
}
