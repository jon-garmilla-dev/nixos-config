{ pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "es_ES.UTF-8";
  console.keyMap = "es";

  programs.nix-ld.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = "set -g fish_greeting";
  };

  users.users.jon = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "nixos";
    shell = pkgs.fish;
  };

  environment.systemPackages = with pkgs; [
    git
    gcc
    gnumake
    unzip
    wget
    curl
    ripgrep
    fd
    xclip
  ];

  system.stateVersion = "24.11";
}
