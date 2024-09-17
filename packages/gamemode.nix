{
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        renice = 20;
        desiredgov = "performance";
        ioprio = 0;
      };
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 0;
        amd_performance_level = "high";
      };
    };

  };
}
