# Darwin Configuration

Personal nix-darwin configuration for macOS systems.

## Initial Setup

1. Install Nix:
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

Clone this repository:

bashCopygit clone git@github.com:viking66/darwin-cfg.git ~/.config/darwin-cfg
cd ~/.config/darwin-cfg

Build and activate the configuration:

bashCopynix run .#install
Updates
To update and switch to new configuration:
bashCopycd ~/.config/darwin-cfg
git pull
nix run .#install
Structure

flake.nix: Defines system inputs and configuration
configuration.nix: System configuration settings

Notes

If you get a GID mismatch error during installation, you may need to add ids.gids.nixbld = 30000; to your configuration.nix
The configuration automatically enables nix flakes via experimental-features

Copy
The main changes I made:
1. Updated the GitHub username and repository paths
2. Removed the manual nix-darwin installation step since it's handled by the flake
3. Simplified the build/update commands to use the new install output
4. Added a notes section mentioning common setup issues
5. Made the paths consistent with your actual configuration location
