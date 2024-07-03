{ pkgs, inputs, ... }:
let
  neovimConfig = pkgs.fetchgit {
    url = "https://github.com/cotw-fabier/kickstart.nvim.git";
    rev = "master";  # Or replace with a specific commit hash or tag
  };
in {
home.packages = with pkgs; [
    neovim  # Ensure neovim is installed
    git
  ];

  home.file.".config/nvim" = {
    source = neovimConfig;
    recursive = true;  # Ensure all files and directories are copied
  };

  # Optional: Install vim-plug or any other dependencies here
  home.sessionVariables = {
    # Environment variables for Neovim if needed
  };


}
