# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="frontcube" #"frontcube" "bira" "intheloop" "jispwoso" "jonathan" gnzh

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    poetry
)

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
source $ZSH/oh-my-zsh.sh

# Aliases
. ~/.zsh_aliases

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

if [ -z "$ZELLIJ_ACTIVE" ] && [ "$TERM_PROGRAM" = "alacritty" ]; then
  ZJ_SESSIONS=$(zellij list-sessions --short)
  NO_SESSIONS=$(echo "${ZJ_SESSIONS}" | wc -l)

  if [ "${NO_SESSIONS}" -ge 2 ]; then
      export ZELLIJ_ACTIVE=1
      zellij attach "$(echo "${ZJ_SESSIONS}" | sk)"
  else
      zellij attach -c
      export ZELLIJ_ACTIVE=1
  fi
fi

if [[ -d $HOME/.local/bin/mise ]]; then
  eval "$($HOME/.local/bin/mise activate zsh)"
fi

if [[ -d $HOME/go/bin/ ]]; then
  export PATH=$PATH:$HOME/go/bin/
fi

export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_HOME=$HOME/Android/Sdk
export EXPO_APPLE_APP_SPECIFIC_PASSWORD="wums-rxce-izup-kmtn"
# CL DEPLOY AWS = np5GoLRjpoB8EezvrsaCPDwBt/IHWtigt94J9ubd
if [[ ! -d $ANDROID_SDK_ROOT ]]; then
  export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
  export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
fi
