# Engineering Standards & Practices Playbook

This repository contains concise guidelines for managing GitHub repositories, versioning, and project workflows.

## Table of Contents

1.  [**Branching Strategy**](docs/branching-strategy.md)
    -   Naming conventions (`feat/`, `fix/`, etc.)
    -   Gitflow / Feature Branch workflow
2.  [**Versioning & Releases**](docs/versioning-releases.md)
    -   Semantic Versioning (`v2.1.0` -> `v2.1.1`)
    -   Tagging and GitHub Releases
3.  [**Project Management**](docs/project-management.md)
    -   Tracking Issues and Bugs
    -   Labels and Milestones
4.  [**Branch Protection**](docs/branch-protection.md)
    -   Settings for Single Contributors
    -   Settings for Teams (Multi-Contributor)
5.  [**Maintenance**](docs/maintenance.md)
    -   Cleaning obsolete branches
    -   Documentation maintenance

## Quick Tools

### Clean Merged Branches
A script is provided to clean up local branches that have already been merged.

```bash
chmod +x scripts/clean-branches.sh
./scripts/clean-branches.sh
```
