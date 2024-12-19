{
  overlay = final: prev:
    let
      dirContents = builtins.readDir ../overlay;
      genPackage = name: {
        inherit name;
        value = final.callPackage (../overlay + "/${name}") { };
      };
      names = builtins.attrNames dirContents;
    in
    builtins.listToAttrs (map genPackage names);
}
