# theme

Keeps the terminal stack on one oxocarbon palette that follows the macOS
light/dark toggle. Dark is oxocarbon dark, light is oxocarbon light.

- **ghostty** switches on its own via `theme = light:oxocarbon-light,dark:Oxocarbon`.
- **nvim** reads `~/.cache/theme-mode` at startup, and re-applies on `FocusGained`.
- **herdr** has no appearance hook, so `theme-sync` rewrites its `[theme.custom]`
  block and calls `herdr server reload-config`.

## files

- `oxocarbon-dark.toml` / `oxocarbon-light.toml` — the two herdr palettes
- `theme-sync` — `theme-sync [dark|light]` (no arg reads the current appearance).
  Splices the palette into `~/.config/herdr/config.toml`, reloads herdr, writes
  `~/.cache/theme-mode`.
- `appearance-observer.js` — JXA run loop that runs `theme-sync` on every
  `AppleInterfaceThemeChangedNotification`. Costs nothing while idle.
- `io.ksch.theme-sync.plist` — LaunchAgent that keeps the observer running.

## install (once per machine)

`make link` symlinks this dir to `~/.config/theme`. Then load the agent:

```sh
ln -s ../../.config/theme/io.ksch.theme-sync.plist ~/Library/LaunchAgents/io.ksch.theme-sync.plist
launchctl bootstrap "gui/$(id -u)" ~/Library/LaunchAgents/io.ksch.theme-sync.plist
```

Reload ghostty config once (`cmd+shift+,`) so it picks up the new theme line.
After that, appearance flips switch all three with no manual step.

To stop it: `launchctl bootout "gui/$(id -u)/io.ksch.theme-sync"`.
