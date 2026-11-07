{ ... }:

{
  sops = {
    age.keyFile = "/var/lib/sops-nix/key.txt";
    defaultSopsFormat = "yaml";

    defaultSopsFile = ../../secrets/ssh.yaml;

    secrets = {
      user_password = {
        sopsFile = ../../secrets/users.yaml;
        neededForUsers = true;
      };

      ssh_config = {
        owner = "dev";
      };

      github_ssh_key = {
        owner = "dev";
        path = "/home/dev/.ssh/id_ed25519";
      };
      github_jon = {
        owner = "dev";
        path = "/home/dev/.ssh/github_jon";
      };
      gitlab_deploy_key = {
        owner = "dev";
        path = "/home/dev/.ssh/gitlab_deploy_key";
      };

      id_rsa = {
        owner = "dev";
        path = "/home/dev/.ssh/id_rsa";
      };
      id_ecdsa = {
        owner = "dev";
        path = "/home/dev/.ssh/id_ecdsa";
      };
      id_ecdsa_personal = {
        owner = "dev";
        path = "/home/dev/.ssh/id_ecdsa_personal";
      };
      jon_garmilla_storage = {
        owner = "dev";
        path = "/home/dev/.ssh/jon.garmilla.storage";
      };

      server_Luyando = {
        owner = "dev";
        path = "/home/dev/.ssh/server_Luyando";
      };
      server_phi = {
        owner = "dev";
        path = "/home/dev/.ssh/server_phi";
      };
      server_factorio = {
        owner = "dev";
        path = "/home/dev/.ssh/server_factorio";
      };
      server_TallerGanzedo = {
        owner = "dev";
        path = "/home/dev/.ssh/server_TallerGanzedo";
      };
      server_Ganzedo_Backup = {
        owner = "dev";
        path = "/home/dev/.ssh/server_Ganzedo_Backup";
      };
      luyando_server_nuremberg = {
        owner = "dev";
        path = "/home/dev/.ssh/luyando_server_nuremberg";
      };
    };
  };
}
