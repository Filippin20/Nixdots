{
  imports = let
    cfg = ../../modules/home;
  in [
    # Adicionando programas
    "${cfg}/programs"
    "${cfg}/shell"
  ];

  # Comando para rebuildar o sistema junto ao nixos-rebuild
  systemd.user.startServices = "sd-switch";

  # Configurando o home
  home = {
    username = "filippo";
    homeDirectory = "/home/filippo";
    stateVersion = "24.11";
  };
}
