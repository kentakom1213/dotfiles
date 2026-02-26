{ config, pkgs, ... }:

{
  home.username = "komotokenta";
  home.homeDirectory = "/Users/komotokenta";
  home.stateVersion = "24.05";

  home.sessionVariables = {
    LANG = "ja_JP.UTF-8";
    LC_ALL = "ja_JP.UTF-8";
    EDITOR = "vim";
  };

  home.packages = with pkgs; [
    ripgrep
    fd
    bat
    eza
    rm-improved
    yazi
    nodejs_24
  ];

  programs.gpg.enable = true;

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

  programs.starship = {
    enable = true;
    settings = {};
  };

  programs.neovim.enable = true;

  programs.zellij.enable = true;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    # cd を置き換える
    options = [ "--cmd" "cd" ];
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
      source ~/.config/home-manager/zshinit.sh
    '';
  };

  home.file = {
  };

  programs.home-manager.enable = true;
  programs.direnv.enable = false;
}
