# dLooper

> **Original project and credit:** [Prusias-kol/pLooper](https://github.com/Prusias-kol/pLooper) by Prusias-kol. This is a separate experimental fork maintained at [donCannoli-burns/dLooper](https://github.com/donCannoli-burns/dLooper).
>
> **EXPERIMENTAL — USE AT YOUR OWN RISK.** This fork is not guaranteed to be stable or safe. Review settings and scripts before running them, especially commands that spend turns, change inventory, use the mall, PvP, or ascend. The upstream author is not responsible for modifications in this fork.

A reentrant KoLmafia day/ascension wrapper derived from pLooper: breakfast → garbo → pre-run preparation → configurable Community Service ascend → post-run preparation → garbo → nightcap, with breakpoints at notable moments.

## Install, update, and remove

Run these commands in the **KoLmafia gCLI** (not your operating system's Git shell).

**Install**
```
git checkout https://github.com/donCannoli-burns/dLooper main
```

**Update**
```
git update donCannoli-burns-dLooper-main
```

**Remove this fork**
```
git delete donCannoli-burns-dLooper-main
```

If you previously installed the original upstream project, use `git list` to confirm its installed project ID before optionally deleting it with `git delete Prusias-kol-pLooper-main`. Avoid keeping upstream and fork versions installed simultaneously when they supply the same script filenames.

## Dependencies and hard requirements

KoLmafia checkout dependencies are declared in [`kolmafia/dependencies.txt`](kolmafia/dependencies.txt). The declared list now includes:

- **Tracking and updates:** [dTrack](https://github.com/donCannoli-burns/dTrack) and [dUpdates](https://github.com/donCannoli-burns/dUpdates) (replacing upstream pTrack/pUpdates).
- **Loop integrations:** [garbage-collector (garbo)](https://github.com/loathers/garbage-collector), [don_combo (release)](https://github.com/donCannoli-burns/don_combo) (replacing upstream combo), [CONSUME.ash](https://github.com/soolar/CONSUME.ash), [UberPvPOptimizer](https://github.com/loathers/UberPvPOptimizer), and [PVP_MAB](https://github.com/Pantocyclus/PVP_MAB).
- **Additional don scripts:** [don_custom_functions](https://github.com/donCannoli-burns/don_custom_functions), [don-ash-lib](https://github.com/donCannoli-burns/don-ash-lib), [don_philter](https://github.com/donCannoli-burns/don_philter), [UnderTheSea](https://github.com/donCannoli-burns/UnderTheSea), [don_ascend](https://github.com/donCannoli-burns/don_ascend), and [mall-manager](https://github.com/donCannoli-burns/mall-manager).
- **Experimental/source-oriented projects:** [KOL-WaterSheep](https://github.com/donCannoli-burns/KOL-WaterSheep), [don_grimoire](https://github.com/donCannoli-burns/don_grimoire), [don_libram](https://github.com/donCannoli-burns/don_libram), and [don_eslint-plugin-libram](https://github.com/donCannoli-burns/don_eslint-plugin-libram).

**Compatibility warning:** The last group contains Python/TypeScript/Node tooling and libraries, not all directly runnable KoLmafia scripts. Installing them as KoLmafia Git dependencies does not install their Python/npm packages or compile TypeScript; some repositories may sync no usable KoLmafia files. In particular, `don_libram` defaults to its source-oriented `main` branch rather than a purpose-built KoLmafia `release` branch. This expanded dependency set is **experimental and untested in a clean KoLmafia checkout**. Before running the loop, run `git list` and `git sync`, check for conflicting script filenames, and verify the scripts you intend to use. The checkout may be substantially larger than upstream.

In-game requirements inherited from upstream:
- Clan VIP
- Stooper
- All CBB recipes
- A lavaco lamp if you own Left-Hand Man

## Shared-helper migration

The former `kolmafia/scripts/ploophelpers/lowerstats.ash` and `tapion_praccess.ash` were moved into the already declared [don_custom_functions](https://github.com/donCannoli-burns/don_custom_functions) dependency as `scripts/don_lowerstats.ash` and `scripts/don_praccess.ash`. Their original gameplay behavior is retained; the PirateRealm script now imports `don_lowerstats.ash`. The upstream source remains available in Git history. `pLoop.ash` does not directly call either helper.

To invoke the separate PirateRealm helper after installing dependencies, use `call don_praccess.ash`. **It spends resources and performs gameplay; do not use as a smoke test.** Do not rely on the removed filenames after a clean checkout.

## How to use

The command remains `ploop` (renaming a GitHub repository does **not** rename the installed ASH entrypoint):

```
ploop help
```

The legacy update command called by the script remains `pUpdates check ploop`. Update data for this fork is stored at [`kolmafia/data/dUpdates/prusias_pUpdates_ploop.txt`](kolmafia/data/dUpdates/prusias_pUpdates_ploop.txt). The older `data/pUpdates` directory is a legacy path; dUpdates supports reading older update files for compatibility.

## Farming optimizations

- Inserts [dTrack](https://github.com/donCannoli-burns/dTrack) / `ptrack` breakpoints. Run `ptrack help` to view them.
- Can perm skills and use the big book of every skill if karma exceeds 2000. Consider disabling this in breakfast when softcore ascending to avoid unexpected karma spending.
- Ensures one pizza of legend each (some Community Service scripts consume them).
- Uses Glenn's Golden Dice and lodestone with garbo.
- Fuels Asdon Martin if owned.
- Uses burning cape for rollover if within the configured price threshold.
- Equips lavaco lamp on Left-Hand Man, or attempts solid shifting time weirdness, at nightcap.

## Pre-run preparation

Run `ploop help` to learn how to modify the custom acquisition list. The inherited default flow can acquire:
- Legendary CBB pizzas within the configured price range
- borrowed time and non-Euclidean angle
- abstraction: Category
- tobiko marble soda and wasabi marble soda
- one-day ticket to Dinseylandfill
- Garden setup

**Caution:** This script can perform consequential game actions, including spending resources and ascending. Confirm its configuration and dependencies before running a loop.
