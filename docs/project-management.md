# Project Management: Issues & Bugs

## Tracking Work
Use GitHub Issues to track all work. Do not start coding without an issue (or at least a clear task).

### Issue Types
-   **Bug Report**: Something is broken.
-   **Feature Request**: Proposal for new functionality.
-   **Task/Chore**: Maintenance work, refactoring, documentation.

## Issue Templates
Create `.github/ISSUE_TEMPLATE/` to standardize reporting.

### Standard Labels
-   `bug`: Something isn't working.
-   `enhancement`: New feature or request.
-   `documentation`: Improvements or additions to documentation.
-   `duplicate`: This issue or pull request already exists.
-   `good first issue`: Good for newcomers.
-   `help wanted`: Extra attention is needed.
-   `invalid`: This doesn't seem right.
-   `question`: Further information is requested.
-   `wontfix`: This will not be worked on.

## Lifecycle
1.  **Open**: Issue created.
2.  **Triage**: Maintainers review, label, and assign priority.
3.  **In Progress**: Developer assigns themselves and starts a branch.
4.  **Review**: PR is linked to the issue (use "Closes #123" in PR description).
5.  **Closed**: PR is merged, issue is automatically closed.

## Milestones
Group issues into **Milestones** corresponding to your release versions (e.g., `v2.1.1`, `v2.2.0`). This helps track progress toward a specific release goal.
