{...}: {
  # xrdp の音声は pipewire には対応してないので pulseaudio を ON にする -> できなかった
  # hardware.pulseaudio.enable = true;

  # Enable sound with pipewire.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
  };

  security.rtkit.enable = true;
}
