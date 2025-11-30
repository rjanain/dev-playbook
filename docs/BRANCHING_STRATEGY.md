---
# Branching strategy: main ↔ develop (post-release sync)

This document explains how we manage `main` and `develop` and how to sync `develop` after a release merge into `main`.

## Overview

- `main` is the production branch — it always reflects what is deployed.
- `develop` is the integration branch for ongoing work and integration testing.
- After a release is merged into `main`, we sometimes need `develop` to match `main` (for example, to discard temporary or stale commits on `develop` that were not merged).

> Caution: resetting `develop` rewrites history. Coordinate with your team before doing this.

## When to reset `develop`

Use a reset when:
- A release merged into `main` should be the canonical state moving forward.
- You intentionally want to discard commits on `develop` that were not merged into `main`.
- All active contributors are aware and have saved any work in progress (WIP branches).

## Post-release sync (safe procedure)

1. Fetch the latest remote state:
   git fetch origin

2. Checkout `develop`:
   git checkout develop

3. Reset your local `develop` to match `main`:
   git reset --hard origin/main

4. Push the rewritten `develop` to the remote. Prefer `--force-with-lease`:
   git push --force-with-lease origin develop

Example:
```bash
git fetch origin
git checkout develop
git reset --hard origin/main
git push --force-with-lease origin develop
```

## Why use --force-with-lease

`--force-with-lease` prevents overwriting remote changes you don't have locally. It is safer than `--force` because it will fail if the remote branch advanced since your last fetch.

## Communication & coordination

- Announce intent to reset `develop` on your team communication channel (e.g., Slack) and wait for confirmations from active contributors.
- Ask contributors to:
  - Push any WIP branches to remote,
  - Or create patches (git format-patch) or backup branches if needed.

## Recovery steps for affected developers

If someone has work based on the old `develop`, they should:

1. Fetch:
   git fetch origin

2. Create a backup branch from their local `develop`:
   git branch backup/develop-before-reset

3. Rebase their work onto the new `develop`:
   git checkout my-feature
   git rebase --onto origin/develop 
