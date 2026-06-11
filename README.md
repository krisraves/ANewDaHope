# DA'HERM WARS EPISODE X: A NEW DA'HOPE
## MILESTONE 15 — RELEASE CANDIDATE (1.0.0-rc1)

The Phase 15 closeout. See RELEASE_NOTES.md for the full honest
ship-state; this file covers what M15 itself built.

---

## THE BAD ENDING (the audit catch of the milestone)

Phase 15 requires "all endings functional" — and the canon's THIRD
ending had never been built across fourteen milestones. It ships
now: **THE OFFER**, a contract podium at the Summit placed before
the fight trigger (x 280 < 420), two-step interact so nobody joins
the system by accident. Tuff pitches it like a bit he's
workshopping ("It's a great clause. Clause 13. You've met.") —
Rule 8 to the last. The ending scene gives Da'Herm everything he
asked for in the prologue, which is the entire problem: *"He never
finds out what was under the estates. He stops asking. That was
the deal. Nobody ever says it out loud."* Per Rule 25, the GAME
still ends with hope — the route doesn't, and the save lives on:
*"(you can still walk back up.)"* Achievements MADE IT and SPECIAL
BOY wired.

## ALSO SHIPPED

- **CREDITS** scene + title menu entry — the mission statement as
  credits ("PIXEL ART BY: this space reserved — the ColorRects
  were placeholders and they knew it the whole time")
- **RC stamp**: `config/version="1.0.0-rc1"`, project renamed
- **Controller support verified**: InputSetup already binds full
  joypad (left stick + d-pad, A/B/X/Y, shoulders) at startup
- **RELEASE_NOTES.md**: the line between proven and owed

## BUILD-PROCESS CATCH

A heredoc apostrophe broke a patch script at Python parse time —
meaning NONE of that batch had run. Caught because every patch
gets grep-verified after application; all five landed on the
re-run. (The verification habit exists for exactly this.)

## TESTING

1. THE OFFER: first press = pitch + prompt changes; second = sign.
   Walk away after the pitch, return — it must still take one
   press to sign (state persists for the room visit).
2. Bad Ending → title → CONTINUE: you're at the last club save,
   summit unfought, `bad_ending_unlocked` + `special_received` set,
   both achievements popped.
3. Sign AFTER starting the fight? Impossible — the podium is
   outside the trigger and the fight locks you forward; verify.
4. Credits from title; [JUMP] advances; returns to title.
5. Release export: F1 dead, version string correct.

---

## THE PRODUCTION LINE, M1 → M15

Movement → Combat → Flame Dash → Vertical Slice → Core Systems →
World ×3 → Dark Chapter → Late-game → Endgame → True Ending →
Content Expansion → Polish → QA Toolkit → **Release Candidate**.

What remains is not a milestone. It's a playtester, an artist,
and a composer. The canon is enforced, the world is wired, and
the joke — per Rule 12 — remains untold.
