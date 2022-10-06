{ config, pkgs, ... }:

{
    home.username = "jdavidson";
    home.homeDirectory = "/home/jdavidson";
    home.stateVersion = "22.05";

    programs.home-manager.enable = true;

    home.packages = with pkgs; [
    	bat
        neovim
	starship
	tmux
	xsel
    ];
}
