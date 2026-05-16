# TODO

## Bugs

- [ ] **External `resize_windows_05.applescript` is drifted.** Positions
  a `"Messenger"` process that no launcher activates, while WhatsApp
  (activated by `desktop_05.applescript`) is left unpositioned. Replace
  `"Messenger"` with `"WhatsApp"` and fix the overlap with Signal.

- [ ] **Internal- and external-display `resize_windows_01.applescript`
  miss two apps.** Launchers activate 5 apps (Amazon Kindle, Books,
  Brave Browser, KeePassXC, Sublime Text); resize scripts only position
  3 of them. Books and Amazon Kindle get launched but left wherever
  macOS put them last. Mirror the ultrawide layout.

- [ ] **Internal- and external-display `resize_windows_02.applescript`
  miss Ghostty.** Desktop 2 now launches VS Code and Ghostty, but only
  VS Code is resized on these profiles.

- [ ] **Internal- and external-display `resize_windows_04.applescript`
  miss Voice Memos.** Launcher activates 4 apps; scripts only position
  3. Add a Voice Memos cell, remembering the System Events process is
  `"VoiceMemos"` (no space) while Launch Services calls it
  `"Voice Memos"`.

- [ ] **Fix colliding window positions across internal- and
  external-display scripts.** Adopt the grid-computation pattern from
  the ultrawide variants. Affected:
  - `internal-display/resize_windows_03.applescript` — Mail, Messages,
    Notes, Reminders, Slack all overlap
  - `internal-display/resize_windows_04.applescript` — Music, TV,
    Photos stacked at near-identical coordinates
  - `internal-display/resize_windows_05.applescript` — WhatsApp lands
    on top of Signal
  - `external-display/resize_windows_03.applescript` — same overlap
    pattern as internal `_03`
  - `external-display/resize_windows_04.applescript` — Music, TV,
    Photos overlap

## Improvements

- [ ] **Add an orchestrator.** A single top-level script taking a display
  name (e.g. `osascript run_all.applescript ultrawide`) would remove the
  friction of chaining one activate + one resize across 5 desktops × 3
  display profiles.

- [ ] **Extract shared constants.** Hardcoded `screenWidth: 3440` /
  `screenHeight: 1440` are repeated in 5 ultrawide files. Move to a
  single `config.applescript` (or derive at runtime — note that
  `desktop_size.applescript` only reports the primary display's Finder
  bounds, so it would need expanding to handle multi-screen setups).

## Style / Polish

- [ ] **Unify property syntax in ultrawide scripts.** Mix of `property
  foo: bar` and `property foo : bar` — pick one. `_04` is the outlier.

- [ ] **Add `try`/`on error` blocks to internal- and external-display
  scripts.** All five ultrawide scripts now handle missing apps
  gracefully; the other display profiles still crash hard if an app
  isn't running.

- [ ] **Drop stale "Mavericks upgrade" Stack Overflow link** from the top
  of every internal- and external-display file. The 2014 bug is no
  longer relevant; the link is reference noise. Easy to do during the
  rewrites above.
