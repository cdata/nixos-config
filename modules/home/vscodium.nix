{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      # nix language
      bbenoist.nix
      # nix-shell suport 
      arrterian.nix-env-selector
      # Nix IDE
      jnoortheen.nix-ide
      # Vim-style interaction
      vscodevim.vim
      # Rust
      rust-lang.rust-analyzer
      tamasfe.even-better-toml
      # Python
      ms-python.python

      # Dependency management
      fill-labs.dependi

      # Color themes
      dracula-theme.theme-dracula
      # catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons

      # Automatic comment re-wrapping
      stkb.rewrap

    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # A color theme
      {
        name = "shades-of-purple";
        publisher = "ahmadawais";
        version = "7.3.2";
        sha256 = "sha256-m3S54YzkgAFgeKuhz+39FvkdejpLwMPaxsLCd17iBYM=";
      }
      # WIT
      {
        name = "wit-idl";
        publisher = "bytecodealliance";
        version = "0.3.1";
        sha256 = "sha256-AW+TaVGdXqUxNP0swk6xBNTiFTEn5D2CbF+9LYcTRnU=";
      }
    ];
    userSettings = {
      "update.mode" = "none";
      "extensions.autoUpdate" = false; # This stuff fixes vscode freaking out when theres an update
      "window.titleBarStyle" = "custom"; # needed otherwise vscode crashes, see https://github.com/NixOS/nixpkgs/issues/246509

      "window.menuBarVisibility" = "toggle";
      "editor.fontFamily" = "'Cascadia Code', 'JetBrainsMono Nerd Font', 'SymbolsNerdFont', 'monospace', monospace";
      "terminal.integrated.fontFamily" = "'Cascadia Code', 'JetBrainsMono Nerd Font', 'SymbolsNerdFont'";
      "editor.fontSize" = 14;
      "workbench.colorTheme" = "Shades of Purple";
      "workbench.iconTheme" = "catppuccin-mocha";
      "catppuccin.accentColor" = "lavender";
      "vsicons.dontShowNewVersionMessage" = true;
      "explorer.confirmDragAndDrop" = false;
      "editor.fontLigatures" = true;
      "editor.minimap.enabled" = false;
      "workbench.startupEditor" = "none";

      "rust-analyzer.procMacro.enable" = true;
      "rust-analyzer.cargo.loadOutDirsFromCheck" = true;
      "rust-analyzer.cargo.allFeatures" = false;
      "rust-analyzer.experimental.procAttrMacros" = true;
      "rust-analyzer.inlayHints.enable" = true;

      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
      "editor.formatOnPaste" = true;

      "workbench.layoutControl.type" = "menu";
      "workbench.editor.limit.enabled" = true;
      "workbench.editor.limit.value" = 10;
      "workbench.editor.limit.perEditorGroup" = true;
      "workbench.editor.showTabs" = "single";
      "files.autoSave" = "onWindowChange";
      "explorer.openEditors.visible" = 0;
      "breadcrumbs.enabled" = false;
      "editor.renderControlCharacters" = false;
      "workbench.activityBar.location" = "hidden";
      "workbench.statusBar.visible" = false;
      "editor.scrollbar.verticalScrollbarSize" = 2;
      "editor.scrollbar.horizontalScrollbarSize" = 2;
      "editor.scrollbar.vertical" = "hidden";
      "editor.scrollbar.horizontal" = "hidden";
      "workbench.layoutControl.enabled" = false;

      "editor.mouseWheelZoom" = true;

      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "nix.formatterPath" = "nixpkgs-fmt";
      "nix.serverSettings.nil.formatting.command" = [ "nixpkgs-fmt" ];
    };
    # Keybindings
    keybindings = [
      {
        key = "ctrl+q";
        command = "editor.action.commentLine";
        when = "editorTextFocus && !editorReadonly";
      }
      {
        key = "ctrl+s";
        command = "workbench.action.files.saveFiles";
      }
      {
        key = "ctrl+p";
        command = "-extension.vim_ctrl+p";
        when = "editorTextFocus && vim.active && vim.use<C-p> && !inDebugRepl || vim.active && vim.use<C-p> && !inDebugRepl && vim.mode == 'CommandlineInProgress' || vim.active && vim.use<C-p> && !inDebugRepl && vim.mode == 'SearchInProgressMode'";
      }
    ];
  };
}
