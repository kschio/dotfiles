# hide greeting
set fish_greeting

# editor
set -gx EDITOR hx

# disable homebrew analytics
set -x HOMEBREW_NO_ANALYTICS 1

# disable azure function analytics
set -x FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT 1

# expo disable keychain
set -x EXPO_NO_KEYCHAIN 1

# initialize zoxide
zoxide init fish | source

# initialize starship prompt
starship init fish | source

# path modifications
fish_add_path /bin /usr/bin /usr/local/bin
fish_add_path ~/.bun/bin/
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path (npm get prefix)/bin
fish_add_path /opt/homebrew/lib/ruby/gems/2.7.0/bin
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path $HOME/.pnpm
fish_add_path $HOME/.config/emacs/bin

# android sdk
set -x ANDROID_SDK_ROOT $HOME/Library/Android/sdk
fish_add_path $ANDROID_SDK_ROOT/emulator
fish_add_path $ANDROID_SDK_ROOT/platform-tools

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# openjdk
set --export PATH /opt/homebrew/opt/openjdk@17/bin $PATH

# ruby
if test -d /opt/homebrew/opt/ruby/bin
    fish_add_path /opt/homebrew/opt/ruby/bin
    fish_add_path (gem environment gemdir)/bin
end

# helix
set -gx HELIX_RUNTIME $HOME/.config/helix/runtime

# pnpm
set -gx PNPM_HOME /Users/ksch/Library/pnpm
set -gx PATH "$PNPM_HOME" $PATH

# private
source $HOME/.alias
source $HOME/.config/fish/private.fish
