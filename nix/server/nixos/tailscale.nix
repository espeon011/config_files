{config, ...}: {
  # Enable Tailscale and open ports in the firewall.
  services.tailscale.enable = true;
  networking.firewall = {
    trustedInterfaces = ["tailscale0"];
    allowedUDPPorts = [config.services.tailscale.port];
    allowedTCPPorts = [8000 5901 5902];
  };
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
