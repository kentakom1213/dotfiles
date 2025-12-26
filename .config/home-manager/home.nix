{ config, pkgs, ... }:

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

  programs.mcfly = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship.enable = true;
  programs.neovim.enable = true;

  programs.zsh = {
    enable = true;
    defaultKeymap = "emacs";
    dotDir = ".config/zsh";

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    envExtra = ''
      source ~/.config/home-manager/zshenv.sh
    '';
  };

  programs.direnv.enable = true;

  programs.zellij = {
    enable = true;
    enableZshIntegration = false;
  };

  programs.home-manager.enable = true;
}
