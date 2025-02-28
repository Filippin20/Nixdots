# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    # ./hardware-configuration.nix

    # Importando vários desktops uhummm
    ../common/desktops/gnome.nix
    ../common/desktops/gdm.nix
    ../common/local/local.nix
    ../common/pacotes/pacotes.nix
    ../common/programas/programas.nix
    ../common/servicos/servicos.nix

    # Importando programas :)
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "carnage"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };

  # Configure console keymap
  console.keyMap = "us";

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.filippo = {
    isNormalUser = true;
    description = "Filippo de Oliveira Barbosa";
    initialPassword = "password";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  # Habilitando flakes

  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.systemPackages = with pkgs; [
  ];

  system.stateVersion = "24.11"; # Did you read the comment?

  # Habilitando pacotes proprietarios
  nixpkgs.config.allowUnfree = true;
}
