{ stdenv
, fetchurl
, libgcc
, openssl
}:

let
  arch = if stdenv.hostPlatform.system == "x86_64-linux" then "linux-x86_64"
    else if stdenv.hostPlatform.system == "aarch64-linux" then "linux-aarch64"
    else throw "Encryptr for ${stdenv.hostPlatform.system} not supported!";

  sha256 = if stdenv.hostPlatform.system == "x86_64-linux" then "1z1ykm1nzcijgjjcgwajyvywqr1xkbqpsxxzlgab2myyg9msrpaj"
    else if stdenv.hostPlatform.system == "aarch64-linux" then "0p2568fprrbfaxg0ci3hlxpd2kl0pz9d0h4yjrl0v524vixhxry4"
    else throw "Encryptr for ${stdenv.hostPlatform.system} not supported!";

in stdenv.mkDerivation rec {
   name = "substrate-node-robonomics-bin-${version}";
   version = "0.13";
   repoUrl = "https://github.com/airalab/substrate-node-robonomics";
   src = fetchurl {
      url = "${repoUrl}/releases/download/v${version}/robonomics-${version}-${arch}.tgz";
      inherit sha256;
   };
  dontBuild = true;
  sourceRoot = ".";
  libPath = stdenv.lib.makeLibraryPath
    [ libgcc
      openssl
      stdenv.cc.cc.lib # libstdc++.so.6
    ];

  phases = "installPhase fixupPhase";

  installPhase = ''
   mkdir -p $out/bin
   tar -xzvf ${src} --directory $out/bin
   chmod +x $out/bin/robonomics
   patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
   --set-rpath "$libPath" $out/bin/robonomics
  '';

   meta = {
      description = "Robonomics on Substrate node";
      homepage = https://github.com/airalab/substrate-node-robonomics;
      license = stdenv.lib.licenses.asl20;
      maintainers = [ "spd - spd@aira.life" ];
      platforms = [ "x86_64-linux" "aarch64-linux" ];
   };
}
