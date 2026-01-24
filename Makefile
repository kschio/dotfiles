SHELL = /bin/bash
OS := $(shell bin/is-supported bin/is-macos macos linux)
DOTFILES_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
HOMEBREW_PREFIX := $(shell bin/is-supported bin/is-arm64 /opt/homebrew /usr/local)
PATH := $(HOMEBREW_PREFIX)/bin:$(DOTFILES_DIR)/bin:$(PATH)
export XDG_CONFIG_HOME = $(HOME)/.config
export STOW_DIR = $(DOTFILES_DIR)
export ACCEPT_EULA=Y

.PHONY: test

all: $(OS)

macos: sudo core-macos packages link

linux: core-linux link

core-macos: brew bash git

core-linux:
	apt-get update
	apt-get upgrade -y
	apt-get dist-upgrade -f

stow-macos: brew
	is-executable stow || brew install stow

stow-linux: core-linux
	is-executable stow || apt-get -y install stow

sudo:
ifndef GITHUB_ACTION
	sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
endif

packages: brew-packages cask-apps bun-packages pnpm-packages

link: stow-$(OS)
	for FILE in $$(\ls -A runcom); do if [ -f $(HOME)/$$FILE -a ! -h $(HOME)/$$FILE ]; then \
		mv -v $(HOME)/$$FILE{,.bak}; fi; done
	mkdir -p $(XDG_CONFIG_HOME)
	stow -t $(HOME) runcom
	stow -t $(XDG_CONFIG_HOME) config

unlink: stow-$(OS)
	stow --delete -t $(HOME) runcom
	stow --delete -t $(XDG_CONFIG_HOME) config
	for FILE in $$(\ls -A runcom); do if [ -f $(HOME)/$$FILE.bak ]; then \
		mv -v $(HOME)/$$FILE.bak $(HOME)/$${FILE%%.bak}; fi; done

brew:
	is-executable brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash

bash: SHELLS=/private/etc/shells
bash: brew
ifdef GITHUB_ACTION
	if ! grep -q bash $(SHELLS); then \
		brew install bash bash-completion@2 pcre && \
		sudo append bash $(SHELLS) && \
		sudo chsh -s bash; \
	fi
else
	if ! grep -q bash $(SHELLS); then \
		brew install bash bash-completion@2 pcre && \
		sudo append bash $(SHELLS) && \
		chsh -s bash; \
	fi
endif

git: brew
	brew install git git-extras

brew-packages: brew
	brew bundle --file=$(DOTFILES_DIR)/install/Brewfile || true

cask-apps: brew hammerspoon
	brew bundle --file=$(DOTFILES_DIR)/install/Caskfile || true
	xattr -d -r com.apple.quarantine ~/Library/QuickLook

bun-packages:
	xargs bun install -g < $(DOTFILES_DIR)/install/bunfile

pnpm-packages:
	xargs pnpm add -g < $(DOTFILES_DIR)/install/pnpmfile

hammerspoon:
	defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"
	mkdir -p $(XDG_CONFIG_HOME)/hammerspoon/Spoons
	test -d $(XDG_CONFIG_HOME)/hammerspoon/Spoons/PaperWM.spoon || \
		git clone https://github.com/mogenson/PaperWM.spoon $(XDG_CONFIG_HOME)/hammerspoon/Spoons/PaperWM.spoon
	test -d $(XDG_CONFIG_HOME)/hammerspoon/Spoons/WarpMouse.spoon || \
		git clone https://github.com/mogenson/WarpMouse.spoon $(XDG_CONFIG_HOME)/hammerspoon/Spoons/WarpMouse.spoon

test:
	eval $$(fnm env); bats test
