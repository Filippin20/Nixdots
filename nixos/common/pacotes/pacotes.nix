{pkgs, ...}: {
  # Adicionando pacotes
  environment.systemPackages = with pkgs; [
    vesktop
    git
    #  minecraft
  ];
}
