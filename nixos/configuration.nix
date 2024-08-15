{
    inputs,
    outputs,
    lib,
    config,
    pkgs,
    ...
}: {
    imports = [
        ./hardware-configuration.nix
        inputs.home-manager.nixosModules.home-manager
    ];

    nixpkgs.config.allowUnfree = true;

    nix = let
        flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in {
        settings = {
            experimental-features = "nix-command flakes";
            flake-registry = "";
            nix-path = config.nix.nixPath;
        };

        channel.enable = false;

        registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
        nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

    users.users.jmstevers = {
        isNormalUser = true;
        extraGroups = ["networkmanager" "wheel"];
    };

    home-manager = {
        extraSpecialArgs = { inherit inputs outputs; };
        users.jmstevers = import ../home-manager/home.nix;
    };

    system.stateVersion = "24.11";

    boot.kernelPackages = pkgs.linuxPackages_latest;
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.networkmanager.enable = true;
    networking.hostName = "nixos";
    networking.nameservers = [ 
        "208.67.222.222"
        "208.67.220.220"
    ];

    time.timeZone = "America/Chicago";

    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
    };

    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    services.printing.enable = true;

    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = "jmstevers";

    services.displayManager.sddm.wayland.enable = true;

    programs.steam.enable = true;

    programs.gamescope = {
        enable = true;
        capSysNice = true;
    };

    hardware.graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
            rocmPackages.clr.icd
        ];
    };

    environment.variables = {
        ROC_ENABLE_PRE_VEGA = "1";
    };

    systemd.tmpfiles.rules = let
        rocmEnv = pkgs.symlinkJoin {
            name = "rocm-combined";
            paths = with pkgs.rocmPackages; [
                rocblas
                hipblas
                clr
            ];
        };
    in [
        "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
    ];

    services.postgresql = {
        enable = true;
        ensureDatabases = [ "teach_dev" ];
        enableTCPIP = true;
        settings.port = 5432;
        authentication = pkgs.lib.mkOverride 10 ''
            #type database  DBuser  auth-method
            local all       all     trust
            #type database DBuser origin-address auth-method
            # ipv4
            host  all      all     127.0.0.1/32   trust
            # ipv6
            host all       all     ::1/128        trust
        '';
        initialScript = pkgs.writeText "backend-initScript" ''
            CREATE ROLE nixcloud WITH LOGIN PASSWORD 'nixcloud' CREATEDB;
            CREATE DATABASE nixcloud;
            GRANT ALL PRIVILEGES ON DATABASE nixcloud TO nixcloud;
        '';
    };
}
