# Archipelago Randomizer - TODO / Development Notes

## Current Development Status

-   [x] Mod compiles successfully
-   [x] Mod loads in Chimera Squad
-   [x] Confirm custom logging works
-   [x] Confirm OnPreMission fires
-   [x] Create custom X2EventListener
-   [x] Investigate STRATEGY_TutorialMissionComplete_Submitted
-   [x] Confirm first tutorial mission completion listener works
-   [ ] Find reliable normal mission-completion event
-   [ ] Identify tactical -\> strategy transition
-   [ ] Identify safe breach / next-encounter hooks

# Randomization Design

-   [ ] Finish first-pass Progression Item design
-   [ ] Design Location / Check pool
-   [ ] Design Useful Filler pool
-   [ ] Design Trap pool
-   [ ] Design Progressive Campaign Access
-   [ ] Define victory condition
-   [ ] Determine minimum viable item/location pool for first playable
    APWorld

NOTE: Randomization design will remain provisional until an unmodded
campaign replay is completed to refresh understanding of vanilla
progression.

# Agent Randomization

## Agent Roster

-   [ ] Investigate vanilla 8-agent roster limit
-   [ ] Determine whether roster cap is hardcoded/configurable
-   [ ] Test adding a 9th agent
-   [ ] Test all 11 agents in one campaign
-   [ ] Test Armory UI with \>8 agents
-   [ ] Test Training with \>8 agents
-   [ ] Test Spec Ops with \>8 agents
-   [ ] Test assignment systems with \>8 agents
-   [ ] Test save/load with \>8 agents
-   [ ] Identify any scripted assumptions about specific recruited
    agents

Preferred design: - Support all 11 agents in one campaign.

Fallback: - Generate an 8-agent pool. - 4 agents start recruited. -
Remaining 4 are AP progression. - Other 3 agents and their associated
items/checks are excluded.

## Starting Agents

Tutorial ON: - \[ \] Confirm tutorial requires: - Godmother - Verge -
Cherub - Terminal - \[ \] Treat those agents' first Progressive Agent
items as precollected

Tutorial OFF: - \[ \] AP generation selects 4 starting agents - \[ \]
Starting agents receive their first Progressive Agent item as
precollected - \[ \] Confirm all agents can safely function as starting
agents

## Progressive Agents

-   [ ] Determine exact ability progression for all 11 agents
-   [ ] Determine how vanilla promotions grant abilities
-   [ ] Determine whether later abilities can safely be granted
    regardless of rank
-   [ ] Determine whether abilities depend technically on previous
    abilities
-   [ ] Investigate mutually exclusive ability choices
-   [ ] Determine exact number of Progressive `<Agent>`{=html} copies
    required per agent

Proposed behavior: - Progressive `<Agent>`{=html} #1 -\> Recruit agent
with baseline abilities - Later copies -\> Advance ability progression

Starting agents begin with copy #1 precollected.

## Progressive Agent Training

-   [ ] Determine exact Training upgrades for all agents
-   [ ] Determine how Training upgrades are rank-gated
-   [ ] Determine whether AP can grant completed Training bonuses
    directly
-   [ ] Determine whether AP Training should still consume campaign time
-   [ ] Determine whether Training upgrades depend on earlier Training
-   [ ] Determine behavior if Progressive Training arrives before
    Training is available

## Agent Pool / Hinting

If all 11 agents cannot safely coexist:

-   [ ] Implement Selected agent-pool mode
-   [ ] Implement Random Revealed agent-pool mode
-   [ ] Consider Random Hidden agent-pool mode
-   [ ] Ensure excluded agents have no Progressive Agent items
-   [ ] Ensure excluded agents have no Progressive Training items
-   [ ] Ensure excluded agents have no agent-specific checks
-   [ ] Ensure APWorld logic knows selected agent pool

# Experimental Squad Size

Vanilla mission squad size is 4.

Potential experimental progression: - Start at 4 - Progressive Squad
Size #1 -\> 5 - Progressive Squad Size #2 -\> 6

Investigation: - \[ \] Find tactical squad-size definition - \[ \]
Determine whether breach system assumes exactly 4 agents - \[ \]
Determine how many breach positions maps support - \[ \] Test
initiative/turn-order UI with \>4 agents - \[ \] Test tactical HUD with
\>4 agents - \[ \] Test mission deployment with \>4 agents - \[ \] Test
scripted missions with \>4 agents - \[ \] Test evac/objective systems
with \>4 agents - \[ \] Determine effect on encounter balance

NOTE: This is a stretch/experimental feature, not currently required for
MVP.

# Campaign / Story Progression

-   [ ] Investigate Day 60 event/mission
-   [ ] Investigate Day 90 event/final mission
-   [ ] Identify other major scripted campaign milestones
-   [ ] Design Progressive Campaign Access
-   [ ] Determine which story events can safely be AP-gated
-   [ ] Determine which vanilla prerequisites must remain
-   [ ] Make AP-unlocked story missions remain available where practical
-   [ ] Identify exact campaign victory event
-   [ ] Connect final victory event to Archipelago goal completion

# Faction / Investigation Progression

Current direction: - Preserve vanilla one-investigation-at-a-time
progression. - First Groundwork mission should probably remain
automatically available. - Prefer Progressive Investigation /
Progressive Faction Mission progression over independent faction-access
items. - Queue excess investigation progression if multiple copies
arrive before they can safely be used.

Investigation: - \[ \] Determine how investigations are created and
started - \[ \] Observe how the second faction investigation becomes
available - \[ \] Observe how the third faction investigation becomes
available - \[ \] Determine whether later faction order is fixed or
player-selected - \[ \] Identify mandatory vs procedural faction
missions - \[ \] Determine how Groundwork, Operations, and Takedown
missions are unlocked - \[ \] Determine whether multiple
investigation-progression unlocks can safely be queued - \[ \] Identify
reliable completion events for Groundwork, Operations, and Takedowns

# Vanilla Reward -\> AP Check Conversion

Core rule:

Whenever vanilla Chimera Squad would naturally grant progression that
has been moved into the AP item pool, the natural award point should
become an outgoing Archipelago location/check where practical.

Examples: - Agent promotion -\> Agent rank check - Training milestone
-\> Training-related check - Story progression -\> Story check -
Research progression -\> Potential research check

-   [ ] Identify vanilla reward points for every randomized progression
    system
-   [ ] Prevent vanilla from granting randomized rewards directly
-   [ ] Trigger corresponding AP location instead
-   [ ] Check AP logic for circular/self-locking progression

# Tutorial / System Availability

-   [x] Confirm base game supports Tutorial ON/OFF at New Game
-   [x] Identify DioStrategyTutorialHelper.IsAssignmentAvailable()
-   [x] Confirm base game uses tutorial/system availability gates
-   [ ] Determine which randomized systems require availability gating
-   [ ] Determine whether base-game gates are sufficient for AP
-   [ ] Add AP-specific readiness listeners only where necessary

Known assignment gates: - Research - SpecOps - Train - Armory - Supply -
Investigation - ScavengerMarket

# Unmodded Tutorial Verification

## Tutorial ON

-   [ ] Play partial unmodded campaign with Tutorial ON
-   [ ] Observe Assembly unlock
-   [ ] Observe Training unlock
-   [ ] Observe Spec Ops unlock
-   [ ] Observe Armory/Investigation tutorials
-   [ ] Determine whether game forces player into newly unlocked systems
-   [ ] Record major strategy-system unlock timing
-   [ ] Record forced cutscenes/UI transitions

## Tutorial OFF

-   [ ] Play partial unmodded campaign with Tutorial OFF
-   [ ] Compare immediately available systems
-   [ ] Compare unlock timing
-   [ ] Identify tutorial-only missions/events
-   [ ] Determine which progression restrictions disappear
-   [ ] Record differences relevant to AP item gating

# Item Delivery System

## Core Architecture

-   [ ] Separate AP item receipt from item application
-   [ ] Maintain persistent received-item ledger
-   [ ] Track Received / Queued / Applied
-   [ ] Track blocked reason for queued items
-   [ ] Prevent duplicate applications after reconnect
-   [ ] Make queue survive save/load

## Delivery Context

-   [ ] Tactical-immediate items
-   [ ] Next Encounter / Breach items
-   [ ] Strategy / HQ items
-   [ ] Determine which opening-tutorial effects must be deferred
-   [ ] Pause incompatible delivery when game context changes
-   [ ] Resume delivery when required context becomes available

## Player Feedback

-   [ ] Notify player when AP item is received
-   [ ] Notify player when item is queued
-   [ ] Explain why queued item is blocked
-   [ ] Create summary notification for large item batches
-   [ ] Avoid notification spam
-   [ ] Consider UI for reviewing pending AP items

# Performance / Large AP Packets

-   [ ] Never apply large AP packet in one frame
-   [ ] Throttle item application
-   [ ] Determine safe processing rate
-   [ ] Pause processing during loading/transitions/cutscenes
-   [ ] Pause incompatible HQ rewards when tactical mission starts
-   [ ] Resume queue when appropriate
-   [ ] Stress-test large received-item batches

# Campaign Settings / YAML

AP-controlled: - \[ \] Difficulty - \[ \] Tutorial ON/OFF - \[ \]
Ironman forced OFF during development - \[ \] Hardcore Mode forced OFF
during development - \[ \] Extended City Anarchy forced OFF until
investigated

Hardcore investigation: - \[ \] Determine exactly what happens when a
Hardcore campaign fails - \[ \] Determine whether failed campaign save
can be recovered - \[ \] Determine what happens to outstanding AP
locations after campaign failure - \[ \] Determine whether AP needs a
campaign-failure recovery mechanism - \[ \] Decide whether Hardcore can
eventually become a supported YAML option

Player-controlled where practical: - Heal Between Encounters -
Accessibility settings - Presentation settings

Investigation: - \[ \] Inspect campaign-settings storage - \[ \] Inspect
New Game UI - \[ \] Inspect DioMenuButton.uc - \[ \] Determine how
AP-controlled settings can be locked - \[ \] Clearly indicate
AP-controlled settings in UI - \[ \] Add explanatory tooltip/text for
locked settings

# Standard Archipelago Options

-   [ ] Implement standard Progression Balancing option
-   [ ] Implement player-controlled trap frequency
-   [ ] Keep trap frequency independent from campaign difficulty
-   [ ] Determine appropriate accessibility/logic options for YAML

# Difficulty Integration

-   [ ] Determine how difficulty affects enemy HP/stats
-   [ ] Determine how difficulty affects enemy abilities/loadouts
-   [ ] Determine whether difficulty affects AI behavior
-   [ ] Determine whether dynamically spawned enemies automatically
    inherit difficulty
-   [ ] Identify normal enemy spawning pipeline
-   [ ] Ensure AP enemies use normal initialization
-   [ ] Determine whether difficulty should change Ambush enemy
    pools/weights
-   [ ] Investigate difficulty-aware filler/progressive rewards

# Mission Safety / Traps

-   [ ] Identify scripted/story missions
-   [ ] Determine which encounters safely support extra enemies
-   [ ] Design Ambush / Extra Enemy trap
-   [ ] Test spawning extra enemy in breach encounter
-   [ ] Defer traps when next encounter is unsafe
-   [ ] Prevent traps from creating unwinnable states

# Reward / Check Delivery Investigation

-   [ ] Investigate GiveRewards()
-   [ ] Determine what GameState objects GiveRewards modifies
-   [ ] Determine whether it can be reused/mirrored for AP rewards
-   [ ] Determine mission reward timing
-   [ ] Find reliable normal mission-completion event
-   [ ] Identify safe mission-check sending point
-   [ ] Identify safe HQ queue processing point

# UI Changes

-   [ ] Figure out how to show in UI on Start new game what options is
    locked by AP Gen.
-   [ ] Design or commission AP item logos/sprites/profiles for
    Assembly/Supply/Research(if applicable), ect.

## Recruitment Location Accessibility

-   [ ] Determine exactly how vanilla recruitment choices are generated
-   [ ] Determine what happens internally to unselected recruits
-   [ ] Determine when the game knows no further recruitment is possible
-   [ ] Determine whether recruitment choices are persistent or
    regenerated
-   [ ] Investigate moving inaccessible AP recruitment checks into
    Supply
-   [ ] Investigate dynamically adding AP checks/items to Supply
-   [ ] Design pricing for migrated recruitment checks
-   [ ] Implement final-recruitment auto-check fallback if migration is
    impractical
-   [ ] Guarantee recruitment locations can never become permanently
    inaccessible

## Supply AP Investigation

-   [ ] Determine how Supply inventory is generated
-   [ ] Determine how Supply filters/categories work
-   [ ] Determine whether a custom Archipelago filter can be added
-   [ ] Determine whether dynamic AP shop entries can be created
-   [ ] Determine whether new AP entries can be added during a campaign
-   [ ] Identify good campaign triggers for additional Supply AP checks
-   [ ] Record normal Credit income throughout vanilla playthrough
-   [ ] Record major unavoidable/typical Credit expenses
-   [ ] Determine reasonable AP Supply check prices
-   [ ] Determine reasonable recovered recruitment-check price
-   [ ] Test whether migrated locations can retain their original AP
    Location ID

## Mission Sanity Investigation

-   [ ] Determine whether filler missions are effectively unlimited
-   [ ] Determine which campaign missions are fixed vs procedurally
    generated
-   [ ] Categorize mission types and record their rewards
-   [ ] Identify all mission types that should / should not increment
    Mission Sanity
-   [ ] Confirm failed and aborted missions do NOT increment the counter
-   [ ] Find a common successful mission-completion hook
-   [ ] Determine whether ordinary missions have stable identifiers for
    debugging/reference
-   [ ] Create a persistent successful-mission counter
-   [ ] Ensure core missions increment Mission Sanity while also sending
    their dedicated checks
-   [ ] Determine appropriate finite Mission Sanity check counts
-   [ ] Determine Mission Sanity YAML format
-   [ ] Ensure missions completed after the generated cap do not create
    additional AP checks

## Difficulty Setting Control

- [ ] Confirm every UI location where difficulty can be changed
- [ ] Investigate New Game difficulty controls
- [ ] Investigate pause/options-menu difficulty controls
- [ ] Determine whether difficulty can be changed through any other menus
- [ ] Decide whether AP difficulty is seed-locked or start-only
- [ ] If seed-locked, disable difficulty changes in all relevant UI
- [ ] Show clear feedback that difficulty is controlled by the AP seed
- [ ] Ensure difficulty-aware AP effects read the authoritative difficulty value
- [ ] Leave Heal Between Encounters player-controlled unless AP logic later depends on it

# Useful Source Investigations

-   [ ] Continue studying X2StrategyElement_DioMissionSources.uc
-   [ ] Continue studying X2StrategyGameRuleset.uc
-   [ ] Continue studying X2TacticalGameRuleset.uc
-   [ ] Continue studying XComTacticalGame.uc
-   [ ] Continue studying DioStrategyTutorialHelper.uc as needed
-   [ ] Inspect DioMenuButton.uc before Game Start UI work
-   [ ] Investigate agent recruitment code
-   [ ] Investigate agent promotion/ability code
-   [ ] Investigate Training code
-   [ ] Investigate roster-size code
-   [ ] Investigate tactical squad-size/breach code

# Known Useful Events / Hooks

-   STRATEGY_TutorialMissionComplete_Submitted
-   STRATEGY_InvestigationMissionSuccess_Immediate
-   STRATEGY_OpportunityMissionSuccess
-   STRATEGY_ResearchCompleted_Submitted
-   STRATEGY_CharacterUnlocked_Submitted
-   STRATEGY_InvestigationStarted_Submitted
