# XCOM: Chimera Squad Archipelago Randomizer - Design

This document records the current intended design of the randomizer.

Designs are provisional until the relevant Chimera Squad systems have been
investigated and tested.


# Core Randomizer Principle

Whenever vanilla Chimera Squad would naturally award progression that has been
moved into the Archipelago item pool, that natural progression point should
instead become an outgoing Archipelago location/check where practical.

Example:

Vanilla:
Godmother reaches a new rank
-> Godmother receives an ability

Archipelago:
Godmother reaches that rank
-> "Godmother - Rank X" location is checked
-> Vanilla randomized reward is withheld
-> Some item elsewhere in the multiworld is sent
-> Godmother's progression is received separately through AP

Receiving progression and earning progression are therefore separate systems.


# Archipelago Activation

The Archipelago connection may receive items from the beginning of the
campaign.

The tutorial does NOT globally disable Archipelago.

Instead, each received item determines whether its effect can safely be applied
in the current game state.

Possible states:
- Received
- Queued
- Applied

Queued items should record why they are waiting.

Examples:
- Research item received before Assembly is available -> queue
- HQ item received during Tactical -> queue
- Ambush trap received during unsafe scripted encounter -> defer
- Tactical effect received during opening tutorial -> defer if necessary


# Base-Game Availability Gates

Where practical, AP should use Chimera Squad's existing system-availability
logic rather than duplicating tutorial unlock conditions.

Important existing helper:

DioStrategyTutorialHelper.IsAssignmentAvailable()

Known assignment types:
- Research
- SpecOps
- Train
- Armory
- Supply
- Investigation
- ScavengerMarket

AP should generally care whether the system is usable, rather than whether the
player has already viewed its tutorial screen.

Additional AP-specific readiness flags/listeners can be created where the base
game does not expose a suitable availability check.


# Campaign Settings Authority

The generated Archipelago slot should eventually control gameplay settings
that affect seed assumptions.

Initially AP-controlled:
- Difficulty
- Tutorial ON/OFF
- Ironman forced OFF during development
- Extended City Anarchy forced OFF until investigated

Settings unrelated to AP logic should remain player-controlled where practical.

The existing New Game UI should be reused rather than replaced if possible.

AP-controlled settings should be visibly disabled/locked and clearly explain
that the connected Archipelago seed controls them.


# Standard Archipelago Settings

Progression Balancing remains a normal Archipelago player option.

Trap frequency also remains a player-controlled Archipelago option.

Campaign difficulty does NOT determine how frequently traps occur.

Instead, difficulty may influence how an individual reward/trap behaves once
it occurs.


# Agent Roster

Vanilla Chimera Squad normally supports:
- 4 starting agents
- 4 later recruits
- 8 total agents
- 3 of the 11 agents remain unused

Preferred Archipelago design:
- Support all 11 agents in one campaign.

This requires testing because vanilla may contain UI, campaign-state, or
assignment assumptions around an 8-agent roster.


## Fallback Agent Pool

If all 11 cannot safely coexist, each generated seed will contain a limited
agent pool, likely 8.

Example:
- 8 eligible agents
- 4 starting agents
- 4 AP-recruited agents
- 3 excluded agents

Excluded agents must also have their associated items and locations removed
from that seed.


# Starting Agents

## Tutorial ON

Tutorial campaigns retain the vanilla-required starting agents:

- Godmother
- Verge
- Cherub
- Terminal

Their first Progressive Agent item is treated as already received/precollected.


## Tutorial OFF

Archipelago generation selects 4 starting agents from the eligible agent pool.

Their first Progressive Agent items are precollected.

Starting agents always retain the baseline abilities necessary for the agent
to function.


# Progressive Agents

Individual ability items are currently NOT preferred.

Instead, each agent receives a progressive item:

- Progressive Godmother
- Progressive Verge
- Progressive Cherub
- Progressive Terminal
- etc.

Conceptual behavior:

Progressive Verge #1
-> Recruit Verge with baseline abilities

Progressive Verge #2
-> Grant next ability progression tier

Progressive Verge #3
-> Grant next ability progression tier

Progressive Verge #4
-> Continue progression as appropriate

Exact number of copies depends on the actual agent progression system.

If an agent begins in the starting squad, copy #1 is precollected.

Basic starting abilities are never individually randomized.


# Progressive Agent Training

Training progression remains separate from normal ability progression.

Example:

Progressive Verge Training #1
-> First Verge Training upgrade

Progressive Verge Training #2
-> Second Verge Training upgrade

Progressive Verge Training #3
-> Third Verge Training upgrade

The AP item may eventually grant the completed Training effect regardless of
vanilla agent rank.

Whether AP Training should still consume strategy time remains undecided.


# Agent Pool Selection / Hinting

If all 11 agents are supported, agent-pool selection may be unnecessary.

If the campaign must use a limited pool, possible YAML modes are:


## Selected

Player selects eligible agents.

Advantages:
- Player knows which Progressive Agent items exist.
- Supports favorite-agent seeds.
- Easy to request hints.


## Random Revealed

Generator randomly selects eligible agents and reveals the resulting pool.

Advantages:
- Random roster.
- Player can still intelligently use AP hints.

This is currently the preferred default for limited-pool randomization.


## Random Hidden

Generator randomly selects the pool and does not reveal it.

Advantages:
- Maximum uncertainty.

Disadvantages:
- Player cannot know whether a specific Progressive Agent exists.
- Hint requests for excluded agents may fail.

This would be an optional challenge/chaos mode rather than the recommended
default.


# Faction / Investigation Access

Potential major progression items:

- Gray Phoenix Access
- Progeny Access
- Sacred Coil Access

The goal is to allow Archipelago progression to influence which faction
content becomes accessible.

However, vanilla campaign sequencing must be investigated before changing the
investigation structure.

Possible safer design:

AP faction access does not run multiple investigations simultaneously.

Instead, AP items determine which factions are eligible when the player reaches
the normal point where the next investigation is selected.


# Progressive Campaign Access

Major scripted/story progression should become Archipelago progression where
practical.

Known major investigation targets:
- Day 60 content
- Day 90/final content

Potential item:

Progressive Campaign Access

Possible behavior:
- Early copy -> unlock midgame campaign milestone
- Later copy -> unlock later campaign milestone
- Final copy -> permit final operation access

Exact milestones and number of copies are TBD.

AP progression should not bypass vanilla game-state prerequisites that are
technically required for a mission to function.


# Short Archipelago Sessions

Chimera Squad should eventually be viable in shorter Archipelago syncs,
including approximately 4-6 hour games.

The preferred solution is NOT globally accelerating every strategy timer.

Instead, important story progression can be moved behind AP progression such
as Progressive Campaign Access.

Shorter seed settings can make the required progression accessible earlier or
require fewer checks before major campaign milestones.

Longer settings can place progression deeper.

This preserves normal strategy mechanics while allowing AP logic to influence
overall campaign length.


# Experimental Progressive Squad Size

Vanilla tactical squad size is 4.

Possible future AP progression:

Starting Squad Size: 4

Progressive Squad Size #1
-> Maximum 5 agents

Progressive Squad Size #2
-> Maximum 6 agents

This is experimental and NOT required for the initial randomizer.

It requires significant investigation because breach maps, breach UI, mission
scripts, tactical HUD, initiative, deployment, cinematics, and objectives may
assume exactly 4 agents.


# Item Delivery Categories

Received AP items should be classified by when they can safely take effect.


## Tactical

Examples:
- Free Reload
- Extra Grenade
- Temporary combat bonuses


## Next Encounter / Breach

Examples:
- Ambush
- Additional enemy
- Breach modifiers


## Strategy / HQ

Examples:
- Research
- Weapon technology
- Agent recruitment
- Progressive Agent
- Progressive Training
- Campaign progression


# Persistent Item Queue

AP item receipt and application are separate operations.

The mod should maintain a persistent ledger so reconnecting to Archipelago
does not duplicate previously applied items.

Each received item should eventually record:
- AP item/index information
- Received state
- Applied state
- Queue category
- Blocked reason where applicable

Queues must survive save/load.


# Player Feedback

The player should always know that an AP item was successfully received even
when it cannot yet be applied.

Example:

Received: Weapon Technology
Queued: Assembly is not yet available.

Large packets should produce summary feedback rather than dozens of individual
popups.

A future AP UI may allow the player to inspect pending items and their blocked
reasons.


# Performance

Never apply a large AP item packet in one frame.

Received items should be recorded immediately but applied gradually.

Processing should pause when:
- loading
- transitioning game modes
- playing critical cutscenes
- the required application context is unavailable

Example:

HQ rewards are processing
-> player launches mission
-> HQ processing pauses
-> tactical-safe items may continue
-> player returns to HQ
-> HQ processing resumes


# Difficulty-Aware AP Effects

Difficulty may influence the effect of AP items without controlling how often
those items occur.

Example: Ambush

Story difficulty:
-> weighted toward easier enemy pool

Impossible:
-> may be weighted toward more dangerous enemy pool

However, AP should use Chimera Squad's normal enemy creation pipeline.

If the base game automatically applies difficulty-specific stats, abilities,
or AI behavior, AP should NOT manually duplicate those modifiers.


# Trap Safety

Traps should inconvenience or endanger the player without creating knowingly
unwinnable game states.

Encounter traps should be deferrable.

Example:

Ambush received
-> next encounter is heavily scripted and unsafe
-> trap remains queued
-> later eligible encounter found
-> extra enemy spawns

Scripted missions require dedicated investigation before accepting encounter-
altering traps.


# Victory Condition

Current proposed goal:

Complete the final campaign operation / final boss.

The final operation should itself require appropriate AP campaign progression.

When the final campaign victory is confirmed, the Chimera Squad client reports
its Archipelago goal completion.


# Randomization Scope - Current Candidates

## Progression

Definitely / strongly intended:
- Progressive Campaign Access
- Progressive Agents
- Progressive Agent Training
- Faction / Investigation Access

Needs investigation:
- Weapon technology
- Research progression
- Equipment progression
- Field Teams
- Other strategy unlocks
- Progressive Squad Size


## Useful Filler

Current examples:
- Free Reload
- Extra Grenade

More candidates TBD after vanilla replay.


## Traps

Current example:
- Ambush / Extra Enemy

More candidates TBD after vanilla replay.


## Locations / Checks

Core rule:
Natural vanilla progression points become checks when their normal reward has
been randomized.

Potential examples:
- Agent rank milestones
- Training milestones
- Research completion
- Mission completion
- Investigation progression
- Story milestones

Full location list TBD after vanilla replay.


# Design Parking Lot

Ideas worth preserving but not required for MVP:

- All 11 agents in one campaign
- 5-6 agent tactical squads
- Random Hidden agent pools
- Difficulty-aware progressive loot
- More extensive campaign-length customization
- Advanced encounter traps