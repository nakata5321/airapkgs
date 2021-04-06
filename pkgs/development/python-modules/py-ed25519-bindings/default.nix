{ lib
, buildPythonPackage
, rustPlatform
, fetchFromGitHub
, cargoSetupHook
}:

buildPythonPackage rec {
  pname = "py-ed25519-bindings";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "polkascan";
    repo = "py-ed25519-bindings";
    rev = version;
    sha256 = "11n30ldg3y3y6qxg3hbj837pnbwjkqw3nxq6frds647mmmprrd20";
  };

  sourceRoot = "src";
  
  cargoDeps = rustPlatform.fetchCargoTarball {
    inherit (src cargoSetupHook);
    name = "${pname}-${version}";
    hash = "sha256-heOBK8qi2nuc/Ib+I/vLzZ1fUUD/G/KTw9d7M4Hz5O0=";
  };

  format = "pyproject";

  nativeBuildInputs = with rustPlatform; [ maturinBuildHook cargoSetupHook ];

  meta = {
    description = "мета";
    homepage = "https://github.com/polkascan/py-ed25519-bindings";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ Vourhey ];
  };
}