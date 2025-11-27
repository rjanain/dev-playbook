# Versioning & Release Management

## Semantic Versioning (SemVer)

Follow the [SemVer](https://semver.org/) standard: `MAJOR.MINOR.PATCH` (e.g., `2.1.0`).

| Version Part | When to increment | Example Change |
| :--- | :--- | :--- |
| **Major (2.x.x)** | Breaking changes (incompatible API changes). | Rewriting the authentication system entirely. |
| **Minor (x.1.x)** | New features (backwards-compatible). | Adding a "Dark Mode" or a new report type. |
| **Patch (x.x.0)** | Bug fixes only (backwards-compatible). | Fixing a typo or a crash in the login button. |

### Example Scenario
Current Version: `v2.1.0`

1.  **Bug Fix**: You fix a critical bug in the login flow.
    -   New Version: `v2.1.1` (Increment Patch).
2.  **New Feature**: You add a "Forgot Password" feature.
    -   New Version: `v2.2.0` (Increment Minor).
3.  **Breaking Change**: You completely rewrite the API authentication.
    -   New Version: `v3.0.0` (Increment Major).

## Release Process

### 1. Prepare the Release
-   Ensure all tests pass.
-   Update `CHANGELOG.md` with changes since the last release.
-   Bump the version number in your package manifest (e.g., `package.json`, `pyproject.toml`).

### 2. Create a Tag
Tags mark specific points in history as important.

```bash
# Create an annotated tag (recommended)
git tag -a v2.1.1 -m "Release version 2.1.1: Fix login bug"

# Push the tag to remote
git push origin v2.1.1
```

### 3. GitHub Releases
-   Go to the repository on GitHub > **Releases** > **Draft a new release**.
-   Choose the tag you just pushed (`v2.1.1`).
-   Title the release (e.g., "v2.1.1 - Login Fixes").
-   Paste the changelog notes into the description.
-   Publish.

## Managing Obsolete Documentation
-   **Review**: Before every minor or major release, review `docs/` for outdated info.
-   **Deprecation**: Mark features as deprecated in the documentation *before* removing them in the next major version.
-   **Pruning**: Remove documentation files for features that no longer exist.
