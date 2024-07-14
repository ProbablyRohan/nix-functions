{ pkgs, ... }: {
  writeNushellScript = pkgs.lib.makeOverridable ({ pname, version, src, installPath, ... }:
    pkgs.stdenvNoCC.mkDerivation {
      inherit pname version src;
      dontUnpack = true;
      installPhase = ''
        mkdir $out/bin -p
        echo "#!${pkgs.nushell}/bin/nu" > $out${installPath}
        cat $src |tail -n+2>> $out${installPath}
        chmod +x $out${installPath}
      ''; 
    }
  );
}
