{...}: {
  # Rootless docker
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
}
