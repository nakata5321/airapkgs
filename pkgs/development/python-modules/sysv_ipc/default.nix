{ lib
, python3
, python3Packages
}:

python3Packages.buildPythonApplication rec {
  pname = "sysv_ipc";
  version = "1.0.1";

  propagatedBuildInputs = with python3Packages; [ spidev ];

  src = python3Packages.fetchPypi {
    inherit version;
    pname  = "sysv_ipc";
    sha256 = "1p5lx3yz4p40rfb453m80a4hh8341yp4dki2nhhxz7bq2zfi1zwf";
  };

  doCheck = false;

  meta = with lib; {
    description = "System V IPC primitives (semaphores, shared memory and message queues) for Python";
    homepage = http://semanchuk.com/philip/sysv_ipc/;
    license = licenses.bsd0;
    maintainers = with maintainers; [ vourhey ];
  };
}

