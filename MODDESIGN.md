# XCOM: Chimera Squad Archipelago Randomizer - Design

This document records the current intended design of the randomizer.

Designs are provisional until the relevant Chimera Squad systems have
been investigated and tested.

# Core Randomizer Principle

Whenever vanilla Chimera Squad would naturally award progression that
has been moved into the Archipelago item pool, that natural progression
point should instead become an outgoing Archipelago location/check where
practical.

Example:

Vanilla: Godmother reaches a new rank -\> Godmother receives an ability

Archipelago: Godmother reaches that rank -\> "Godmother - Rank X"
location is checked -\> Vanilla randomized reward is withheld -\> Some
item elsewhere in the multiworld is sent -\> Godmother's progression is
received separately through AP

Receiving progression and earning progression are therefore separate
systems.

# Archipelago Activation

The Archipelago connection may receive items from the beginning of the
campaign.

The tutorial does NOT globally disable Archipelago.

Instead, each received item determines whether its effect can safely be
applied in the current game state.

Possible states: - Received - Queued - Applied

Queued items should record why they are waiting.

Examples: - Research item received before Assembly is available -\>
queue - HQ item received during Tactical -\> queue - Ambush trap
received during unsafe scripted encounter -\> defer - Tactical effect
received during opening tutorial -\> defer if necessary

# Base-Game Availability Gates

Where practical, AP should use Chimera Squad's existing
system-availability logic rather than duplicating tutorial unlock
conditions.

Important existing helper:

DioStrategyTutorialHelper.IsAssignmentAvailable()

Known assignment types: - Research - SpecOps - Train - Armory - Supply -
Investigation - ScavengerMarket

AP should generally care whether the system is usable, rather than
whether the player has already viewed its tutorial screen.

Additional AP-specific readiness flags/listeners can be created where
the base game does not expose a suitable availability check.

# Campaign Settings Authority

The generated Archipelago slot should eventually control gameplay
settings that affect seed assumptions or campaign recoverability.

Initially AP-controlled: - Difficulty - Tutorial ON/OFF - Ironman forced
OFF during development - Hardcore Mode forced OFF during development -
Extended City Anarchy forced OFF until investigated

Hardcore Mode must remain disabled until Archipelago has a defined
policy for campaign failure.

Because Hardcore Mode can permanently end a campaign, allowing it
without an AP-specific failure/recovery design could leave a generated
multiworld with a Chimera Squad slot that can no longer complete its
remaining locations or goal.

Possible future solutions: - Allow Hardcore once AP supports
campaign-failure handling. - Define a recovery/fallback mechanism after
campaign failure. - Treat campaign failure as a special AP state/goal if
an appropriate game mode is intentionally designed around it. - Continue
forcing Hardcore OFF if no safe multiworld-compatible behavior is found.

Settings unrelated to AP logic should remain player-controlled where
practical.

# Standard Archipelago Settings

Progression Balancing remains a normal Archipelago player option.

Trap frequency also remains a player-controlled Archipelago option.

Campaign difficulty does NOT determine how frequently traps occur.

Instead, difficulty may influence how an individual reward/trap behaves
once it occurs.

# Agent Roster

Vanilla Chimera Squad normally supports: - 4 starting agents - 4 later
recruits - 8 total agents - 3 of the 11 agents remain unused

Preferred Archipelago design: - Support all 11 agents in one campaign.

This requires testing because vanilla may contain UI, campaign-state, or
assignment assumptions around an 8-agent roster.

## Fallback Agent Pool

If all 11 cannot safely coexist, each generated seed will contain a
limited agent pool, likely 8.

Example: - 8 eligible agents - 4 starting agents - 4 AP-recruited
agents - 3 excluded agents

Excluded agents must also have their associated items and locations
removed from that seed.

# Starting Agents

## Tutorial ON

Tutorial campaigns retain the vanilla-required starting agents:

-   Godmother
-   Verge
-   Cherub
-   Terminal

Their first Progressive Agent item is treated as already
received/precollected.

## Tutorial OFF

Archipelago generation selects 4 starting agents from the eligible agent
pool.

Their first Progressive Agent items are precollected.

Starting agents always retain the baseline abilities necessary for the
agent to function.

# Progressive Agents

Individual ability items are currently NOT preferred.

Instead, each agent receives a progressive item:

-   Progressive Godmother
-   Progressive Verge
-   Progressive Cherub
-   Progressive Terminal
-   etc.

Conceptual behavior:

Progressive Verge #1 -\> Recruit Verge with baseline abilities

Progressive Verge #2 -\> Grant next ability progression tier

Progressive Verge #3 -\> Grant next ability progression tier

Progressive Verge #4 -\> Continue progression as appropriate

Exact number of copies depends on the actual agent progression system.

If an agent begins in the starting squad, copy #1 is precollected.

Basic starting abilities are never individually randomized.

# Progressive Agent Training

Training progression remains separate from normal ability progression.

Example:

Progressive Verge Training #1 -\> First Verge Training upgrade

Progressive Verge Training #2 -\> Second Verge Training upgrade

Progressive Verge Training #3 -\> Third Verge Training upgrade

The AP item may eventually grant the completed Training effect
regardless of vanilla agent rank.

Whether AP Training should still consume strategy time remains
undecided.

# Agent Pool Selection / Hinting

If all 11 agents are supported, agent-pool selection may be unnecessary.

If the campaign must use a limited pool, possible YAML modes are:

## Selected

Player selects eligible agents.

Advantages: - Player knows which Progressive Agent items exist. -
Supports favorite-agent seeds. - Easy to request hints.

## Random Revealed

Generator randomly selects eligible agents and reveals the resulting
pool.

Advantages: - Random roster. - Player can still intelligently use AP
hints.

This is currently the preferred default for limited-pool randomization.

## Random Hidden

Generator randomly selects the pool and does not reveal it.

Advantages: - Maximum uncertainty.

Disadvantages: - Player cannot know whether a specific Progressive Agent
exists. - Hint requests for excluded agents may fail.

This would be an optional challenge/chaos mode rather than the
recommended default.

# Faction/Investigation

## Investigation Progression

Chimera Squad's sequential investigation structure should be preserved
unless future technical investigation demonstrates that multiple
simultaneous investigations are safe.

Only one faction is actively investigated at a time.

Current proposed AP structure:

Faction Selected -\> Groundwork available -\> AP-controlled
investigation progression -\> Operations -\> AP-controlled Takedown
access -\> Takedown completed -\> Next investigation selection

Independent "Gray Phoenix Access", "Progeny Access", and "Sacred Coil
Access" items are no longer the preferred design.

A Progressive Investigation / Progressive Faction Mission model is
currently preferred.

If multiple copies are received before they can safely be used, their
effects should be queued rather than attempting to activate multiple
incompatible missions simultaneously.

The first Groundwork mission should probably remain automatically
available so the campaign cannot begin progression-locked.

# Progressive Campaign Access

Major scripted/story progression should become Archipelago progression
where practical.

Known major investigation targets: - Day 60 content - Day 90/final
content

Potential item:

Progressive Campaign Access

Possible behavior: - Early copy -\> unlock midgame campaign milestone -
Later copy -\> unlock later campaign milestone - Final copy -\> permit
final operation access

Exact milestones and number of copies are TBD.

AP progression should not bypass vanilla game-state prerequisites that
are technically required for a mission to function.

# Short Archipelago Sessions

Chimera Squad should eventually be viable in shorter Archipelago syncs,
including approximately 4-6 hour games.

The preferred solution is NOT globally accelerating every strategy
timer.

Instead, important story progression can be moved behind AP progression
such as Progressive Campaign Access.

Shorter seed settings can make the required progression accessible
earlier or require fewer checks before major campaign milestones.

Longer settings can place progression deeper.

This preserves normal strategy mechanics while allowing AP logic to
influence overall campaign length.

# Experimental Progressive Squad Size

Vanilla tactical squad size is 4.

Possible future AP progression:

Starting Squad Size: 4

Progressive Squad Size #1 -\> Maximum 5 agents

Progressive Squad Size #2 -\> Maximum 6 agents

This is experimental and NOT required for the initial randomizer.

It requires significant investigation because breach maps, breach UI,
mission scripts, tactical HUD, initiative, deployment, cinematics, and
objectives may assume exactly 4 agents.

# Item Delivery Categories

Received AP items should be classified by when they can safely take
effect.

## Tactical

Examples: - Free Reload - Extra Grenade - Temporary combat bonuses

## Next Encounter / Breach

Examples: - Ambush - Additional enemy - Breach modifiers

## Strategy / HQ

Examples: - Research - Weapon technology - Agent recruitment -
Progressive Agent - Progressive Training - Campaign progression

# Persistent Item Queue

AP item receipt and application are separate operations.

The mod should maintain a persistent ledger so reconnecting to
Archipelago does not duplicate previously applied items.

Each received item should eventually record: - AP item/index
information - Received state - Applied state - Queue category - Blocked
reason where applicable

Queues must survive save/load.

# Player Feedback

The player should always know that an AP item was successfully received
even when it cannot yet be applied.

Example:

Received: Weapon Technology Queued: Assembly is not yet available.

Large packets should produce summary feedback rather than dozens of
individual popups.

A future AP UI may allow the player to inspect pending items and their
blocked reasons.

# Performance

Never apply a large AP item packet in one frame.

Received items should be recorded immediately but applied gradually.

Processing should pause when: - loading - transitioning game modes -
playing critical cutscenes - the required application context is
unavailable

Example:

HQ rewards are processing -\> player launches mission -\> HQ processing
pauses -\> tactical-safe items may continue -\> player returns to HQ -\>
HQ processing resumes

# Difficulty-Aware AP Effects

Difficulty may influence the effect of AP items without controlling how
often those items occur.

Example: Ambush

Story difficulty: -\> weighted toward easier enemy pool

Impossible: -\> may be weighted toward more dangerous enemy pool

However, AP should use Chimera Squad's normal enemy creation pipeline.

If the base game automatically applies difficulty-specific stats,
abilities, or AI behavior, AP should NOT manually duplicate those
modifiers.

# Trap Safety

Traps should inconvenience or endanger the player without creating
knowingly unwinnable game states.

Encounter traps should be deferrable.

Example:

Ambush received -\> next encounter is heavily scripted and unsafe -\>
trap remains queued -\> later eligible encounter found -\> extra enemy
spawns

Scripted missions require dedicated investigation before accepting
encounter- altering traps.

# Victory Condition

Current proposed goal:

Complete the final campaign operation / final boss.

The final operation should itself require appropriate AP campaign
progression.

When the final campaign victory is confirmed, the Chimera Squad client
reports its Archipelago goal completion.

# Randomization Scope - Current Candidates

## Progression

Must Randomize - All Takedown Missions for faction investigations
(victory condition)

Definitely / strongly intended: - Progressive Campaign Access -
Progressive Agents - Progressive Agent Training - Progressive
Investigation / Faction Mission progression

Needs investigation: - Weapon technology - Research progression -
Equipment progression - Field Teams - Other strategy unlocks -
Progressive Squad Size

## Useful Filler

Current examples: - Free Reload - Extra Grenade

More candidates TBD after vanilla replay.

## Traps

Current example: - Ambush / Extra Enemy

More candidates TBD after vanilla replay.

## Locations / Checks

Core rule: Natural vanilla progression points become checks when their
normal reward has been randomized.

Potential examples: - Agent rank milestones - Training milestones -
Research completion - Mission completion - Investigation progression -
Story milestones

Full location list TBD after vanilla replay.

## AP Economy

Archipelago may add additional resource demands through purchasable
checks, Assembly checks, or other strategy systems.

Vanilla resources may therefore also serve as useful AP filler.

Known resource candidates: - Credits - Elerium - Third strategy resource
TBD

Starting-resource YAML options may be provided if AP substantially
increases the amount of resources required to access checks.

The goal is not to remove the vanilla economy, but to prevent
randomization from creating an unreasonable resource bottleneck.

## Recruitment Locations and Missable-Check Recovery

Each recruitable agent represents a naturally named Archipelago
location.

Examples: - Recruit Patchwork - Recruit Zephyr - Recruit Axiom - Recruit
Torque

The agent represented by the recruitment slot defines the LOCATION, not
the item obtained from that location.

Example:

Location: Recruit Patchwork

AP Item: Progressive Verge

Selecting the Patchwork recruitment option: 1. Recruits Patchwork
through the normal game system. 2. Clears the "Recruit Patchwork" AP
location. 3. Sends the item assigned to that location.

The recruitment UI should eventually display the AP item associated with
each recruit option while retaining enough agent information for the
player to understand which agent they are choosing.

### Preferred Design: Location Migration

If an unselected recruitment location becomes permanently inaccessible,
its AP location should migrate into the Supply/AP Recovery system.

Example:

"Recruit Patchwork" becomes unavailable -\> Recruit Patchwork AP
location remains unchecked -\> Location appears in AP Supply/Recovery
inventory -\> Player purchases the recovered check -\> AP location is
cleared -\> Patchwork is NOT recruited

The recovery purchase represents access to the lost AP check, not
another opportunity to recruit the agent.

Recovered checks should have a modest Credit cost: enough to make losing
the original free opportunity matter, but not enough to create a severe
progression money-lock.

### Fallback Design: Final Recruitment Auto-Checks

If location migration proves technically impractical, when the final
recruitment opportunity closes, all remaining recruitment AP locations
are automatically checked. The player still recruits only the normally
selected agent.

### Low-Priority Alternative: Forced Filler

Forcing potentially inaccessible recruitment locations to contain filler
is not preferred because earlier skipped locations could still contain
progression, placement rules become more complicated, and recruitment
becomes a less useful AP location pool.

Questions: - How should migrated locations be priced? - Can Supply
safely display dynamically generated AP locations? - Should migrated
checks use a dedicated Archipelago section? - Can a migrated check
retain its original AP Location ID?

## Supply AP Locations

Supply is a candidate for a recurring Archipelago location pool.

AP Supply locations should NOT all be available immediately.

Additional AP Supply checks should become available as campaign
progression milestones are reached.

Possible unlock triggers: - Early campaign progression - Investigation
progression - Operation completion - Takedown completion - New
investigation - Other major campaign milestones

Exact triggers and number of checks per wave are TBD.

This prevents increased starting Credits from allowing the player to
clear the entire Supply AP location pool at the beginning of the
campaign.

### Supply AP UI

Preferred: Add a dedicated Archipelago filter/tab to Supply.

The AP category may contain: - Normal staged AP Supply checks -
Recovered/migrated recruitment checks - Potentially other recovered
checks that became inaccessible elsewhere

Fallback: If adding a dedicated filter is impractical, integrate AP
locations into an appropriate existing Supply filter.

Normal vanilla Supply inventory should remain available.

### Supply Economy

AP randomization may increase the demand for Credits.

Potential YAML option:

Starting Credits: - Vanilla (200) - 500 - 1000 - 1500 - 2000

Exact options are provisional and require economy testing.

Credits may also appear as AP filler items.

The economy should be balanced so that: - Purchasing AP checks requires
meaningful resource decisions. - Required progression is not routinely
locked behind unreasonable Credit requirements. - Supply remains
relevant throughout the campaign.

## Mission Sanity

Mission Sanity is an optional location system based on the total number
of eligible missions the player successfully completes.

Its primary purpose is to provide renewable gameplay opportunities while
the player is waiting for Archipelago progression that blocks
advancement of the current investigation.

### Mission Counter

Eligible mission completions increment a persistent Mission Sanity
counter.

Core/story missions ALSO increment this counter.

Example:

Complete Groundwork Mission -\> Groundwork mission's normal/core AP
location is checked -\> Mission Sanity counter increases by 1

Complete Filler Mission -\> Mission Sanity counter increases by 1

Complete Takedown -\> Takedown's core AP location is checked -\> Mission
Sanity counter increases by 1

Mission Sanity locations could therefore use stable counter-based names:

-   Complete 1 Mission
-   Complete 2 Missions
-   Complete 3 Missions
-   ...
-   Complete X Missions

This avoids requiring procedurally generated filler missions to have
stable Archipelago location identities.

### Core Missions vs Mission Sanity

Important campaign missions may have their own dedicated AP locations.

Example:

Complete Sacred Coil Takedown

That same mission also contributes +1 to the Mission Sanity counter.

Therefore one important mission may potentially clear:

1.  Its dedicated core mission location.
2.  The next Mission Sanity counter location.

### Anti-Stall Purpose

Mission Sanity provides something productive for the player to do while
waiting for remote Archipelago progression.

Example:

Player needs Progressive Investigation to unlock the next important
faction mission.

While waiting: -\> Player completes available filler missions. -\> Each
completion advances Mission Sanity. -\> Mission Sanity sends additional
checks. -\> Those checks may help other players progress. -\> Other
players may eventually reach the item Chimera Squad needs.

This creates an AP progression loop even when the main investigation is
temporarily blocked.

### Filler Mission Availability

Investigate whether Chimera Squad can continue generating filler
missions indefinitely.

If filler missions are effectively unlimited, Mission Sanity must NOT
create unlimited Archipelago locations.

The APWorld generates a finite number of Mission Sanity locations.

After the final generated Mission Sanity location is completed: - Filler
missions may continue appearing normally. - Mission counter may continue
increasing internally if useful. - No additional AP locations are
generated/sent.

### Mission Sanity YAML

Exact settings TBD.

Possible designs include: - Off - Low - Medium - High

or a direct finite check count.

The generated Mission Sanity count must be balanced against expected
campaign length and other location sources.

# Design Parking Lot

Ideas worth preserving but not required for MVP:

-   All 11 agents in one campaign
-   5-6 agent tactical squads
-   Random Hidden agent pools
-   Difficulty-aware progressive loot
-   More extensive campaign-length customization
-   Advanced encounter traps
-   UI change to recruit tab to allow for "AP item checks" showing with
    AP logo or IG logo if local
-   Special AP item sprite/profile for each AP item type (Ie Trap,
    Progressive, filler, etc.)
