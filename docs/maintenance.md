# Repository Maintenance

## Cleaning Obsolete Branches
After releases, your local repository can get cluttered with old feature branches (`feat/`, `fix/`) that have already been merged.

### Manual Cleanup
To delete a branch locally:
```bash
git branch -d feat/old-feature
```

### Automated Cleanup
Use the provided script in `scripts/clean-branches.sh` to remove all local branches that have been merged into your current branch.

## Cleaning Obsolete Documentation
Documentation often rots. Schedule a "Docs Gardening" session every few sprints.

1.  **Check for "TODO" comments**: `grep -r "TODO" .`
2.  **Verify Setup Instructions**: Try setting up the project from scratch using only the README.
3.  **Remove Dead Files**: If a feature was removed in `v2.0.0`, ensure its `docs/feature-guide.md` is also deleted.

## Git Housekeeping
Occasionally run garbage collection to optimize the local repository:
```bash
git gc
```
