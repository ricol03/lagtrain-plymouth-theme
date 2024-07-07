{
  #description = "Lagtrain Plymouth Theme";
  
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }: {
    packages.x86_64-linux.default = 
    with import nixpkgs { system = "x86_64-linux"; };
    stdenv.mkDerivation {
      pname = "plymouth-theme-lagtrain";
      version = "1.0.0";
      src = ./lagtrain;
      dontBuild = true;
      installPhase = ''
        mkdir -p $out/share/plymouth/themes/lagtrain
        cp * $out/share/plymouth/themes/lagtrain
        find $out/share/plymouth/themes/ -name \*.plymouth -exec sed -i "s@\/usr\/@$out\/@" {} \;
      '';
    };
  };
}
