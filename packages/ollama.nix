{
  services.ollama = {
    enable = true;
    loadModels = [ "deepseek-coder-v2" ];
    # acceleration = "rocm";
  };
}
