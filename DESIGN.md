# Archipelago Randomizer - Design

## Prologue

~~The Prologue should be protected from Archipelago randomization because~~
~~it contains hard-coded tutorial behavior.~~

~~YAML option:~~

  ~~skip_prologue: true/false~~

~~If false:~~
~~- Play Prologue normally.~~
~~- AP may connect, but gameplay effects remain disabled.~~
~~- Activate randomization when tutorial completion is confirmed.~~

~~If true:~~
~~- Skip/establish the normal post-Prologue campaign state.~~
~~- Activate randomization afterward.~~

~~Both routes must ultimately use the same activation system.~~
This was debunked in Testing, I never thought to actually open the game and start a new game that was not in the SKD (it has been a while since I played) And have since found that the start menu has an option to skip the tutorial. This brings up new problems in and of itself as I dont want the player to be able to access Ironman Mode during the Development of this mod until it becomes "stable"

## Campaign Settings Authority

Attempted design now is that the YAML file when created, the player will select Difficulty and tutorial (on or off) for now and the AP mod itself is going to block the use of Ironman Mode and Extended Anarchy until further testing and stablization will occure.

## YAML Control
The YAML Controlling the the difficulty and other settings means I can implament special settings based on the selected difficulty:
- "ambush" trap (example) can have varying enemy pools to randomly pull from based on difficulty to the player
- other buffs/detriments can be adjusted as well to give the player veriety that matches the selected difficulty from the AP itself (example: Progressive Loot --> story --> all characters recieve 2 extra "granades"/ --> impossible --> a single character chosen at random [alive/contious] recieves a single "grenade")

## Progressive Story Access

Major story events should be gated by Archipelago progression rather than fixed campaign time where practical.

Goals:
- Make Chimera Squad viable for short syncs.
- Avoid rewriting every day-based system.
- Keep major story missions permanently available once unlocked.
- Preserve important in-game prerequisites where needed.
- Final story event remains the primary victory goal.

Possible item:
- Progressive Campaign Access

Potential behavior:
- Early copies unlock midgame story milestones.
- Later copies unlock late-game milestones.
- Final copy unlocks the final operation.

Campaign Length should primarily control how deeply these progression items are placed in the AP logic rather than directly accelerating the entire strategy clock.

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