{ config, lib, pkgs, ... }:

{
  home.username = "powell";
  home.homeDirectory = "/home/powell";

  home.stateVersion = "24.05";

  home.sessionVariables = {
    LANG = "ja_JP.UTF-8";
    LC_ALL = "ja_JP.UTF-8";
    EDITOR = "vim";
    N_PREFIX = "$HOME/.n";
  };

  home.packages = [
    pkgs.glibcLocales
    pkgs.ripgrep
    pkgs.fd
    pkgs.bat
    pkgs.eza
    pkgs.yazi
    pkgs.fzf
    pkgs.nodejs_20
    pkgs.wrangler
  ];

  programs.git = {
    enable = true;
    userName = "kentakom1213";
    userEmail = "kentakom1213@gmail.com";
    extraConfig = {
      core.editor = "vim";
      init.defaultBranch = "main";
    };
  };

  # codex cli
  home.file.".local/bin/codex".text = ''
    #!/usr/bin/env bash
    exec ${pkgs.nodejs_20}/bin/npx @openai/codex "$@"
  '';
  home.file.".local/bin/codex".executable = true;

  programs.mcfly = {
    enable = true;
    enableZshIntegration = true;
  };

  # programs.starship.enable = true;
  # programs.neovim.enable = true;

  programs.zsh = {
    enable = true;
    defaultKeymap = "emacs";
    dotDir = ".config/zsh";

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    envExtra = ''
      source ~/.config/home-manager/zshenv.sh
    '';

    initExtra = ''
      source ~/.config/home-manager/zshinit.sh

      if [ -f "$HOME/.zsh/spaceship/spaceship.zsh" ]; then
        source "$HOME/.zsh/spaceship/spaceship.zsh"
      fi
    '';
  };

  home.activation.installSpaceshipPrompt = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d "$HOME/.zsh/spaceship/.git" ]; then
      mkdir -p "$HOME/.zsh"
      ${pkgs.git}/bin/git clone --depth=1 \
        https://github.com/spaceship-prompt/spaceship-prompt.git \
        "$HOME/.zsh/spaceship"
    fi
  '';

  # programs.direnv.enable = true;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    # cd を置き換える
    options = [ "--cmd" "cd" ];
  };

  programs.zellij = {
    enable = true;
    enableZshIntegration = false;
  };

  programs.home-manager.enable = true;
}
