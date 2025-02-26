 
#Configurações do GNOME :)))))))) xD



{

  pkgs, ...

}:


{

  # Simplificandon


  # Enable the GNOME Desktop Environment.
  services.xserver.desktopManager.gnome.enable = true;

  
  # Instalados
  
  programs.kdeconnect = {
    package = pkgs.gnomeExtensions.gsconnect;
   };





}
