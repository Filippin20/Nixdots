#Configurações do GNOME :)))))))) xD
{pkgs, ...}: {
  # Simplificandon

  # Enable the GNOME Desktop Environment.
  services.xserver.desktopManager.gnome.enable = true;

  # Instalados
  programs.kdeconnect = {
    enable = true;
    # Configurando uma opção comum entre o plasma e o gnome
    #  package = pkgs.gnomeExtensions.gsconnect;
  };
}
