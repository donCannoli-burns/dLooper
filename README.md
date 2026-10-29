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

KoLmafia dependencies are declared in [`kolmafia/dependencies.txt`](kolmafia/dependencies.txt). This fork uses [dTrack](https://github.com/donCannoli-burns/dTrack) and [dUpdates](https://github.com/donCannoli-burns/dUpdates) instead of their upstream counterparts. Other declared dependencies remain garbo, combo, CONSUME.ash, UberPvPOptimizer, and PVP_MAB.

In-game requirements inherited from upstream:
- Clan VIP
- Stooper
- All CBB recipes
- A lavaco lamp if you own Left-Hand Man

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
