# Archipelago Randomizer - TODO / Design Notes

## Current Development
- [x] Mod compiles successfully
- [x] Mod loads in Chimera Squad
- [x] Confirm custom logging works
- [x] Confirm OnPreMission fires
- [ ] Find reliable normal mission-completion event
- [ ] Investigate STRATEGY_TutorialMissionComplete_Submitted
- [ ] Determine safe AP activation point after Prologue

## Prologue / Tutorial
- [ ] Add YAML option: skip_prologue
- [ ] If Prologue is played, disable AP effects until tutorial completes
- [ ] If Prologue is skipped, activate AP after post-Prologue state is established
- [ ] Both paths should call the same AP activation system
- [ ] Prevent traps/items from affecting the Prologue

## Item Delivery System

### Item Types
- [ ] Tactical-immediate items
  - Free Reload
  - Extra Grenade
  - Combat buffs/etc.

- [ ] Next-encounter items
  - Enemy traps such as spawning a Ronin
  - Breach modifiers

- [ ] HQ/Strategy items
  - Research
  - Weapon tier upgrades
  - Agent unlocks
  - Permanent equipment/resources

### Item Queue
- [ ] Receiving an AP item and applying it must be separate operations
- [ ] Maintain persistent received-item ledger
- [ ] Track Received / Queued / Applied
- [ ] Prevent duplicate items after reconnecting
- [ ] Queue items that cannot safely be applied in the current game state
- [ ] Pause HQ item processing when player leaves HQ
- [ ] Resume HQ queue when player returns

## Performance / Large Item Packets
- [ ] Never apply a large AP packet all in one frame
- [ ] Throttle item delivery
- [ ] Test safe item-processing rate
- [ ] Pause processing during loading/transitions/cutscenes
- [ ] Consider one summary notification for large batches
- [ ] Apply items gradually in the background
- [ ] Make pending queue survive save/load

## Mission Safety
- [ ] Identify scripted/story missions
- [ ] Determine whether adding enemies can break scripted encounters
- [ ] Test "Spawn Ronin in next breach room" trap
- [ ] If an encounter cannot safely accept a trap, defer it
- [ ] Prologue always receives special protection

## Source Code Investigations
- [ ] Study X2StrategyElement_DioMissionSources.uc
- [ ] Study X2TacticalGameRuleset.uc
- [ ] Study XComTacticalGame.uc
- [ ] Investigate tutorial completion event
- [ ] Identify tactical → strategy transition
- [ ] Identify normal mission success/completion events
- [ ] Identify breach/next-encounter hooks