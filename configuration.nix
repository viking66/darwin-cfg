{ config, pkgs, lib, ... }:

{
  nix.enable = true;
  
  nix.settings = {
    build-users-group = "nixbld";
    experimental-features = "nix-command flakes";
    bash-prompt-prefix = "(nix:$name) ";
    max-jobs = "auto";
    substituters = [
      "https://cache.nixos.org"
      "https://cache.lix.systems"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
    ];
    extra-nix-path = "nixpkgs=flake:nixpkgs";
    trusted-users = [ "jason" ];
    builders-use-substitutes = true;
  };
  
  # Configure the aarch64-linux builder using nix-darwin module
  nix.linux-builder = {
    enable = true;
    maxJobs = 4;
    supportedFeatures = [ "kvm" "benchmark" "big-parallel" ];
    # systems = [ "aarch64-linux" ];
    package = pkgs.darwin.linux-builder-x86_64;
    systems = [ "x86_64-linux" ];
  };

  ids.gids.nixbld = 350;

  networking = {
    computerName = "havoc";
    hostName = "havoc";
  };

  power.sleep = {
    allowSleepByPowerButton = true;
    computer = 20;
    display = 10;
    harddisk = 10;
  };

  programs = {
    nix-index.enable = true;
    zsh.enable = true;
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  system.defaults = {
    NSGlobalDomain = {
      AppleICUForce24HourTime = true;
      AppleInterfaceStyle = "Dark";
      AppleKeyboardUIMode = 3;
      AppleShowScrollBars = "WhenScrolling";
      "com.apple.swipescrolldirection" = false;
      "com.apple.trackpad.scaling" = 2.0;
    };

    controlcenter = {
      BatteryShowPercentage = true;
      Bluetooth = true;
    };

    dock = {
      appswitcher-all-displays = true;
      autohide = true;
      show-recents = false;
      static-only = true;
      tilesize = 26;
    };

    finder = {
      QuitMenuItem = true;
      ShowPathbar = true;
      _FXShowPosixPathInTitle = true;
    };

    loginwindow.GuestEnabled = false;

    magicmouse.MouseButtonMode = "TwoButton";

    menuExtraClock = {
      Show24Hour = true;
      ShowDate = 1;
      ShowSeconds = true;
    };

    screencapture.location = "~/Downloads/screenshots";

    screensaver.askForPassword = true;

    trackpad.TrackpadRightClick = true;

    WindowManager.EnableTiledWindowMargins = false;
  };

  launchd.user.agents.no-finder = {
    command = "${pkgs.coreutils}/bin/killall Finder";
    serviceConfig = {
      RunAtLoad = true;
      KeepAlive = false;
    };
  };

  users.users.jason = {
    name = "jason";
    home = "/Users/jason";
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    wget
  ];

  nix.package = pkgs.nix;
}
