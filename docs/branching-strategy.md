# Git Branching Strategy & Naming Conventions

## Branch Naming Conventions

Consistent naming helps in identifying the purpose of a branch at a glance and enables automation.

### Structure
`type/context-description`

### Types

| Type | Description | Example |
| :--- | :--- | :--- |
| **`feat/`** | New features | `feat/user-login` |
| **`fix/`** | Bug fixes. If linked to an issue, include the ID | `fix/123-login-error` |
| **`docs/`** | Documentation changes only | `docs/update-readme` |
| **`style/`** | Changes that do not affect the meaning of the code (white-space, formatting, etc) | - |
| **`refactor/`** | A code change that neither fixes a bug nor adds a feature | - |
| **`perf/`** | A code change that improves performance | - |
| **`test/`** | Adding missing tests or correcting existing tests | - |
| **`chore/`** | Changes to the build process or auxiliary tools and libraries | `chore/bump-deps` |
| **`release/`** | Preparation for a new release | `release/v2.1.0` |
| **`hotfix/`** | Critical fixes for production | `hotfix/v2.1.1` |

### Best Practice: Include Issue IDs
If you use Jira, Trello, or GitHub Issues to track bugs, include the ID in the branch name.
- `feat/JIRA-123-payment-gateway`
- `fix/GH-45-memory-leak`

## The Core Branch Structure

To maintain sanity, you need two permanent branches. Never commit directly to these; always use Pull Requests (PRs).

1.  **`main` (or `master`)**:
    -   Reflects exactly what is in production.
    -   Tagged with version numbers (e.g., `v1.0.0`).
    -   Only merge into this via Pull Requests (PRs) from `develop` or `hotfix/` branches.

2.  **`develop`**:
    -   The "integration" branch. All new features are merged here first.
    -   Contains the code for the *next* release (e.g., `v2.2.0`).

## Workflow Scenarios

### Scenario A: Building the next version (v2.2.0)
You want to add new features and remove obsolete documentation.

1.  **Create Branch:** Create a branch **from `develop`**.
    ```bash
    git checkout -b feat/new-dashboard develop
    ```
2.  **Work & Merge:** Work on these branches. When done, create a Pull Request to merge them back into **`develop`**.
3.  **Result:** `develop` now contains the new features for v2.2.0, but `main` stays safe at v2.1.0.

### Scenario B: Preparing the Release (v2.2.0)
When `develop` has enough features and you are ready to freeze the code:

1.  **Create Release Branch:** Create `release/v2.2.0` from `develop`.
2.  **Final Polish:** Bump version numbers, update changelogs, and do final testing on this branch. No new features allowed here.
3.  **Merge:**
    -   Merge `release/v2.2.0` into **`main`**.
    -   **Tag** `main` with `v2.2.0`.
    -   Merge `release/v2.2.0` back into **`develop`** (so `develop` knows about the version bump).

### Scenario C: Emergency Fix (The "Hotfix")
Users report a critical bug in `v2.1.0` (production). You cannot wait for v2.2.0.

1.  **Create Hotfix Branch:** Create `hotfix/v2.1.1` **from `main`** (specifically the `v2.1.0` tag).
2.  **Fix & Verify:** Fix the bug on this branch.
3.  **Merge:**
    -   Merge into **`main`** and tag as `v2.1.1`.
    -   Merge into **`develop`** (so the fix is included in the future v2.2.0).

### Best Practices
-   Keep branches short-lived.
-   Sync with the base branch frequently (`git pull origin develop`).
-   Squash commits before merging to keep history clean (optional but recommended).
