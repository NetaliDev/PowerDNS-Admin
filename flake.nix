{
  inputs = {
    # TODO: change to nixos-unstable when fix is there
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system: let
    pkgs = nixpkgs.legacyPackages.${system};
    python-env = (pkgs.python3.withPackages (ps: with ps; [
      flask
      flask-assets
      flask-login
      flask-sqlalchemy
      flask-migrate
      flask-seasurf
      flask-mail
      flask-session
      flask-session-captcha
      flask-sslify
      mysqlclient
      psycopg2
      sqlalchemy
      certifi
      cffi
      configobj
      cryptography
      bcrypt
      requests
      python-ldap
      pyotp
      qrcode
      dnspython
      gunicorn
      itsdangerous
      python3-saml
      pytz
      rcssmin
      rjsmin
      authlib
      bravado-core
      lima
      lxml
      passlib
      pyasn1
      pytimeparse
      pyyaml
      jinja2
      itsdangerous
      webcolors
      werkzeug
      zipp
      zxcvbn
    ]));
  in {
    packages = {
      python-env = python-env;
    };
    devShells.default = pkgs.mkShell {
      buildInputs = [
        python-env
      ];
    };
  });
}
