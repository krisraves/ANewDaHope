# QA_CHECKLIST.md
# DA'HERM WARS EPISODE X — FULL-GAME TEST SCRIPT (Phase 14)

Run order matters: the route below exercises every gate in the
order a real player meets it. Use F1 (debug builds) to skip ahead
with QA PRESETS when re-testing a section. Fix priority per canon:
crashes → save corruption → progression blockers → quest blockers
→ combat bugs → visual bugs.

## PASS 1 — THE CRITICAL PATH (no debug tools)

- [ ] New game → prologue → Disgraced Comedian → Flame Dash →
      backtrack moment reads ("I can now reach places I couldn't")
- [ ] Slice finale fires once and only once; `finale_seen` set
- [ ] Raves quest → kiosk (150 followers) → Clause 13 gag → signed
- [ ] Courtside: King Crossover → double jump; bounce pads restore
      air moves; SKY COURT reachable
- [ ] Wasteland: Pod Father AD BREAK invulnerability reads as
      mechanic, not bug; Pod Mic combo scaling works
- [ ] Hills (gate: signed): dash gaps, VERIFIED costume,
      Content Castle locks the door + FOLLOWER BOOSTER
- [ ] Tower: floors climbable with no dead ends; Brittney whisper;
      Brandon's exec-floor fight uses floor_y = -240 correctly
- [ ] Streaming HQ: Algorithm suppression halves damage and EXPIRES;
      Boardroom gate refuses pre-Algorithm; Netflicks → heat trickle
- [ ] Celebrity Estates (gate: 400): Swarm ambush on the carpet;
      flash wash respects REDUCED FLASH; Brittney duel — WIN IT
- [ ] Brittney duel again on a fresh save — LOSE IT (drop to 40%):
      she must stop the fight, reward path identical, bar hides
- [ ] Special Estates: tone holds (zero enemies, zero jokes on the
      surface); BELOW: one-way drop, evidence, pivot scene,
      elevator only after `dark_chapter_done`
- [ ] Private Dock refuses before the dark chapter, with the
      pilot line; admits after
- [ ] Island chain: Marina → Cove (Initiate robes stealth ×0.25) →
      Pyramid (beam hazards) → Inner Circle (kill order shuffled
      across three attempts) → CULT KEY → Summit
- [ ] Tuff Tiddy ×3 phases; oil slicks never exceed 6; defeat →
      Good Ending → title → CONTINUE loads post-ending world

## PASS 2 — THE TRUE ROUTE

- [ ] True Gate pre-good-ending: "very specifically no door"
- [ ] Post-good-ending, under-qualified: mirror lists every missing
      item with correct counts (deliberately miss ONE George)
- [ ] Summit residue grants Infernal Mastery (+6 Flame, faster dash)
- [ ] Raves alley scene sets `raves_final_seen`; corner empties after
- [ ] All 13 Georges (list in GameState.GEORGE_FLAGS) + 16 fragments
- [ ] Gate opens ONCE with the assembly banner; re-entry skips it
- [ ] Ravager Prime: P3 applause metronome learnable in ≤3 beats;
      ® orbit radius fair; mid-fight scene fires exactly once
- [ ] Defeat → George scene (verbatim lines) → True Ending →
      title → CONTINUE: Georges gone everywhere, Raves redeemed,
      Headliner quiet

## PASS 3 — SAVE / LOAD MATRIX

- [ ] Quit-and-reload in: a boss arena mid-fight (should restore at
      last club), below the estates, the Headliner pre-fight
- [ ] All 3 manual slots + autosave independent
- [ ] v0 save (no version field) loads with repaired defaults
- [ ] Old (pre-M12) save: achievements unlock silently on first poll
- [ ] settings.cfg survives save deletion (separate file)

## PASS 4 — ECONOMY & COMBAT

- [ ] Follower compound with everything: gain reads ≈×2.1, no overflow
- [ ] Damage stack max: Infernal+Flame = +6; Former Winner +3 on
      non-flame builds; suppression still halves correctly on top
- [ ] Every shop-less reward source grants exactly once on revisits
      (relics, costumes, fragments — the three pickup patterns)
- [ ] Kill the player in every region: respawn at last club, nothing
      lost per spec (followers/equipment/quests retained)

## PASS 5 — COMFORT & EDGES

- [ ] All three COMFORT toggles mid-boss; relaunch persists them
- [ ] HIT PAUSE off: Tuff/Ravager phase transitions still readable
- [ ] Pause during dialogue, during boss intro, during room change
- [ ] F1 toolkit absent in a RELEASE export (OS.is_debug_build gate)

## KNOWN JUDGMENT CALLS TO EVALUATE LIVE

1. Swarm wash intensity (0.55 / 0.18 reduced)
2. Applause metronome period (3.2s) and warn window (0.8s)
3. Landing squash threshold (420 px/s)
4. Castle VIRAL lifetime (6.0s — cut to 4.5 if floors clog)
5. 400-follower Celebrity gate vs natural Hills-era pace
