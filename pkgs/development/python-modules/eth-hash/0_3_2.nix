{ lib, fetchPypi, buildPythonPackage, pythonOlder, pytest, pysha3, pycrypto
, pycryptodome_3_11_0
, eth-utils
}:

buildPythonPackage rec {
  pname = "eth-hash";
  version = "0.3.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256:0xjskfa1b11gb4pi1i88h5r07waps0czq2jmm551i25dbv6wwh1z";
  };

  checkInputs = [ pytest ];

  propagatedBuildInputs = [
    pysha3
    pycrypto
    pycryptodome_3_11_0

  ];

  pipInstallFlags = [
    # Circular dependency on eth-utils
    "--no-dependencies"
  ];

  # setuptools-markdown uses pypandoc which is broken at the moment
  preConfigure = ''
    substituteInPlace setup.py --replace \'setuptools-markdown\' ""
  '';

  # Run tests separately because we don't want to run tests on tests/backends/
  # but only on its selected subdirectories. Also, the directories under
  # tests/backends/ must be run separately because they have identically named
  # test files so pytest would raise errors because of that.
  #
  # Also, tests in tests/core/test_import.py are broken so just ignore them:
  # https://github.com/ethereum/eth-hash/issues/25
  # There is a pull request to fix the tests:
  # https://github.com/ethereum/eth-hash/pull/26
#   checkPhase = ''
#     pytest tests/backends/pycryptodome/
#     pytest tests/backends/pysha3/
#     # pytest tests/core/
#   '';
  doCheck=false;
  disabled = pythonOlder "3.5";

  meta = {
    description = "The Ethereum hashing function keccak256";
    homepage = "https://github.com/ethereum/eth-hash";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ jluttine ];
  };
}