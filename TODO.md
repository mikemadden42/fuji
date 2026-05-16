# TODO

## Bugs

- [ ] **Fix colliding window positions in
  `internal-display/resize_windows_03.applescript`.**
  Mail `{40, 120}`, Messages `{300, 150}`, Notes `{100, 80}`, Reminders/Slack
  both at `{100, 100}` — windows stack on top of each other and the
  last-activated wins. Same problem in
  `internal-display/resize_windows_04.applescript` (Music/TV/Photos all
  overlap). Adopt the grid-computation pattern used in the ultrawide variants.

## Improvements

- [ ] **Add an orchestrator.** A single top-level script taking a display name
  (e.g. `osascript run_all.applescript ultrawide`) would remove the friction
  of chaining one activate + one resize across 5 desktops × 3 display
  profiles.

- [ ] **Extract shared constants.** Hardcoded `screenWidth: 3440` /
  `screenHeight: 1440` are repeated in 5 ultrawide files. Move to a single
  `config.applescript` (or derive at runtime via `desktop_size.applescript`)
  so changing monitor is a one-file edit.

## Style / Polish

- [ ] **Unify property syntax in ultrawide scripts.** Mix of `property foo:
  bar` and `property foo : bar` — pick one.

- [ ] **Add `try`/`on error` blocks to internal- and external-display
  scripts.** All five ultrawide scripts now handle missing apps gracefully;
  the other display profiles still crash hard if an app isn't running.
