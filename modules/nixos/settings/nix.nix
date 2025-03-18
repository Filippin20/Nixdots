{
  # Habilitando pacotes proprietarios
  nixpkgs.config.allowUnfree = true;
  # Habilitando flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
