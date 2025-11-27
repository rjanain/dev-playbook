#!/bin/bash
# Description: Deletes local branches that have been merged into the current branch.
# Usage: ./scripts/clean-branches.sh

# Ensure we are in a git repo
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: Not a git repository."
    exit 1
fi

echo "Fetching prune to clean remote references..."
git fetch -p

echo "Deleting merged local branches (preserving main, master, and develop)..."

# Check OS for correct syntax
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    # PowerShell/Windows logic (Manual run recommended for Powershell users)
    echo "Please run this command in PowerShell:"
    echo "git branch --merged | Where-Object { \$_ -notmatch 'main|master|develop|\*' } | ForEach-Object { git branch -d \$_.Trim() }"
else
    # Linux/Mac logic
    git branch --merged | grep -v "\*" | grep -v "main" | grep -v "master" | grep -v "develop" | xargs -n 1 git branch -d
fi

echo "Cleanup complete."
