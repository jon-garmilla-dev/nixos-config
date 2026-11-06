{ config, pkgs, ... }:

{
  system.stateVersion = "24.11";

  environment.variables = {
    EDITOR = "vim";
    VISUAL = "vim";
  };

  programs.command-not-found.enable = false;

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
    interactiveShellInit = ''
      set -g fish_greeting
      fish_vi_key_bindings
    '';
  };

  users.mutableUsers = false;
  users.users.dev = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "libvirtd" "networkmanager" "audio" "video" ];
    hashedPasswordFile = config.sops.secrets.user_password.path;
    shell = pkgs.fish;
  };
  systemd.tmpfiles.rules = [
    "d /home/dev/.ssh 0700 dev users -"
  ];

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
    scrot
    btop
    jq
    fzf
    tealdeer
    dnsutils
    netcat-gnu
    sops
    age
    bitwarden-cli
  ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/var/lib/sops-nix/key.txt";

    secrets = {
      user_password = { neededForUsers = true; };

      # Github / Gitlab  keys 
      github_ssh_key = { owner = "dev"; path = "/home/dev/.ssh/id_ed25519"; };
      github_jon = { owner = "dev"; path = "/home/dev/.ssh/github_jon"; };
      gitlab_deploy_key = { owner = "dev"; path = "/home/dev/.ssh/gitlab_deploy_key"; };

      # Personal Keys
      id_rsa = { owner = "dev"; path = "/home/dev/.ssh/id_rsa"; };
      id_ecdsa = { owner = "dev"; path = "/home/dev/.ssh/id_ecdsa"; };
      id_ecdsa_personal = { owner = "dev"; path = "/home/dev/.ssh/id_ecdsa_personal"; };
      jon_garmilla_storage = { owner = "dev"; path = "/home/dev/.ssh/jon.garmilla.storage"; };

      # Servers Keys
      server_Luyando = { owner = "dev"; path = "/home/dev/.ssh/server_Luyando"; };
      server_phi = { owner = "dev"; path = "/home/dev/.ssh/server_phi"; };
      server_factorio = { owner = "dev"; path = "/home/dev/.ssh/server_factorio"; };
      server_TallerGanzedo = { owner = "dev"; path = "/home/dev/.ssh/server_TallerGanzedo"; };
      server_Ganzedo_Backup = { owner = "dev"; path = "/home/dev/.ssh/server_Ganzedo_Backup"; };
      luyando_server_nuremberg = { owner = "dev"; path = "/home/dev/.ssh/luyando_server_nuremberg"; };
    };
  };
}
