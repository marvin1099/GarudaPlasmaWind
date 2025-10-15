## GarudaPlasmaWind

My default setup for new users on KDE Plasma (mainly for Garuda).  
Makes Plasma feel a bit more like Windows to ease the transition.

## Fast setup
First Open the terminal or the console then:  
 
Quick one‑line download-and-run (recommended if you trust this repo):
- curl:
```
bash -c "$(curl -fsSL https://codeberg.org/marvin1099/GarudaPlasmaWind/raw/branch/main/download-and-set-settings.sh)"
```

### Log out and log back in to activate the settings.

Quick one‑liner with review (this lets you check the script before running and then use y/N):
- curl:
```
bash -c 'curl -fsSL https://codeberg.org/marvin1099/GarudaPlasmaWind/raw/branch/main/download-and-set-settings.sh -o /tmp/download-and-set-settings.sh && less /tmp/download-and-set-settings.sh && read -p "Run the script? (y/N) " ans && [ "$ans" = "y" ] && bash /tmp/download-and-set-settings.sh'
```

### Log out and log back in to activate the settings.

## Manual setup
1. Download the script (it named download-and-set-settings.sh and usually saved to ~/Downloads):
- [Download from Codeberg (main repo) releases](https://codeberg.org/marvin1099/GarudaPlasmaWind/releases)
- [Download from GitHub (backup repo) releases](https://github.com/marvin1099/GarudaPlasmaWind/releases)

### Cli method
2. Inspect the script:
```
less ~/Downloads/download-and-set-settings.sh
```
3. Make it executable (optional):
```
chmod +x ~/Downloads/download-and-set-settings.sh
```
4. Run it:
```
bash ~/Downloads/download-and-set-settings.sh
```

### GUI method
2. Right-click the downloaded file → Properties → Permissions.
3. Enable “Is executable” (file execution).
4. Close Properties and double- or single-click the file; confirm “Execute” when prompted.

After running:
- Wait a few seconds for the script to apply configs.

### Log out and log back in to activate the settings.