# XCOM: Chimera Squad - Gameplay Notes

Notes recorded while replaying vanilla Chimera Squad.

These notes document how the base game actually behaves and are intended
to help design the Archipelago randomizer.

Do not treat observations here as finalized mod design decisions.

# Tutorial ON - Story Difficulty (GAME 1)

## New Game Settings

Observed: - Tutorial enabled - Story difficulty

Notes: - Ironman exists as a campaign option. - Hardcore Mode exists as
a campaign option. - Extended City Anarchy exists as a campaign option.

AP considerations discovered: - Ironman should initially be AP-locked
OFF. - Hardcore should initially be AP-locked OFF. - Extended City
Anarchy should initially be AP-locked OFF pending investigation.

# Opening / Prologue

## Opening Tactical Mission

Observed: - Tutorial campaign begins with: - Godmother - Verge -
Cherub - Terminal

Notes: - Opening mission teaches Breach mechanics. - First tutorial
mission completion event has already been identified in code:
`STRATEGY_TutorialMissionComplete_Submitted`

# Investigation Selection

Observed: - Early in the campaign, the player is required to choose one
of three factions to investigate.

Factions: - Gray Phoenix - Progeny - Sacred Coil

Questions to observe: - What happens to the two factions not selected? -
When is the second investigation selected? - When is the third
investigation selected? - Does the player choose each time? - Are there
campaign-day requirements? - Are any faction orders restricted?

# Investigation Structure

The game describes each investigation as having three stages.

## Groundwork

Game description / observed purpose: - First stage of an
investigation. - Learn about the faction and its methods.

Gameplay observations: - TBD

Questions: - Is there always exactly one Groundwork mission? - Does it
immediately become available after selecting an investigation? - What
happens immediately after completing it?

## Operations

Game description / observed purpose: - Hidden missions must be
revealed. - Operations disrupt the faction's main plans.

Gameplay observations: - TBD

Questions: - How are Operations revealed? - How many exist per
investigation? - Can multiple Operations be available simultaneously? -
Does the player choose their order? - Are Operations fixed or
procedural? - What rewards does completing an Operation normally
provide?

## Takedown

Game description / observed purpose: - Stop the faction's final
attack. - End the faction's threat to City 31.

Gameplay observations: - TBD

Questions: - What unlocks the Takedown? - Is the Takedown immediately
mandatory once unlocked? - Can the player delay it? - What happens
immediately after completing it? - Does completing it trigger selection
of the next investigation?

## Initial HQ Availability

After selecting the first faction investigation, the tutorial
immediately directed the player to Assembly.

Areas currently available: - Assembly - Armory - Supply - Investigations

Notifications: - Assembly Online - New Recruit Available - Critical
Mission

## Investigations

The campaign focuses on ONE faction investigation at a time.

Observed/remembered campaign structure: 1. Player selects first faction.
2. That faction becomes the active investigation. 3. Other factions are
not simultaneously investigated. 4. Current faction progresses
through: - Groundwork - Operations - Takedown 5. Another investigation
is not selected until the current faction's Takedown is complete.

### Design Follow-Up

The sequential structure conflicts with the earlier independent
faction-access idea. Current proposed AP behavior is tracked in
MODDESIGN.md.

## Assembly

Assembly is available essentially immediately after the first
investigation is selected.

Tutorial directs the player into Assembly.

Starting Elerium: - 100

First tutorial Assembly project cost: - 20 Elerium

### AP Observations

Assembly may provide possible AP locations.

Need to determine: - What Assembly actually controls throughout the
campaign. - Which projects are progression-critical. - Which projects
are optional upgrades. - Whether completing projects should become AP
checks.

If Assembly contains many AP checks, resource economy may need
adjustment.

Potential AP filler: - Elerium

Potential need: - Additional starting Elerium depending on randomizer
settings/economy.

## Armory

Armory is available during the first HQ visit.

Functions observed: - Agent loadouts - Promotions - Ability selection -
Cosmetics

## Agent Recruitment

A "New Recruit Available" notification exists immediately during the
first HQ section.

First observed recruitment choices: - Patchwork - Zephyr - Axiom

Need second campaign test to determine whether these choices are
randomized.

Vanilla presents 3 agents and allows the player to select one.

### Possible AP Replacement

Recruitment selections could potentially become AP locations.

Instead of displaying the recruit normally, each selection could display
the Archipelago item located at that check.

Possible UI concept: - AP/XCOM or AP/Chimera Squad icon - Item name -
Item classification represented visually

Potential item classifications: - Progression - Useful/Filler - Trap -
Other/QOL

If the location contains progression for another AP player,
selecting/viewing the recruitment option may potentially auto-hint that
item.

Exact hint behavior needs APWorld investigation before design is
finalized.

### Design Follow-Up

Vanilla eventually leaves 3 agents unrecruited, making some recruit-slot
checks potentially missable. The current migration-to-Supply design and
fallback auto-check behavior are tracked in MODDESIGN.md.

## Agent Abilities / Promotions

Initial assumption about agent ability progression was incorrect.

Observed promotion structure:

### Deputy Agent

-   1 ability unlock

### Field Agent

-   Choice between 2 abilities
-   Selecting one locks out the other

### Special Agent

-   1 ability unlock
-   New Training options become available

### Senior Agent

-   Choice between 2 abilities
-   Selecting one locks out the other

### Principal Agent

-   1 ability unlock
-   New Training options become available

This appears to produce approximately 5 promotion decisions/unlocks
after the agent's baseline kit, with branching choices at Field Agent
and Senior Agent.

Some newly recruitable agents display LOCKED abilities.

### AP Implication

Current Progressive `<Agent>`{=html} design needs
revision/investigation.

Progressive Training may potentially be combined with Progressive
`<Agent>`{=html} because Training availability is tied to promotion
ranks.

Need to observe Training itself before deciding.

## Agent Roster UI

Armory appears to contain 11 distinct physical/model positions.

This is interesting because Chimera Squad has 11 playable agents even
though a normal campaign roster only reaches 8.

This does NOT prove that the game supports all 11 simultaneously, but
suggests the presentation layer may have considered all 11 agents.

Requires technical testing.

## Existing Mod Investigation Idea

Before implementing major engine/gameplay changes ourselves, investigate
existing Chimera Squad mods for:

-   All 11 agents in one campaign
-   Increased roster cap
-   Increased tactical squad size
-   Recruitment changes

If suitable existing implementations exist: - Study how they solve the
problem. - Determine licensing/permission requirements. - Determine
whether dependency, compatibility, or our own implementation is
preferable.

## Supply

Supply is the normal item shop.

Starting Credits: - 200

Items currently observed: - Auto Key Card - Breaching Charge - Cease
Fire Grenade - Flashbang Grenade - Medikit - Smoke Grenade - Tracer
Rounds

Shop inventory may evolve throughout the campaign.

### AP Possibilities

Supply purchases could potentially become AP checks.

Normal shop items could potentially also appear as useful AP filler.

Items should probably remain normally purchasable even if they can also
be received through AP, unless later design/testing gives a reason to
change this.

Potential resource filler: - Credits - Elerium - Third strategy
resource: name TBD

### Potential YAML Option

Starting Credits could become configurable.

Initial idea: - Vanilla: 200 - 500 - 1000 - 1500 - 2000

Exact values and balance TBD.

Reason: If Supply contains additional AP locations, the player may need
additional economic resources to reasonably access them.

## First Investigation Mission

The first available mission after the initial HQ/tutorial section is the
first mission of the selected investigation.

At this point it appears to be the only available mission.

### AP Observation

This mission probably CANNOT require an independently randomized
progression item because doing so could leave the player with no
available campaign progression immediately after starting.

Possible design: - First Groundwork mission automatically available when
investigation begins. - Completing it may still be an AP location/check.

Need comparison with Tutorial OFF and later investigations.

## First Investigation Mission - Completion

Observed reward: - Credits - No item/progression reward observed

AP observation: Mission completion itself is a natural candidate for an
Archipelago location, even when the vanilla reward is not being
randomized.

Potential location example: - Complete `<Mission Name>`{=html}

This could provide a large number of optional locations depending on how
many missions a campaign generates.

Potential YAML concept: - Mission Sanity

Current design uses a finite mission-completion counter; core missions
also advance that counter. Full behavior is tracked in MODDESIGN.md.

Need to continue observing whether later missions also award: - Items -
Resources - Agent progression - Investigation progression - Other
unlocks

# Things That May Break Randomization

Record any vanilla behavior that appears dependent on: - Specific
agents - Specific missions - Investigation order - Campaign day -
Tutorial state - Agent rank - Research completion - Fixed squad size -
Fixed roster size

## Notes:

# Questions for Source-Code Investigation

When gameplay exposes something we need to understand technically,
record it here before searching the SDK.

-   
