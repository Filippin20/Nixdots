{
  pkgs,
  inputs,
  ...
}: {
  imports = let
    cfg = ../../nixos;
  in [
    # GNOME, GDM e X11
    "${cfg}/desktop"

    # Configuração do Nix e do local
    "${cfg}/settings"

    # Adicionando programas
    # "${cfg}/programs"

    # Ligando os serviços do sistema
    "${cfg}/services"

    # Configurando audio
    "${cfg}/hardware"

    # Import home-manager's NixOS module
    inputs.home-manager.nixosModules.home-manager
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

  ################
  # Home-manager #
  ################

  home-manager = {
    # Mesmo esquema do nixos no flake.nix
    extraSpecialArgs = {inherit inputs;};
    # Utiliza os pacotes do sistema
    useGlobalPkgs = true;
    # Separa por usuários
    useUserPackages = true;
    # Configura os usuários
    users = {
      # Import your home-manager configuration
      filippo = import ./home.nix;
    };
  };

  # Teclado #
  ###########

  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };

  console.keyMap = "us";
}
