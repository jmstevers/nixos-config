{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
    extraConfig.pipewire."92-low-latency".context.properties.default.clock = {
      rate = 48000;
      quantum = 32;
      min-quantum = 32;
      max-quantum = 32;
    };
  };
}
