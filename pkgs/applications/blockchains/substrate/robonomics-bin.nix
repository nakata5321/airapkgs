{ stdenv
, fetchurl
, libgcc
, openssl
}:

let
  arch = if stdenv.hostPlatform.system == "x86_64-linux" then "linux-x86_64"
    else if stdenv.hostPlatform.system == "aarch64-linux" then "linux-aarch64"
    else throw "Encryptr for ${stdenv.hostPlatform.system} not supported!";

  sha256 = if stdenv.hostPlatform.system == "x86_64-linux" then "11h97404vknicy98qha0ccwnjgzl7i14zg0yx1rr1dclq1735ajd"
    else if stdenv.hostPlatform.system == "aarch64-linux" then "1r83v2sm1f7yzpcd6c3sb7sp00i70ffwqm6v4i0sfmx8m3rasgfz"
    else throw "Encryptr for ${stdenv.hostPlatform.system} not supported!";

in stdenv.mkDerivation rec {
   name = "substrate-node-robonomics-bin-${version}";
   version = "0.11";
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
