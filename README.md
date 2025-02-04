# Darwin Configuration

Personal nix-darwin configuration for macOS systems.

## Initial Setup

1. Install Nix:
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

2. Install nix-darwin:
```bash
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer
```

3. Clone this repository:
```bash
git clone git@github.com:jasonrdsouza/darwin-config.git ~/.config/darwin
cd ~/.config/darwin
```

4. Build the configuration:
```bash
darwin-rebuild switch --flake .
```

## Updates

To update and switch to new configuration:
```bash
cd ~/.config/darwin
git pull
darwin-rebuild switch --flake .
```

## Structure

- `flake.nix`: Defines system inputs and configuration
- `configuration.nix`: System configuration settings
