{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "komotokenta";
  home.homeDirectory = "/Users/komotokenta/";

  home.sessionVariables = {
    LANG = "ja_JP.UTF-8";
    LC_ALL = "ja_JP.UTF-8";
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    pkgs.ripgrep
    pkgs.fd
    pkgs.bat
    pkgs.eza
  ];
  
  programs.gpg = {
      enable = true;
  };

  programs.git = {
    enable = true;
    userName = "kentakom1213";
    userEmail = "kentakom1213@gmail.com";
    extraConfig = {
      core = {
        editor = "vim";
      };
      init = {
        defaultBranch = "main";
      };
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

  programs.neovim = {
    enable = true;
  };

  programs.zsh = {
    enable = true;

    defaultKeymap = "emacs";

    dotDir = ".config/zsh";

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    # .zshenv
    envExtra = ''
      . "$HOME/.cargo/env"
 
      # コマンド履歴
      export SAVEHIST=100000
      export MCFLY_RESULTS=30
      
      # venv - find and activate
      function activate() {
          local venv_dir=`find $PWD -name "activate" | sed -n 1p`
          . $venv_dir
      }
      
      # エイリアス
      alias ls='exa --icons'
      alias tree='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'

      # diff
      alias diff="diff -u --color"
      
      # 競プロ支援ツール
      source $HOME/.config/kyopro/util.sh

      # Rust関係
      export RUST_BACKTRACE=1
      export RUST_LOG=info
      export PATH=$HOME/.cargo/bin:$PATH
      
      # バイナリにパスを通す
      export PATH='/home/powell/.local/bin':$PATH

      # GPG key
      export GPG_TTY=$(tty)
           
      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
      
      # cargo fix と cargo fmt
      alias ff='cargo fix --allow-dirty --allow-staged && cargo fmt'
      
      # rye
      source "$HOME/.rye/env"
      
      # slide
      alias slide-flow='$HOME/Docker/slides/slide-flow/target/release/slide-flow'
    '';

    # .zshlogin
    loginExtra = ''
    '';
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/powell/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
