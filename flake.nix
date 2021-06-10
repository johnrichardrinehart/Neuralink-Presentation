{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-21.05";
    flake-utils.url = "github:numtide/flake-utils/master";
  };

  outputs = self:
  self.flake-utils.lib.eachDefaultSystem (system:
  let 
    pkgs = self.nixpkgs.legacyPackages.${system};
  in
  rec {
    packages = {
      slides = (import ./.) { inherit pkgs; };
    };
    defaultPackage = packages.slides;
  }
  );
}
