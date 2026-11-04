{ pkgs, ... }:

{
  system.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "es_ES.UTF-8";
  console.keyMap = "es";

  networking.networkmanager.enable = true;
  services.resolved.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
    };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    font-awesome
  ];
  services.gvfs.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  programs.nix-ld.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = "set -g fish_greeting fish_vi_key_binding";
  };

  users.users.dev = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "libvirtd" "networkmanager" "audio" "video" ];
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
}
