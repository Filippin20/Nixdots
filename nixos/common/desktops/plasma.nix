

  # Configurandon o plasma

{ lib, pkgs, ...}:


{
  

  # Habilitando o plasma
  services.desktopManager.plasma6.enable = true;

  # Habilitando akspass como padrão no plasma
  programs.ssh.askPassword = lib.mkForce "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";





}
