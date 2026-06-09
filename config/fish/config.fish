# hide greeting
set fish_greeting

# XDG
set -gx XDG_CONFIG_HOME $HOME/.config

# editor
set -gx EDITOR nvim

# disable homebrew analytics
set -x HOMEBREW_NO_ANALYTICS 1

# disable azure function analytics
set -x FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT 1

# expo disable keychain
set -x EXPO_NO_KEYCHAIN 1

# disable maestro analytics
set -x MAESTRO_CLI_NO_ANALYTICS 1

# disable corepack packageManager auto-pin (turbo+yarn injects it into package.json)
set -x COREPACK_ENABLE_AUTO_PIN 0

# initialize zoxide
zoxide init fish | source

# initialize starship prompt
starship init fish | source

# path modifications
fish_add_path /bin /usr/bin /usr/local/bin
fish_add_path ~/.bun/bin/
fish_add_path $HOME/.cargo/bin
fish_add_path /opt/homebrew/lib/ruby/gems/2.7.0/bin
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path $HOME/.config/nvim/bin
fish_add_path $HOME/.gem/ruby/3.3.0/bin
fish_add_path $HOME/.maestro/bin
fish_add_path $HOME/.local/bin
fish_add_path /Applications/Obsidian.app/Contents/MacOS
fish_add_path /opt/homebrew/opt/mysql/bin
fish_add_path /opt/homebrew/opt/mysql@8.4/bin
fish_add_path /opt/homebrew/opt/libpq/bin

# android sdk
set -x ANDROID_SDK "$HOME/Library/Android/sdk"
set -x PATH "$ANDROID_SDK/emulator" "$ANDROID_SDK/tools" $PATH
set -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -x ANDROID_NDK "$HOME/Library/Android/sdk/ndk/27.1.12297006"
set -x PATH $PATH "$ANDROID_HOME/tools"
set -x PATH $PATH "$ANDROID_HOME/tools/bin"
set -x PATH $PATH "$ANDROID_HOME/platform-tools"
set -x PATH $PATH "$ANDROID_NDK"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# java
set --export JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# go
fish_add_path $HOME/go/bin

# ruby
if test -d /opt/homebrew/opt/ruby/bin
    fish_add_path /opt/homebrew/opt/ruby/bin
    fish_add_path (gem environment gemdir)/bin
end

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
fish_add_path $PNPM_HOME $PNPM_HOME/bin
# pnpm end

# load shared aliases
test -f ~/.alias && source ~/.alias

