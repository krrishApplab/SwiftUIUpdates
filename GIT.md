# GIT.md

# SwiftUIUpdates Git Rules

Use this file only when the user explicitly asks for git-related work.

## Rules

* Do not commit directly inside Kiro.
* Commit is handled by the post-task terminal hook.
* Do not push automatically.
* Always ask before pushing.
* Do not run destructive git commands without approval.
* Avoid committing unrelated files.

## Before Commit

The post-task hook should show:

```bash
git status
```

The user should manually type the commit message in Terminal.

## Commit Flow

The post-task hook will run:

```bash
git add .
git commit -m "<user typed commit message>"
```

After commit, show:

```bash
git log --oneline -1
git status
```

## Push Rule

Do not push automatically.

Ask before running:

```bash
git push
```
