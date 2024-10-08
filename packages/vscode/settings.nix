{
  "workbench.colorTheme" = "Catppuccin Macchiato";
  "workbench.iconTheme" = "catppuccin-macchiato";
  "workbench.settings.applyToAllProfiles" = [ "editor.tabSize" ];

  "catppuccin.italicKeywords" = false;
  "catppuccin.italicComments" = false;

  "editor.formatOnSave" = true;
  "editor.semanticHighlighting.enabled" = true;
  "editor.fontFamily" = "Fira Code";
  "editor.fontLigatures" = true;
  "editor.detectIndentation" = false;
  "editor.minimap.enabled" = false;
  "editor.tabSize" = 4;

  "security.workspace.trust.untrustedFiles" = "open";
  "explorer.confirmPasteNative" = false;

  "git.autofetch" = true;

  "zig.path" = "zig";
  "zig.zls.path" = "zls";
  "zig.initialSetupDone" = true;
  "zig.buildOnSave" = true;
  "zig.zls.warnStyle" = true;

  "json.format.keepLines" = true;

  "html.format.wrapLineLength" = 80;
  "html.format.wrapAttributes" = "force-expand-multiline";

  "[jsonc]" = {
    "editor.defaultFormatter" = "biomejs.biome";
  };
  "[javascript]" = {
    "editor.defaultFormatter" = "biomejs.biome";
  };
  "[typescript]" = {
    "editor.defaultFormatter" = "biomejs.biome";
  };
  "[json]" = {
    "editor.defaultFormatter" = "biomejs.biome";
  };
  "[html]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "[css]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "[nix]" = {
    "editor.tabSize" = 2;
    "editor.defaultFormatter" = "brettm12345.nixfmt-vscode";
  };
  "[typst]" = {
    "editor.tabSize" = 4;
  };

  "prettier.tabWidth" = 4;

  "evenBetterToml.formatter.arrayAutoExpand" = true;
  "evenBetterToml.formatter.arrayTrailingComma" = true;
  "evenBetterToml.formatter.reorderKeys" = true;
  "evenBetterToml.semanticTokens" = true;

  "nix.serverPath" = "nil";
  "nix.formatterPath" = "nixfmt";

  "lean4.input.languages" = [
    "lean4"
    "typ"
  ];

  "tinymist.preview.cursorIndicator" = true;
  "tinymist.formatterMode" = "typstyle";
}
