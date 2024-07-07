# lagtrain-plymouth-theme
Plymouth theme featuring the dance from Osage-chan in the song Lagtrain. First attempt at doing a Plymouth theme + nix flake, I think it turned out well enough.

**Important:** no support currently for password input (for dm-crypt devices)!

## For NixOS users (flake only)
Add the repo to your flake.nix, e.g.:
```lagtrain.url = "github:ricol03/lagtrain-plymouth-theme";```

Next, in the file where you have Plymouth's configuration - be it configuration.nix or another nix file -, add the theme's name and package. It should look something like this:
```
boot.plymouth = {
    enable = true;
    theme = "lagtrain";
    themePackages = [ inputs.lagtrain.packages.x86_64-linux.default ];
};
```

Finally update your flake (```nix flake update <path to your flake>```), and rebuild your system.

**Note:** you might be able to add the theme without a flake setup, but I didn't test that scenario. If you did, please get in touch with me, and I'll add the instructions for that use case!


## For Non-NixOS users (general distro guide)
Download the tar.gz archive from the Releases page. Extract it, and copy the folder to ```/usr/share/plymouth/themes/```.

Depending on the distro, you might need to do different commands to achieve the same result. I would advise you to search the exact manner of setting the theme on your specific distro, but generically;

Check if the theme exists in the required directory with:
```sudo plymouth-set-default-theme -l```

Next, set the theme:
```sudo plymouth-set-default-theme -R lagtrain```

On some distros, particularly Debian-based ones, you must update initramfs:
```sudo update-initramfs -u```

Again, please search your specific distro for how to setup Plymouth correctly with the theme in question. **I'm not responsible for any kind of damage you might do to your Linux installation.**

You should be good to go!
