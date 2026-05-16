# fuji

AppleScript collection for launching and arranging apps across the
five macOS Spaces on this Mac.

## Desktops

Each Space has a launcher and a resize script. Switch to the Space
in macOS first, then run both.

- **D1 — Reading.** Amazon Kindle, Books, Brave Browser, KeePassXC,
  Sublime Text
- **D2 — Coding.** Visual Studio Code, Ghostty
- **D3 — Comms.** Calendar, Mail, Messages, Notes, Reminders, Slack
- **D4 — Media.** Music, Photos, TV, Voice Memos
- **D5 — Chat.** Signal, WhatsApp

## Display profiles

Resize coordinates depend on screen size, so each profile lives in
its own directory.

- `ultrawide-display/` — 3440×1440 (primary; actively maintained)
- `external-display/` — external monitor (legacy)
- `internal-display/` — laptop screen (legacy)

The ultrawide scripts compute layouts from screen dimensions, wrap
each app in `try`/`on error` blocks, and handle the launch-name vs
process-name traps (`VoiceMemos`, `Kindle`, `Code`, `ghostty`). The
internal- and external-display variants still use hardcoded
coordinates from the original setup and have known overlap bugs —
see `TODO.md`.

## Usage

Switch to the relevant macOS Space, then chain the launcher with
the matching resize script for your display:

```bash
osascript desktop_01.applescript && \
  osascript ultrawide-display/resize_windows_01.applescript
```

## Other scripts

- `close-apps.applescript` — quit every app the launchers activate
- `set_volume.applescript` — set output volume to 34 and unmute
- `desktop_size.applescript` — print Finder desktop bounds (debug)
