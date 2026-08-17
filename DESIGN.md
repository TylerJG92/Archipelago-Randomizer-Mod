# Archipelago Randomizer - Design

## Prologue

The Prologue should be protected from Archipelago randomization because
it contains hard-coded tutorial behavior.

YAML option:

    skip_prologue: true/false

If false:
- Play Prologue normally.
- AP may connect, but gameplay effects remain disabled.
- Activate randomization when tutorial completion is confirmed.

If true:
- Skip/establish the normal post-Prologue campaign state.
- Activate randomization afterward.

Both routes must ultimately use the same activation system.


## Item Delivery Philosophy

Receiving an Archipelago item does NOT necessarily mean immediately
applying the item to Chimera Squad.

Items should be classified by when they can safely be applied:

1. Tactical
2. Next Encounter / Breach
3. Strategy / HQ

Large batches should be throttled rather than applied simultaneously.


## Example Trap: Ronin

"Ronin Trap"

Effect:
Add a Ronin to an upcoming breach encounter.

Safety:
- Never affect the Prologue.
- Determine whether scripted encounters tolerate additional enemies.
- If the next encounter is unsafe, defer the trap.