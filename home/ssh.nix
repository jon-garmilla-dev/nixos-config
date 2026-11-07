{ ... }:

{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Include /run/secrets/ssh_config

      Host github.com
          HostName github.com
          User git
          IdentityFile ~/.ssh/id_ed25519
          IdentitiesOnly yes
    '';
  };
}
