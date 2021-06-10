{ pkgs ? <nixpkgs>}:
let
  repos = {
    reveal = pkgs.fetchgit {
      url = "https://github.com/hakimel/reveal.js.git";
      sha256 = "u3gZ13x40cjK1k9HTNnqRrp3io0tDTu6JPGd05mGJGw=";
    };
  };
in
pkgs.stdenv.mkDerivation {
  name = "Neuralink-Presentation";
  src = ./.;
  buildInputs = [pkgs.nodejs-16_x pkgs.git pkgs.nodePackages.gulp];
  buildPhase = ''
    mkdir -p $out/reveal.js;
    cp -r ${repos.reveal}/* $out/reveal.js;
    cp -r ./src/* $out/reveal.js/;
  '';
  installPhase = ''
    cd $out/reveal.js;
    npm install;
    npm start;
  '';
}
