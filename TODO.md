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

## Assembly Investigation

- [ ] Confirm Android ownership/deployment limit
- [ ] Determine whether destroyed Androids can be replaced
- [ ] Identify all Assembly projects
- [ ] Record prerequisites for each Assembly project
- [ ] Record every Supply unlock produced by Assembly
- [ ] Identify priority Assembly projects
- [ ] Determine which Assembly projects are safe to randomize
- [ ] Keep Android Personnel available through tutorial progression
- [ ] Determine whether Android Personnel completion should still send a check


## Investigation Mission Progression

- [ ] Determine exactly how Investigation mission reveal timers work
- [ ] Determine what "+X Days" toward an Investigation mission actually modifies
- [ ] Identify core vs reveal-acceleration Investigation missions
- [ ] Determine whether reveal progress can safely be controlled by AP
- [ ] Determine whether vanilla reveal-progress rewards must remain active
- [ ] Determine whether Progressive Investigation can replace/advance the normal
      core-mission reveal requirement


## Spec Ops

- [ ] Record available Spec Ops
- [ ] Record Spec Ops rewards
- [ ] Determine whether Spec Ops are repeatable
- [ ] Determine what agent ranks unlock advanced Spec Ops
- [ ] Evaluate optional Spec Op Sanity after vanilla behavior is understood


## Unrest / City Anarchy

- [ ] Record maximum District Unrest
- [ ] Record how missions increase/decrease Unrest
- [ ] Determine how City Anarchy increases
- [ ] Determine campaign-loss threshold
- [ ] Identify every vanilla method for reducing Unrest / Anarchy
- [ ] Determine whether waiting for AP progression can create unavoidable loss
- [ ] Brainstorm AP Unrest mitigation after vanilla system is understood


## Resource Economy

- [ ] Track Credit income and expenses
- [ ] Track Elerium income and expenses
- [ ] Track Intel income and expenses
- [ ] Determine whether Intel should be available as AP filler
- [ ] Determine whether starting Intel needs a YAML option

## Extended City Anarchy Investigation

- [ ] Determine what the "Extended City Anarchy" campaign option actually changes
- [ ] Find the config/state variable storing Extended City Anarchy
- [ ] Search SDK usage of that variable
- [ ] Compare normal City Anarchy behavior with Extended City Anarchy enabled
- [ ] Determine whether Extended City Anarchy changes:
  - [ ] Maximum Anarchy
  - [ ] Anarchy gain
  - [ ] Unrest gain
  - [ ] Emergency missions
  - [ ] Campaign-loss conditions
  - [ ] Something else
- [ ] Reevaluate whether AP actually needs to force Extended City Anarchy OFF

## Campaign Failure / State Recovery

- [ ] Determine exactly what happens to saves after normal City Anarchy failure
- [ ] Determine exactly what happens to saves after Hardcore failure
- [ ] Determine what AP state can be reconstructed from the server after reconnect
- [ ] Design AP item ownership vs locally-applied-item tracking
- [ ] Ensure previously received items can be reapplied to a restarted campaign
- [ ] Ensure previously checked locations cannot be checked/sent twice
- [ ] Determine how Mission Sanity counter behaves across campaign restart
- [ ] Determine how Progressive Investigation behaves across campaign restart
- [ ] Determine how agent progression behaves across campaign restart
- [ ] Determine how one-time resource filler behaves across campaign restart
- [ ] Determine how traps behave during state reconstruction
- [ ] Ensure reconnect/recovery does NOT replay previously received traps
- [ ] Test reconnecting an older save to a newer AP server state
- [ ] Test connecting a brand-new campaign to an existing AP slot

## Slot Recovery / Collected-State Handling

- [ ] Treat AP checked locations as authoritative across campaign restarts
- [ ] Restore Mission Sanity counter from AP slot state
- [ ] Ensure already-collected locations never resend checks
- [ ] Design "already collected" UI state for recruit locations
- [ ] Generalize already-collected visual state for other AP UI checks
- [ ] Reapply/regrant received non-trap items after campaign restart
- [ ] Track traps as one-shot consumed effects
- [ ] Ensure traps never replay after reconnect/reload/new campaign
- [ ] Decide later whether consumable recovery needs anti-duplication safeguards

## Agent Ability / Promotion Investigation

- [ ] Determine exact rank progression data for all agents
- [ ] Identify event fired when an agent reaches a new rank
- [ ] Determine how Armory ability icons are enabled/disabled
- [ ] Determine how mutually exclusive ability choices are stored
- [ ] Determine whether AP can unlock a rank-tier ability before vanilla rank
- [ ] Determine whether Training prerequisites depend on vanilla rank or ability state
- [ ] Design AP marker/icon for "ability received before rank reached"
- [ ] Ensure reaching rank sends check only once

## Agent Rank / AP Progression Investigation

### Vanilla Rank System

- [ ] Find where agent XP is stored
- [ ] Find where mission XP is awarded
- [ ] Find the XP thresholds for each vanilla agent rank
- [ ] Find where XP normally causes rank advancement
- [ ] Determine whether rank and XP are stored independently
- [ ] Determine which game systems directly read the agent's stored vanilla rank
- [ ] Determine whether we can safely separate effective AP rank from background
      XP milestone progression


### Background XP Check System

- [ ] Design background tracking for vanilla XP rank milestones
- [ ] Ensure agents continue earning XP normally
- [ ] Detect when each vanilla XP threshold is reached
- [ ] Send corresponding AP location when each XP milestone is reached
- [ ] Ensure each XP milestone location sends only once
- [ ] Ensure XP milestone completion does NOT grant abilities
- [ ] Ensure XP milestone completion does NOT create a promotion notification
- [ ] Ensure XP milestone completion does NOT change AP-driven effective rank
- [ ] Test multiple XP milestones being crossed before corresponding AP
      progression is received


### AP-Driven Effective Rank

- [ ] Determine how Progressive <Agent> should map to effective rank tiers
- [ ] Create/identify state for each agent's AP-driven effective rank
- [ ] Make ability availability use AP-driven progression
- [ ] Make relevant Armory UI use AP-driven progression
- [ ] Make rank-dependent Training use AP-driven progression
- [ ] Identify other systems that depend on agent rank
- [ ] Determine which rank checks must use AP effective rank
- [ ] Determine whether any systems must continue using background XP/rank
- [ ] Test AP effective rank being ahead of background XP
- [ ] Test background XP milestones being ahead of AP effective rank


### Promotion UI

- [ ] Find where the promotion icon/notification is activated
- [ ] Suppress promotion notification from background XP milestones
- [ ] Trigger promotion notification when Progressive <Agent> is received
- [ ] Find where ability icons are enabled/disabled
- [ ] Allow AP-received ability tiers to become available immediately in HQ
- [ ] Keep unreceived AP ability tiers greyed out
- [ ] Design AP marker for ability/rank tiers received before their XP check
      milestone has been completed
- [ ] Determine whether another visual state is needed when XP milestone is
      complete but AP progression has not been received


### Ability Choices

- [ ] Confirm whether Field Agent abilities are mutually exclusive choices
- [ ] Confirm whether Senior Agent abilities are mutually exclusive choices
- [ ] Determine how mutually exclusive ability selections are stored
- [ ] Allow choices immediately when corresponding AP progression is received
- [ ] Ensure later background XP milestone does not alter/reopen the choice


### Training Interaction

- [ ] Determine exactly which vanilla ranks unlock Training options
- [ ] Determine how Training checks agent rank
- [ ] Make appropriate Training prerequisites use AP-driven effective rank
- [ ] Determine whether individual Training upgrades should be included within
      Progressive <Agent> or randomized separately
- [ ] Ensure background XP alone cannot prematurely unlock randomized Training


### Tutorial Interaction

- [ ] Find what triggers the first promotion tutorial dialogue
- [ ] Determine whether tutorial expects actual vanilla rank advancement
- [ ] Preserve first-promotion tutorial behavior using AP-driven progression
- [ ] Test receiving first Progressive <Agent> before equivalent XP milestone
- [ ] Test reaching first XP milestone before receiving equivalent AP progression


### Tactical / HQ Delivery

- [ ] Queue Progressive <Agent> received during Tactical
- [ ] Apply queued agent progression after returning safely to HQ
- [ ] Trigger promotion indicator after queued progression is applied
- [ ] Ensure newly received ability is usable on the next mission

## Rank Query Investigation

- [ ] Find the primary functions used to query an agent's current rank
- [ ] Determine whether UI and gameplay systems use helper functions or read rank fields directly
- [ ] Identify the safest interception point for effective AP rank
- [ ] Determine which systems must continue seeing vanilla/background rank
- [ ] Avoid modifying vanilla XP storage unless absolutely necessary
- [ ] Test whether AP effective rank can be substituted without breaking promotion history

## Agent Training Investigation

- [ ] Confirm Training unlocks after first agent promotion in Tutorial ON
- [ ] Compare Training availability in Tutorial OFF
- [ ] Identify all permanent Training upgrades for each agent
- [ ] Identify all Scar-removal Training entries
- [ ] Separate permanent progression Training from Scar recovery
- [ ] Determine how permanent Training completion is stored on an agent
- [ ] Determine whether permanent Training can be granted directly without
      spending Training time
- [ ] Determine whether Training upgrades have prerequisite Training upgrades
- [ ] Determine whether AP can grant later Training before vanilla rank
- [ ] Queue Progressive <Agent> Training only while Training system is globally
      unavailable
- [ ] Allow Training progression to be stored for unrecruited agents
- [ ] Ensure Progressive <Agent> Training never recruits the agent
- [ ] Apply/reconcile stored Training progression when the agent is recruited

## Training Check / UI Investigation

- [ ] Determine how Training options become visible based on agent rank
- [ ] Redirect Training rank checks toward AP-driven effective rank where needed
- [ ] Identify completion event for individual Training projects
- [ ] Prevent randomized Training completion from granting duplicate vanilla reward
- [ ] Create AP location identity for each permanent Training opportunity
- [ ] Determine how completed Training is stored per agent
- [ ] Modify Training UI to show assigned AP item
- [ ] Show AP item classification/type in Training UI
- [ ] Show already-collected state for Training locations
- [ ] Investigate automatic hinting of Progressive items from Training UI
- [ ] Keep Scar recovery Training outside randomized progression

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

# Extra Unsorted TODO
-   [ ] Investigate what the Archipelago client API gives us for received-item ordering/indexes for clean implamentation of
    reconciliation system