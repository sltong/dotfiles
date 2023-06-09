# User configuration
# environment variables
export ALTERNATE_EDITOR=""
export EDITOR="emacs"
export VISUAL="emacs"

# path
export PATH=$PATH:~/.local/bin
export PATH=/usr/local/go/bin:$PATH
export PATH=$PATH:/opt/flutter/bin

# go
export PATH=$PATH:$(go env GOPATH)/bin

# google chrome
export CHROME_EXECUTABLE="/opt/google/chrome/google-chrome"

# android studio
# android studio has a weird graphical glitch with sway
export _JAVA_AWT_WM_NONREPARENTING=1
export ANDROID_SDK="~/Android/Sdk"

# emacs
export EMACS_SOCKET_NAME="/run/user/$(id -u)/emacs/server"

# add applications installed through Nix to XDG_DATA_DIRS
# so they will appear in GNOME
XDG_DATA_DIRS=$HOME/.nix-profile/share:$XDG_DATA_DIRS
