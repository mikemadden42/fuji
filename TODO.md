# TODO

## Bugs

- [ ] **Sync `close-apps.applescript` with the activate scripts.**
  - Quits `Kindle`, but `desktop_01.applescript` activates `Amazon Kindle`
    (different app).
  - Quits `Firefox`, `MacPass`, `Messenger`, `Microsoft Remote Desktop`,
    `Spotify` — none of which any current `desktop_*` script launches.
  - Leaves `Brave` commented out, even though `desktop_01` activates
    `Brave Browser`.
  - Missing: `WhatsApp`, `KeePassXC`.

- [ ] **Fix colliding window positions in
  `internal-display/resize_windows_03.applescript`.**
  Mail `{40, 120}`, Messages `{300, 150}`, Notes `{100, 80}`, Reminders/Slack
  both at `{100, 100}` — windows stack on top of each other and the
  last-activated wins. Same problem in
  `internal-display/resize_windows_04.applescript` (Music/TV/Photos all
  overlap). Adopt the grid-computation pattern used in the ultrawide variants.

## Improvements

- [ ] **Expand `README.md`.** Document the desktop/display matrix, the 1→5
  numbering convention, and how to pick a display folder. Current example
  references `resize_windows_01.applescript` without a path.

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

- [ ] **Add `try`/`on error` blocks consistently.**
  `ultrawide-display/resize_windows_04.applescript` is the only file that
  handles missing apps gracefully; the others crash hard if an app isn't
  running.

- [ ] **Document `screenPaddingRight: 600` in
  `ultrawide-display/resize_windows_04.applescript`.** "Leave room for
  desktop icons" is a magic number — explain or compute it.

- [ ] **Comment `set_volume.applescript`.** Hardcoded `34` with no rationale;
  a one-line comment would justify it.
