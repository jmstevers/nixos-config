{
  pkgs,
  name,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  users.users.${name} = {
    shell = pkgs.nushell;
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "gamemode"
    ];
  };

  time.timeZone = "America/Chicago";

  system.stateVersion = "25.05";

  boot.loader.systemd-boot.enable = true;

  hardware.graphics.enable = true;

  environment = {
    systemPackages = with pkgs; [
      easyeffects
      ghostty
      nil
      nixfmt-rfc-style
      nushell
      vesktop
      vscode
      inputs.zen-browser.packages.${hostPlatform.system}.twilight
      prismlauncher
    ];
    variables = {
      XDG_CONFIG_HOME = "/home/${name}/.config";
      SHELL = "/run/current-system/sw/bin/nu";
    };
  };

  programs = {
    steam.enable = true;
    git = {
      enable = true;
      config = {
        init.defaultBranch = "main";
        user = {
          name = "Johnathan Stevers";
          email = "jmstevers@gmail.com";
        };
        url."https://github.com/".insteadOf = [
          "gh:"
          "github:"
        ];
      };
    };
    gamemode = {
      enable = true;
      enableRenice = true;
      settings = {
        general = {
          desiredgov = "performance";
          defaultgov = "schedutil";
          renice = 10;
        };
        gpu = {
          apply_gpu_optimisations = "accept-responsibility";
          gpu_device = 1;
          amd_performance_level = "high";
        };
      };
    };
  };

  services = {
    flatpak.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
    xserver = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      videoDrivers = [ "amdgpu" ];
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };

  security.rtkit.enable = true;

  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
  ];

  catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "macchiato";
  };
}
