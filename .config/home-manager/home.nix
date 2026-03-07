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

  home.packages = with pkgs; [
    vim
    glibcLocales
    ripgrep
    fd
    bat
    eza
    yazi
    fzf
    nodejs_20
    gh
    marp-cli
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
          name = "kentakom1213";
          email = "kentakom1213@gmail.com";
      };
      core = {
        editor = "vim";
        quotepath = false;
      };
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
      source ~/.zshrc
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

  programs.direnv.enable = true;

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
