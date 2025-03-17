{
  imports = let
    cfg = ../../home;
  in [
    # Adicionando programas
    "${cfg}/programs"
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
