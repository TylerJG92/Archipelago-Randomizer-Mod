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

#### AP Progression Stalls and Unrest

Archipelago may temporarily prevent the player from advancing their current
Investigation while waiting for remote progression.

The player should remain able to complete Side/Filler missions and Mission
Sanity checks during this period.

However, Chimera Squad's District Unrest / City Anarchy systems may punish
extended campaign time and could eventually cause campaign failure.

The randomizer must ensure that waiting for remote AP progression does not make
campaign failure effectively unavoidable.

Potential solutions:
- Unrest-reduction AP filler items.
- Purchasable Unrest reduction.
- Additional Unrest reduction from filler missions.
- Reduced/paused AP-related Unrest pressure while progression-blocked.
- Other solution TBD.

Do not alter vanilla Unrest balance until its mechanics have been fully
observed and investigated.

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

## Assembly Randomization

Assembly is Chimera Squad's research system and will be a major Archipelago
progression/location system.

### Android Personnel Exception

Android Personnel should remain available through its normal tutorial
progression.

It should NOT be randomized away from the player because it is part of the
tutorial sequence and introduces the Android system.

Whether completing Android Personnel itself sends an AP check remains TBD.

### Other Assembly Projects

Current direction:
- Later Assembly projects can be randomized.
- Vanilla Assembly -> Supply relationships should be preserved where practical.
- Receiving/completing research progression should still enable the systems and
  Supply equipment associated with that research.

Assembly progression may also provide natural gates for additional AP Supply
check waves.

### Investigation Reveal Progression

Important Investigation missions that vanilla reveals through campaign-day
progress should instead be gated by Archipelago progression.

Current proposed behavior:

Vanilla:
Investigation progress / passing days
-> Reveal timer advances
-> Core Investigation mission becomes available

Archipelago:
Progressive Investigation received
-> Core Investigation mission becomes available

The vanilla time-to-reveal requirement should be removed for AP-controlled
Investigation missions.

Investigation missions whose primary vanilla reward is "+X Days" toward
revealing the next core mission will therefore lose the purpose of that reward.

These missions may instead provide one or more AP checks.

Exact number of checks per mission is TBD.

This allows the player to continue performing Investigation-related missions
while waiting for Progressive Investigation from the multiworld.

## Campaign Failure / AP Recovery

Campaign failure must NOT invalidate the player's Archipelago slot.

This applies to normal City Anarchy failure and any other supported campaign
failure condition.

The Archipelago server remains authoritative for:
- Items already received by the Chimera Squad slot.
- Locations already checked by the Chimera Squad slot.

If the player starts a new Chimera Squad campaign and reconnects to the same
AP slot, the mod must reconcile the new campaign against the slot's existing
AP state.

Previously received AP progression must not be permanently lost because the
local Chimera Squad campaign was restarted.

Previously checked AP locations remain checked and must NOT become obtainable
again as new checks.

### Initial Recovery Direction

Preferred initial behavior:

Campaign fails
-> Player starts a new Chimera Squad campaign
-> Player reconnects to the same AP slot
-> Mod retrieves/reconstructs previously received AP progression
-> Previously checked locations remain completed
-> Player continues the same Archipelago slot using the new campaign

Exact reconstruction behavior is TBD.

This system should also protect against:
- Save loss
- Reloading older saves
- Crashes
- Campaign restart
- Other local/AP state desynchronization

The AP server should be treated as authoritative for AP ownership/check state,
while the Chimera Squad save tracks how that state has been applied locally.

## Collected Location State

Archipelago location completion is persistent for the lifetime of the slot.

If a Chimera Squad campaign is restarted while reconnecting to the same AP
slot:

- Previously checked locations remain checked.
- Those locations must not send duplicate checks.
- Any UI element tied to an already-collected location should clearly indicate
  that the AP check has already been collected.

Example: Recruit Patchwork

If "Recruit Patchwork" was already checked earlier in this AP slot:

- A restarted vanilla campaign may still present Patchwork as a recruit choice.
- UI shows that the AP location is already collected.
- Selecting Patchwork performs whatever local recruitment behavior is required.
- No AP check is sent.
- No AP item is awarded from this location again.

Mission Sanity uses lifetime slot progress rather than local-campaign progress.

Example:
- Previous campaign reached Complete 27 Missions.
- New campaign reconnects to same AP slot.
- Mission Sanity resumes from 27.
- Next eligible mission advances toward Complete 28 Missions.

## AP Reconnection and Recovery

The mod must distinguish between:

### Normal Resume / Reconnect
The player loads the same Chimera Squad campaign and reconnects to the same AP slot.

- Compare AP received-item history against locally recorded processed item indexes.
- Apply only items that AP has sent but this save has not processed.
- Preserve original receive order.
- Do not regrant already-processed items.
- Do not replay traps.

### Desync Catch-Up
The local save is behind the AP server.

Example:
AP has sent items 1-25.
Save has processed items 1-21.

Only items 22-25 are processed.

### Campaign Reconstruction
The player starts a new Chimera Squad campaign using the same AP slot after campaign failure or intentional restart.

- AP checked locations remain checked.
- Vanilla interactions tied to already-checked locations may still occur locally,
  but they send no duplicate AP check.
- Persistent AP progression is reconstructed.
- Regrantable resources/items may be restored.
- One-shot traps are never replayed.
- Mission Sanity resumes from the slot's existing lifetime progress.

## Agent Ability Progression UI

Vanilla agent rank progression and Archipelago ability progression are separate.

Vanilla rank:
- Determines when the corresponding AP location/check is sent.
- Does NOT automatically grant randomized ability progression.

Archipelago progression:
- Determines which ability tier is available to the agent.
- May arrive before the agent reaches the corresponding vanilla rank and ability should be USABLE once recieved

The Armory UI must represent both states.

Possible states for a rank tier:
1. Rank not reached / AP progression not received
2. Rank reached / AP progression not received
3. Rank not reached / AP progression received
4. Rank reached / AP progression received

UI direction:
- Abilities received through AP should become visible/selectable even if the
  vanilla rank has not yet been reached.
- Ability tiers not yet received through AP remain greyed out.
- A dedicated AP icon/marker under the rank heading should indicate when the
  AP progression exists but the vanilla rank milestone/check has not yet been
  reached.
- Once the vanilla rank is reached, the corresponding AP location is sent.

## Agent Rank vs AP Ability Progression

Archipelago progression controls the agent's effective gameplay rank.

Vanilla XP progression is retained separately as background progression used
primarily to determine when rank-based Archipelago locations should be checked.


### AP-Driven Effective Rank

Receiving Progressive <Agent> advances that agent's effective gameplay rank.

The front-facing game should treat the agent as the rank represented by their
received AP progression wherever practical.

This includes systems such as:
- Ability availability
- Armory rank display
- Training availability
- Other gameplay systems that normally ask what rank the agent has reached
- Rank-dependent UI and functionality

Example:

Godmother has enough received Progressive Godmother items to represent
Special Agent.

The game should functionally treat Godmother as a Special Agent even if her
background XP has only reached the vanilla Deputy threshold.


### Background XP Milestones

Agents continue earning XP through normal gameplay.

However, XP progression no longer determines the agent's effective gameplay
rank or automatically grants abilities.

Instead, vanilla XP thresholds are tracked as background AP location
milestones.

Example:

Godmother earns enough XP that vanilla would promote her from Deputy to
Field Agent.

AP behavior:
- Mark the Field Agent XP milestone as completed.
- Send the corresponding Godmother rank location/check.
- Do NOT grant an ability.
- Do NOT change Godmother's AP-driven effective rank.
- Do NOT display a promotion notification solely because this XP milestone
  was reached.

The XP milestone must only send its AP location once.

#### Rank Storage Strategy

Preferred implementation:
- Leave vanilla XP and stored rank progression intact.
- Do not rewrite/remove the game's normal XP bookkeeping.
- Track AP-driven effective rank separately.
- Intercept or redirect gameplay-facing rank queries toward AP effective rank.
- Use vanilla stored XP/rank only for background AP milestone checks where needed.

Reason:
This minimizes invasive changes to base-game progression code and preserves
systems that already correctly track XP and rank history.


### AP Ability / Rank Progression

Progressive <Agent> controls the agent's usable progression.

When Progressive <Agent> is received:

If the player is currently Tactical:
- Queue the progression until the player safely returns to HQ.

Once safely in HQ:
- Advance the agent's AP-driven effective rank/tier.
- Make the associated ability tier available immediately.
- Update rank-dependent gameplay systems where appropriate.
- Display the promotion indicator on the agent.
- Allow the player to review/select the new ability in the Armory.

The ability becomes usable immediately regardless of whether the corresponding
background XP milestone has been reached.


### AP Progression Ahead of XP

AP progression may advance an agent beyond their current background XP
milestones.

Example:

Godmother background XP:
- Deputy milestone reached
- Field Agent milestone NOT reached

AP progression:
- Progressive Godmother has advanced her to Field Agent

Gameplay result:
- Godmother is treated as Field Agent.
- Field Agent ability tier is available.
- Field Agent rank-dependent gameplay systems should treat her as Field Agent.
- Promotion indicator tells the player a new AP ability is available.

Later, when Godmother earns enough XP for the vanilla Field Agent milestone:
- Send the Field Agent AP location/check.
- Record that XP milestone as completed.
- Do not change her effective rank.
- Do not grant another ability.
- Do not display another promotion notification.


### XP Ahead of AP Progression

The opposite state is also valid.

Example:

Godmother has accumulated enough XP for vanilla Special Agent.

AP progression has only advanced her to Field Agent.

Gameplay result:
- Background Field Agent and Special Agent XP milestones may already have sent
  their corresponding AP checks.
- Godmother remains functionally Field Agent.
- Special Agent abilities and rank-dependent functionality remain unavailable.
- No promotion notification appears merely because the XP milestones were
  reached.

When the next Progressive Godmother is eventually received:
- Her AP-driven effective rank advances.
- The corresponding ability tier becomes available.
- Promotion notification appears.


### Promotion Indicator

The normal promotion indicator should become AP-driven.

Vanilla:
XP threshold reached
-> promotion available
-> promotion indicator appears

Archipelago:
Progressive <Agent> received
-> new AP progression available
-> promotion indicator appears

Background XP milestones should send AP checks silently.


### Ability Selection

If a rank contains mutually exclusive ability choices, receiving the
corresponding Progressive <Agent> tier should immediately allow the player to
make that choice.

The player does not need to wait for the equivalent background XP milestone.

Exact handling of mutually exclusive abilities requires source investigation.


### Training

Training availability should follow the agent's AP-driven effective rank rather
than their background XP milestone progression.

Example:

If vanilla Training requires Special Agent and AP progression has advanced the
agent to Special Agent, that Training should become available even if the
agent's background XP has not yet reached the Special Agent milestone.

Exact Training dependencies require source investigation.


### Tutorial / Promotion Dialogue

The first AP-driven promotion should preserve the vanilla promotion tutorial
experience where practical.

Investigate whether promotion tutorial dialogue is triggered by:
- XP/rank advancement
- Promotion availability
- Promotion indicator
- Opening the promotion screen
- Selecting an ability
- Another event

If necessary, AP should trigger the appropriate tutorial behavior when the
first AP-driven ability progression becomes available.

## Progressive Agent Training

Progressive <Agent> Training is a separate Archipelago progression item from
Progressive <Agent>.

It represents permanent Training upgrades that normally improve an agent.

Example:

Progressive Verge Training #1
-> First permanent Verge Training upgrade

Progressive Verge Training #2
-> Next permanent Verge Training upgrade

Progressive Verge Training #3
-> Continue Verge's permanent Training progression

Exact number of copies depends on each agent's available Training upgrades.


### Scar Recovery Is NOT Randomized

Training is also used to remove agent Scars.

Scar-removal Training remains part of the normal vanilla game and is NOT
locked behind Archipelago progression.

Reason:
Scar recovery is a recovery/debuff-removal mechanic rather than permanent
randomized progression.


### Training System Availability

Progressive <Agent> Training may be received at any time.

If the Training system itself is not yet available:
- Record the Training item as received.
- Queue its application.
- Apply it once Training becomes available.

Once Training is globally available:
- Received permanent Training progression should be applied immediately when
  safe in HQ.


### Training for Unrecruited Agents

Progressive <Agent> Training may be received before the corresponding agent has
been recruited.

This does NOT recruit the agent.

Instead:
- Record the Training progression as owned for that agent.
- Do not block other AP processing while waiting for the agent.
- When the agent is eventually recruited through Progressive <Agent>, their
  previously received Training progression is already owned and should become
  available/applied appropriately.

Example:

Progressive Torque Training received
-> Torque is not recruited
-> Torque Training progression is stored

Later:

Progressive Torque received
-> Torque is recruited
-> Previously received Torque Training progression is available/applied
-> No additional AP item is required


### Relationship to Effective Rank

Permanent Training progression is controlled by AP ownership, not by vanilla
background XP rank.

If AP has provided the required Progressive <Agent> Training, that permanent
Training upgrade should eventually be granted even if the agent has not reached
the equivalent vanilla XP milestone.

The Training system itself must still be globally available.

## Progressive Agent Training / Training Checks

Permanent Training progression and vanilla Training checks are separate.

### AP-Owned Training Progression

Progressive <Agent> Training represents the permanent Training rewards an agent
can receive.

These items:
- Do not recruit the agent.
- May be received before the agent exists.
- May be received before the Training system is globally unlocked.
- Are stored until they can safely be applied.

Once Training is globally available, previously received Training progression
should be usable/applied when appropriate.


### Vanilla Training as AP Locations

Vanilla Training opportunities become outgoing Archipelago checks.

A Training location becomes available when:
1. The agent's AP-driven effective rank is high enough for that Training option.
2. The Training system itself is available.
3. Any other vanilla Training prerequisites are satisfied.

The player must complete the Training normally to clear the AP location.

When the Training completes:
- Send the corresponding AP location/check.
- Do NOT grant the randomized Training reward a second time.
- Record that Training check as completed.


### Training UI / AP Item Display

The Training UI should show the AP item assigned to each randomized Training
location.

The UI should communicate:
- AP item name
- Item owner/player
- Item classification/type
- Whether the location has already been collected

Progressive items should be visually identifiable.

Current design intent:
If the Training location contains a Progressive item, automatically hint that
item through the AP client where supported.

Exact auto-hint behavior requires AP client/API investigation.


### Scar Recovery

Scar-removal Training remains vanilla.

Scar recovery:
- Is not an AP progression item.
- Does not become a randomized Training check unless later design explicitly
  chooses otherwise.
- Remains available as a normal recovery mechanic.

### Basic Conditioning

Current evidence suggests Basic Conditioning may be the universal first
permanent Training location for every agent.

If confirmed, each eligible agent could have a location such as:
- Godmother - Basic Conditioning
- Verge - Basic Conditioning
- Zephyr - Basic Conditioning

The AP item shown at that Training location is independent of the vanilla
Training reward.

Confirmation across all agents is still required.

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
