{ aiohttp
, bottle
, buildPythonPackage
, celery
, certifi
, django
, falcon
, fetchPypi
, flask
, iana-etc
, isPy3k
, libredirect
, pyramid
, rq
, sanic
, sqlalchemy
, stdenv
, tornado
, urllib3
, trytond
}:

buildPythonPackage rec {
  pname = "sentry-sdk";
  version = "0.14.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0ak2m9v6m7989ymaz6gimq8s2mgir0xs3ac76ycaxg309rsyw3j8";
  };

  checkInputs = [ django flask tornado bottle rq falcon sqlalchemy trytond ]
  ++ stdenv.lib.optionals isPy3k [ celery pyramid sanic aiohttp ];

  propagatedBuildInputs = [ urllib3 certifi ];

  meta = with stdenv.lib; {
    homepage = "https://github.com/getsentry/sentry-python";
    description = "New Python SDK for Sentry.io";
    license = licenses.bsd2;
    maintainers = with maintainers; [ gebner ];
  };

  # The Sentry tests need access to `/etc/protocols` (the tests call
  # `socket.getprotobyname('tcp')`, which reads from this file). Normally
  # this path isn't available in the sandbox. Therefore, use libredirect
  # to make on eavailable from `iana-etc`. This is a test-only operation.
  preCheck = ''
    export NIX_REDIRECTS=/etc/protocols=${iana-etc}/etc/protocols
    export LD_PRELOAD=${libredirect}/lib/libredirect.so
  '';
  postCheck = "unset NIX_REDIRECTS LD_PRELOAD";
}
