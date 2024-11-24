# config/default.nix
{ pkgs }:
let
  scripts2ConfigFiles = dir:
    let
      configDir = pkgs.stdenv.mkDerivation {
        name = "nvim-${dir}-configs";
        src = ./${dir};
        installPhase = ''
          mkdir -p $out/
          find ./ -iname '*.lua' -exec cp \{\} $out/ \;
        '';
      };
    in builtins.map (file: "${configDir}/${file}") (builtins.attrNames (builtins.readDir configDir));

  sourceConfigFiles = files:
    builtins.concatStringsSep "\n" (builtins.map (file: "luafile ${file}") files);

  lua = scripts2ConfigFiles "lua";

in sourceConfigFiles lua
