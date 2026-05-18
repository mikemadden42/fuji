# TODO

## Improvements

- [ ] **Add an orchestrator.** A single top-level script taking a display
  name (e.g. `osascript run_all.applescript ultrawide`) would remove the
  friction of chaining one activate + one resize across 5 desktops × 3
  display profiles.

- [ ] **Extract shared constants.** Hardcoded screen dimensions are
  repeated across 15 resize scripts (5 ultrawide at 3440×1440, 5
  internal at 1512×982, 5 external at 2560×1440). Move to per-profile
  config files (or derive at runtime — note that
  `desktop_size.applescript` only reports the primary display's Finder
  bounds, so it would need expanding to handle multi-screen setups).

## Style / Polish

- [ ] **Unify property syntax in ultrawide scripts.** Mix of `property
  foo: bar` and `property foo : bar` — pick one. `_04` is the outlier.
