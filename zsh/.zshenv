# User configuration
# environment variables
export ALTERNATE_EDITOR=""
export EDITOR="emacs"
export VISUAL="emacs"

# path
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/opt/flutter/bin

# google chrome
export CHROME_EXECUTABLE="/opt/google/chrome/google-chrome"

# desktop
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=wayland-egl
export QT_WAYLAND_FORCE_DPI=120
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1


# android studio
# android studio has a weird graphical glitch with sway
export _JAVA_AWT_WM_NONREPARENTING=1
export ANDROID_SDK="~/Android/Sdk"
export CAPACITOR_ANDROID_STUDIO_PATH="/opt/android-studio/bin/studio.sh"

# emacs
export EMACS_SOCKET_NAME="/run/user/$(id -u)/emacs/server"
