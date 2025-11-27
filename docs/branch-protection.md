# Branch Protection Rules

Protecting your `main` (and `develop`) branches ensures stability and code quality.

Go to **Settings** > **Branches** > **Add branch protection rule**.

## For Single Contributor (Speed + Safety)
*Goal: Prevent accidental mistakes, but keep velocity high.*

* [x] **Require pull requests before merging.**
* [ ] **Require approvals** (Set to 0).
* [x] **Require status checks to pass** (Enable if you have CI/Tests).
* [ ] **Include administrators** (Disabled - allows you to bypass in emergencies).

## For Multi-Contributor (Collaboration)
*Goal: Ensure code review, quality, and security.*

* [x] **Require pull requests before merging.**
* [x] **Require approvals** (Set to at least 1 reviewer).
* [x] **Dismiss stale pull request approvals on new pushes.**
* [x] **Require status checks to pass** (CI/Tests).
    * [x] **Require branches to be up to date before merging.**
* [x] **Require signed commits** (Verified GPG signatures).
* [x] **Do not allow bypassing the above settings.**

## General Best Practices
-   **Delete head branches**: Automatically delete head branches after pull requests are merged (Settings > General > Pull Requests).
-   **Force Push**: Disable force pushes on protected branches (`main`) to prevent history rewriting.
