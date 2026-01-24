# hide greeting
set fish_greeting

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

# initialize zoxide
zoxide init fish | source

# initialize starship prompt
starship init fish | source

# path modifications
fish_add_path /bin /usr/bin /usr/local/bin
fish_add_path ~/.bun/bin/
fish_add_path $HOME/.cargo/bin
# add pnpm nodejs bin (glob to handle version changes)
for dir in $HOME/Library/pnpm/nodejs/*/bin
    fish_add_path $dir
end
fish_add_path /opt/homebrew/lib/ruby/gems/2.7.0/bin
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path $HOME/.pnpm
fish_add_path $HOME/.config/nvim/bin
fish_add_path $HOME/.gem/ruby/3.3.0/bin
fish_add_path $HOME/.maestro/bin
fish_add_path /opt/homebrew/opt/mysql/bin
fish_add_path /opt/homebrew/opt/mysql@8.4/bin

# android sdk
set -x ANDROID_SDK "$HOME/Library/Android/sdk"
set -x PATH "$ANDROID_SDK/emulator $ANDROID_SDK/tools" $PATH
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
set -gx PNPM_HOME $HOME/Library/pnpm
set -gx PATH "$PNPM_HOME" $PATH

# private
source $HOME/.alias
source $HOME/.config/fish/private.fish

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

alias claude="~/.local/bin/claude"

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# hydra abbreviations
abbr -a hyd './hydra'
abbr -a hydk './hydra ec apply examples/kitchensink.yaml'
abbr -a hydp './hydra play examples/ua_cuas_hold.mkv'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.fish.inc' ]; . '/opt/homebrew/share/google-cloud-sdk/path.fish.inc'; end
