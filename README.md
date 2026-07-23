# Loot-Bearing Bandits (Continued)

A Build 42 maintenance continuation of **[B42] Loot-Bearing Bandits** by **Lynch**
([Workshop 3491939136](https://steamcommunity.com/sharedfiles/filedetails/?id=3491939136)).

Original mod by Lynch. This repository contains a repaired build targeting **Project Zomboid 42.19**,
published with permission. All credit for the original design, outfits, and loot tables belongs to Lynch.

## What this mod does

Adds a custom zombie outfit (`L_BanditENH`) — bandit-looking zombies in military-grade armor who spawn
with heavy weaponry (rifles, shotguns, assault rifles, handguns) and drop ammunition, magazines, and
utility loot on death.

It uses only vanilla systems (`AttachedWeaponDefinitions.attachedWeaponCustomOutfit` and
`ZombiesZoneDefinition`), the same way vanilla defines its own `PrivateMilitia` and `Police` zombies.

## Requirements

- Project Zomboid **Build 42.19**
- **No mod dependencies.** This mod is standalone and runs on vanilla.

## Installation

Subscribe on the Steam Workshop, or copy `mods/BanditZombiesExpanded` into your
`%UserProfile%/Zomboid/mods/` folder.

Module ID: `LootBearingBanditsContinued`

## What was fixed

The original mod was written against Build 41 APIs and crashed on Build 42. Fifteen fixes were applied.

### Crash fixes

| # | Issue | Detail |
|---|-------|--------|
| 1 | **Kill-crash — B42 ammo API break** | In B42, `HandWeapon:getAmmoType()` returns an `AmmoType` object rather than a string. Passing it to `AddItem()` threw `No implementation found for function: AddItem(... AmmoType ...)` and crashed on killing any armed bandit. Now resolved via `getItemKey()`. |
| 2 | **Kill-crash — nil magazine dereference** | Weapons without a magazine type returned `nil`, so `AddItem(nil)` returned `nil` and the following `setCurrentAmmoCount()` call crashed. Guarded. |
| 3 | **Game-start crash — undefined function** | `Events.OnGameStart.Add(LBagLootSandboxLoader)` referenced a function that was never defined. Removed. |
| 4 | **Init crash — nil table access** | `attachedWeaponCustomOutfit` was indexed without a nil guard. Guarded. |

### Stability and correctness

- Nil guards on zombie inventory, attached items, inventory item list, and backpack items
- Nil/empty guards before every ammo, ammo-box, and magazine insertion
- Sandbox variable nil guard; `require` wrapped in `pcall`
- Duplicate spawn-zone entry prevented when `OnPostDistributionMerge` fires more than once
- Iteration safety counter in the loot-selection loop
- Fixed mismatched sandbox translation keys so settings show readable labels
- Removed a duplicate `KitchenKnife` entry that had double spawn weight
- Fixed two `ZombRand` off-by-one errors: magazines can now spawn full, and the final loot-table entry
  (`Soap`) is now reachable
- Removed unused locals and a meaningless return value

## Verification

Tested in-game on Build 42.19 in single-player. Confirmed working across multiple bandit kills with a
clean debug log: loose ammunition (12g and 7.62x51mm), magazines, and backpack loot all spawn correctly
with no errors.

Multiplayer is untested.

## Credits

- **Lynch** — original mod, all original design and assets
- Original loot-handling code derived in part from **Handlebar**, as noted in the source

## License

Distributed with permission from the original author. Please respect the original author's terms.
