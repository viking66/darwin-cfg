{ config, pkgs, ... }:

{
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

  security.pam.enableSudoTouchIdAuth = true;

  system.defaults = {
    NSGlobalDomain = {
      AppleICUForce24HourTime = true;
      AppleInterfaceStyle = "Dark";
      AppleShowScrollBars = "Automatic";
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
      ShowDate = true;
      ShowSeconds = true;
    };

    screencapture.location = "~/Downloads/screenshots";
    
    screensaver.askForPassword = true;

    trackpad.TrackpadRightClick = true;
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

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = 5;
}
