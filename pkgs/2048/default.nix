{ stdenv, lib, stdenv, fetchFromGitHub, ... }:

stdenv.mkDerivation rec {
  pname = "2048";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "cdata";
    repo = "nixos-config";
    rev = "main";
    sha256 = ""; # Replace with the actual hash
  };

  buildInputs = [

  ];

  buildPhase = ''
    make release
  '';

  installPhase = ''
    mkdir -p $out/bin
    make install INSTALL_DIR=$out/bin
    chmod +x $out/bin/2048
  '';
}
