{ stdenvNoCC, sassc }:
stdenvNoCC.mkDerivation {
  pname = "rose-pine-gnome-shell-theme";
  version = "0.0.1";

  src = ./.;

  buildInputs = [
    sassc
  ];

  buildPhase = ''
    sassc -M -t expanded ./gnome-shell.scss > ./gnome-shell.css
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/themes
    cp -a ./gnome-shell.css $out/share/themes
    runHook postInstall
  '';
}
