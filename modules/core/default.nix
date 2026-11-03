{ pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # AQUÍ: Permite software propietario (VSCode, Postman, etc.)
  nixpkgs.config.allowUnfree = true;

  # Deduplicación de archivos idénticos en disco
  nix.optimise.automatic = true;

  # Soporte de papelera y discos para Dolphin
  services.gvfs.enable = true;

  # Virtualización y Contenedores
  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "es_ES.UTF-8";
  console.keyMap = "es";

  programs.nix-ld.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = "set -g fish_greeting";
  };

  users.users.dev = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "libvirtd" ];
    hashedPassword = "$6$svj9yRoeNvnEHcaj$5FTywfLDOoRg6gTb6UHUeIdW0oQoZzkav2.3uzQJ2V5zGbzviZQvFbuAP0nIwDyOKFYE4w3/2cm8Xo9yqjak/0";
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
