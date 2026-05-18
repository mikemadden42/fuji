# TODO

## Bugs

- [ ] **External `resize_windows_05.applescript` is drifted.** Positions
  a `"Messenger"` process that no launcher activates, while WhatsApp
  (activated by `desktop_05.applescript`) is left unpositioned. Replace
  `"Messenger"` with `"WhatsApp"` and fix the overlap with Signal.

- [ ] **External `resize_windows_01.applescript` misses two apps.**
  Launcher activates 5 apps (Amazon Kindle, Books, Brave Browser,
  KeePassXC, Sublime Text); resize script only positions 3 of them.
  Books and Amazon Kindle get launched but left wherever macOS put
  them last. Mirror the ultrawide layout (or, if the external display
  is also small, the internal-display reading-stack pattern).

- [ ] **External `resize_windows_02.applescript` misses Ghostty.**
  Desktop 2 launches VS Code and Ghostty, but only VS Code is resized
  on the external profile.

- [ ] **External `resize_windows_04.applescript` misses Voice Memos.**
  Launcher activates 4 apps; script only positions 3. Add a Voice
  Memos cell, remembering the System Events process is `"VoiceMemos"`
  (no space) while Launch Services calls it `"Voice Memos"`.

- [ ] **Fix colliding window positions in external-display scripts.**
  Adopt the grid-computation pattern from the ultrawide variants.
  Affected:
  - `external-display/resize_windows_03.applescript` — Mail, Messages,
    Notes, Reminders, Slack overlap
  - `external-display/resize_windows_04.applescript` — Music, TV,
    Photos overlap

## Improvements

- [ ] **Add an orchestrator.** A single top-level script taking a display
  name (e.g. `osascript run_all.applescript ultrawide`) would remove the
  friction of chaining one activate + one resize across 5 desktops × 3
  display profiles.

- [ ] **Extract shared constants.** Hardcoded screen dimensions are
  repeated across 15 resize scripts (5 ultrawide at 3440×1440, 5
  internal at 1512×982, 5 external at the external profile's size).
  Move to per-profile config files (or derive at runtime — note that
  `desktop_size.applescript` only reports the primary display's Finder
  bounds, so it would need expanding to handle multi-screen setups).

## Style / Polish

- [ ] **Unify property syntax in ultrawide scripts.** Mix of `property
  foo: bar` and `property foo : bar` — pick one. `_04` is the outlier.

- [ ] **Add `try`/`on error` blocks to external-display scripts.**
  Ultrawide and internal-display scripts now handle missing apps
  gracefully; external still crashes hard if an app isn't running.

- [ ] **Drop stale "Mavericks upgrade" Stack Overflow link** from the
  top of every external-display file. The 2014 bug is no longer
  relevant; the link is reference noise. Easy to do during the
  rewrites above.
