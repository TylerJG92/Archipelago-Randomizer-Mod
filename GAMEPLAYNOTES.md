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

## After First Chosen Investigation Mission

After completing the first chosen faction Investigation mission:

- Spec Ops becomes available.
- The player gains freedom to choose between multiple available missions.


## Assembly Confirmed as Research System

Assembly is effectively Chimera Squad's research system.

The first tutorial Assembly project is:

### Android Personnel

Android Personnel is completed as part of the early tutorial sequence and
rewards the player with an Android unit.

Because this project is part of the tutorial and introduces Androids,
Android Personnel should be treated separately from later Assembly projects.

Android observations:
- Androids act as backup units during missions.
- If an agent is evacuated or otherwise removed, an Android can replace them.
- Androids can equip upgrades after the appropriate research.
- Androids can be purchased after Android Personnel is completed.
- Observed apparent capacity is 2 Androids at once; confirm whether this is a
  hard ownership/deployment limit.


### Android Personnel Unlocks

Completing Android Personnel unlocks Android units for purchase in Supply and
three additional Assembly projects:

#### Modular Weapons
Marked as a priority project by the game.

Rewards:
- Agents can equip Weapon Mods in the Armory.
- Auto-Loader becomes available in Supply.
- Stock becomes available in Supply.
- Expanded Magazine becomes available in Supply.

#### Modular Armor
Marked as a priority project by the game.

Rewards:
- Agents can equip Armor Mods in the Armory.
- Infiltrator Weave becomes available in Supply.
- Extra Padding becomes available in Supply.
- Mach Weave becomes available in Supply.

#### Modular Androids

Rewards:
- Androids can equip Android Mods in the Armory.
- Ballistic Foam Lining becomes available in Supply.
- Polymer Sheathing becomes available in Supply.
- Servoharness Mk1 becomes available in Supply.


## Assembly -> Supply Relationship

Assembly research directly unlocks new equipment in Supply.

Observed pattern:

Assembly Project
-> gameplay/system unlock
-> associated equipment becomes purchasable in Supply

This relationship should continue to be observed for later Assembly projects.


## Spec Ops

Spec Ops becomes available after the first chosen Investigation mission.

Spec Ops appear useful but are not currently observed to be required for
campaign progression.

Tutorial states that more advanced Spec Ops become available as agents gain
ranks.

Potential AP idea:
- Optional Spec Op Sanity locations.

Do not assume Spec Ops themselves need to be randomized.

Questions:
- How many Spec Ops exist?
- Are they repeatable?
- What exact agent ranks unlock additional Spec Ops?
- What rewards can Spec Ops provide?
- Can multiple agents perform Spec Ops simultaneously?


## Strategy Resources

Confirmed three major resources:

- Credits
- Elerium
- Intel

Continue recording:
- Sources of each resource.
- Typical amounts earned.
- Typical costs.
- Systems that consume each resource.


## Mission Types

Tutorial identifies three mission categories:

### Investigation - Purple

Faction-investigation missions.

Some Investigation missions initially appear locked behind a number of days.

IMPORTANT CORRECTION:
The displayed timer is NOT necessarily time remaining before the mission
expires.

Observed case:
- Investigation mission was locked for a number of days.
- Another available Investigation mission rewarded +3 Days toward revealing /
  unlocking the locked Investigation mission.

This suggests some Investigation missions advance/reduce the reveal timer for
important faction missions.

Need to distinguish:
- Core Investigation missions
- Investigation missions whose purpose is to accelerate revelation of a core
  mission
- Operations
- Groundwork
- Takedowns


### Side Missions - Yellow

Optional missions.

Observed rewards include:
- Strategy resources
- Items

Examples observed:
- Side mission rewarding Elerium
- Side mission apparently rewarding an item


### Emergency Missions - Red

Appear in response to district Unrest problems.

Further behavior TBD.


## District Unrest

Skipping/not selecting missions can increase Unrest elsewhere.

Observed:
- Some consequences increase Unrest by 1.
- Some increase Unrest by 2.
- Completing missions in districts with Unrest may reduce Unrest.

This system may interact strongly with Archipelago progression stalls and
Mission Sanity.

Need to observe:
- Maximum district Unrest.
- How City Anarchy is calculated.
- Exact campaign-loss conditions.
- Normal methods for reducing Unrest.
- Whether filler missions can be used sustainably while waiting for AP
  progression.

## Strategy Resource Sources

Confirmed resources:
- Credits
- Elerium
- Intel

Currently observed sources for all three resources:
- Spec Ops
- Investigation missions
- Side missions

Continue recording other sources and typical reward amounts.

## District Unrest

Maximum observed/indicated Unrest per district:
- 5 stages

Unknown:
- Whether reaching Stage 5 causes an Emergency mission.
- Whether Emergency missions begin when advancing from Stage 4 toward Stage 5.
- Exact relationship between District Unrest and City Anarchy.

### Anarchy System Wiki Info
After becoming suspicious of how the anarchy and Extended anarchy system works, I looked it up and found this resource that explains what each system does:
[Anarchy (Chimera)](https://www.ufopaedia.org/Anarchy_(Chimera))

## Agent Promotion Observation

Promotions are based on agent XP/rank and are not tied to a single fixed mission.

Observed:
- Multiple agents received promotions after the current mission.
- Rank-up ability tiers unlock when the listed vanilla rank is reached.
- Because agents rotate through missions, promotion timing can vary by campaign.

This means agent rank milestones are suitable as dynamic AP locations rather
than fixed campaign-event checks.

## Training Unlock

Training became available after the first observed agent promotion.

All currently available permanent Training options appear to be:
- Basic Conditioning

Training is also used to remove Scars gained from negative mission experiences.

This means Training contains at least two different categories:
1. Permanent agent progression
2. Scar recovery

These should be treated differently by the randomizer.

Need to continue observing:
- Additional permanent Training upgrades
- Rank requirements
- Scar-recovery behavior
- Training duration
- Whether all agents share Basic Conditioning

## Training - Basic Conditioning

Observed agents with Basic Conditioning as their first permanent Training option:
- Godmother
- Verge
- Cherub
- Terminal
- Zephyr

Current observation:
Basic Conditioning appears to be the universal first permanent Training option.

This is not yet confirmed for all 11 agents.

Continue checking newly recruited agents.

# Things That May Break Randomization

Record any vanilla behavior that appears dependent on: - Specific
agents - Specific missions - Investigation order - Campaign day -
Tutorial state - Agent rank - Research completion - Fixed squad size -
Fixed roster size
campaign loss

## Notes:

# Questions for Source-Code Investigation

When gameplay exposes something we need to understand technically,
record it here before searching the SDK.

-   
