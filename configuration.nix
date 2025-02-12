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

  nix.settings.trusted-users = ["jason"];

  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    wget
  ];

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
}
