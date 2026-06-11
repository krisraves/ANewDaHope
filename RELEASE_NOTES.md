# RELEASE_NOTES.md
# DA'HERM WARS EPISODE X: A NEW DA'HOPE — 1.0.0-rc1

The honest line between what this build PROVES and what production
still owes it.

---

## WHAT SHIPS (fully wired, end to end)

**The complete game graph.** 24 rooms across 13 canon regions plus
interiors, every door, gate, and spawn point hand-verified against
the movement math (132px jump rise / 234px jump gap / 244px
double-jump rise / 378px dash-jump gap / ≤120px steps).

**ALL THREE ENDINGS — the RC milestone's own audit found the gap.**
The Bad Ending had never been built; it ships now as THE OFFER, a
two-step contract at the Summit before the fight trigger, with its
own ending scene and both ACHIEVEMENTS.md entries (MADE IT, SPECIAL
BOY). Good (Tuff falls) and True (the full requirements engine →
Ravager Prime → George's verbatim final scene) were already wired.

**18 bosses + minibosses**, every one a canon idea made mechanical:
non-lethal Brittney, the three-at-once Inner Circle, a building
that fights back, the applause-as-percussion metronome.

**Systems**: 8-tier-framework Flame Glove (3 tiers live: Punch /
Dash / Infernal Mastery), followers-as-progression with 5 economy
multipliers, 12 costumes that change gameplay + dialogue + faction
stealth, 8 relics, quest log, comedy-style hooks, 18 achievements,
versioned 3+1-slot saves with repair-on-load, comfort settings
(separate cfg), full keyboard + controller bindings, the F1 QA
toolkit (debug builds only), credits.

**Canon law, enforced in code**: fragments exist only as a count
(Rule 12); George is never explained, never fought, and despawns
globally after his final scene; "So it seems" appears exactly
twice, both canon-sanctioned; the Dark Chapter suspends every
comedy system; Raves lives.

## WHAT PRODUCTION STILL OWES (by design of this build)

1. **Pixel art** — every visual is a ColorRect placeholder. The
   Art Bible (sprite sizes, palettes, silhouettes) is specced;
   nothing is drawn. This is the single largest remaining cost.
2. **Audio** — zero sound assets. The Audio Bible defines every
   region theme, character theme, and the applause/laughter
   sound-design distinction; none of it exists yet. The Ravager
   metronome and the Dark Chapter's silence are designed to be
   carried by audio that isn't there.
3. **Animation** — squash/stretch and state scaling exist; sprite
   animation (the Comedy Animation Rule: double takes, ego
   collapse) needs the art that doesn't exist yet.
4. **Live tuning** — five flagged numeric judgment calls
   (QA_CHECKLIST.md) plus boss HP/damage curves have never met a
   human hand on a controller.
5. **Flame Glove tiers 3–7** (Barrier Burn / Inferno Slam / Flame
   Vault / Stage Dive / Crowd Ignition) — cut per the roadmap's
   MVP scope rules; the framework expects them, the world routes
   around them. Restoring them = new gates + re-route pass.
6. **Input remapping UI + subtitle scaling** — logged at M13.
7. **Cut content on the books**: Racist Booker, Open Mic King,
   Comedy Cop, Check Drop, the optional legendary bosses (Baron
   Von Podcast et al.), New Game Plus, Bestiary UI, busking
   challenge set, ~28 more costumes toward the 40–60 target.

## RC EXIT CRITERIA (Phase 15 checklist)

- [x] Full playthrough possible
- [x] All endings functional ← Bad Ending closed THIS milestone
- [x] Save/load stable (versioned, validated, repaired)
- [x] Controller support (bound at startup in InputSetup)
- [x] Keyboard support
- [x] Settings menu (comfort, persisted)
- [x] Credits
- [~] Accessibility options (3 shipped; remap + subtitles owed)
- [ ] A human completes QA_CHECKLIST.md passes 1–5 ← the gate

## ONE-LINE TRUTH

Every system, region, boss, quest, and ending in the canon's MVP+
scope is wired and self-audited — and not one frame of it has been
seen running. The next commit belongs to a playtester.
