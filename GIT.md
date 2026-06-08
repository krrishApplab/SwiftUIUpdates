# GIT.md

# SwiftUIUpdates Git Rules

Use this file only when the user explicitly asks to:

* Check git status
* Create a commit
* Create or switch branch
* Push changes
* Add remote
* Fix git configuration
* Review changed files

## General Git Rules

* Do not commit automatically unless explicitly requested.
* Do not push automatically.
* Always ask before pushing to remote.
* Review changed files before committing.
* Use meaningful commit messages.
* Avoid committing unrelated files.
* Do not delete or reset user changes without approval.
* Do not run destructive commands unless explicitly approved.

## Before Commit

Run:

```bash
git status
```

Review changed files.

If needed, inspect changes using:

```bash
git diff
```

## Commit Flow

When the user asks to commit:

```bash
git add .
git commit -m "<meaningful commit message>"
```

After commit, show:

```bash
git status
git log --oneline -1
```

## Push Rule

Do not push automatically.

Ask before running:

```bash
git push
```

## Remote Check

To check remotes:

```bash
git remote -v
```

If no remote exists, ask the user for the GitHub repository URL before adding one.

## Branch Commands

Check current branch:

```bash
git branch --show-current
```

Create and switch to a new branch:

```bash
git checkout -b <branch-name>
```

Switch branch:

```bash
git checkout <branch-name>
```

## Commit Summary

After committing, mention:

* Commit hash
* Commit message
* Files changed summary
* Whether working tree is clean
* Whether push is pending
