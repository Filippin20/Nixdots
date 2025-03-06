{pkgs, ...}: {
  imports = [
    # GNOME E GDM
    ../common/desktop/gdm.nix
    ../common/desktop/gnome.nix

    # Configuração do Nix e do local
    ../common/settings/nix.nix
    ../common/settings/locale.nix.nix

    # Adicionando programas
    ../common/programs/git.nix
    ../common/programs/discord.nix
    ../common/programs/firefox.nix
    ../common/programs/kdeconnect.nix

    # Ligando os serviços do sistema
    ../common/services/ssh.nix
    ../common/services/network.nix
    ../common/services/tailscale.nix

    # Configurando audio
    ../common/hardware/audio.nix
  ];

  ###########
  # Sistema #
  ###########

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "carnage";
  system.stateVersion = "24.11";

  ############
  # Usuários #
  ############

  users.users.filippo = {
    isNormalUser = true;
    description = "Filippo de Oliveira Barbosa";
    initialPassword = "password";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
  };

  ###########
  # Teclado #
  ###########

  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };

  console.keyMap = "us";
}
