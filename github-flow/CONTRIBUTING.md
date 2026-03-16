# Contributing Guidelines

Welcome to the team! This document defines the Git workflow standards every developer must follow. These rules are enforced **locally via Git hooks** and **remotely via GitHub Actions** — so please read carefully and complete the one-time setup below.

---

## 📦 One-Time Setup

After cloning the repository, run the following **single command** from your project root to install the Git hooks:

```bash
curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/install.sh | bash
```

This clones the central hooks repository into `.githooks/` inside your project and configures Git to use it automatically. No manual file copying required.

**To update your hooks** to the latest version at any time, just re-run the same command.

Alternatively, if you prefer not to use curl, you can run the local wrapper script instead:

```bash
./setup-hooks.sh
```

---

## 🌿 Branch Naming Convention

Every branch **must** follow one of these formats:

| Type | Format | Example |
|---|---|---|
| Feature | `feat/<ticketId>-<short-desc>` | `feat/ENG-123-add-oauth-login` |
| Bug fix | `bug/<ticketId>-<short-desc>` | `bug/ENG-456-fix-checkout-redirect` |
| Hotfix | `hotfix/<ticketId>-<short-desc>` | `hotfix/ENG-789-patch-payment-crash` |

### Rules

- **Prefix** must be `feat`, `bug`, or `hotfix` (lowercase)
- **Ticket ID** must be an uppercase Linear ticket ID followed by a number (e.g. `ENG-123`, `PROJ-456`)
- **Short description** must be lowercase and hyphen-separated — no spaces, no uppercase
- A hyphen separates the ticket ID from the description

### Protected Branches

The following branches are exempt from naming validation:

- `main` / `master`
- `develop`
- `integration`
- `dev`
- `staging`
- `qa`
- `release/*`
- Any branch starting with `merge` (e.g. `merge-release`, `merge-hotfix`)

### How to Create a Branch Correctly

```bash
# Feature
git checkout -b feat/ENG-123-add-oauth-login

# Bug fix
git checkout -b bug/PROJ-456-fix-checkout-redirect

# Hotfix
git checkout -b hotfix/ENG-789-patch-payment-crash
```

If you accidentally created a branch with the wrong name, rename it before pushing:

```bash
git branch -m feat/ENG-123-correct-name
```

---

## 📝 Commit Message Convention

Every commit message **must** include:

1. A **Linear ticket ID** (e.g. `ENG-123`)
2. The **`[skip ci]`** tag

### Format

```
<type>(<ticket-id>): <short description> [skip ci]
```

### Commit Types

| Type | When to use |
|---|---|
| `feat` | New feature or capability |
| `fix` | Bug fix |
| `hotfix` | Urgent production fix |
| `chore` | Maintenance, dependency updates, tooling |
| `docs` | Documentation changes only |
| `refactor` | Code restructuring without behaviour change |
| `test` | Adding or updating tests |
| `style` | Formatting, whitespace, linting (no logic changes) |
| `ci` | CI/CD configuration changes |

### Examples

```bash
# ✅ Good
feat(ENG-123): add OAuth login flow [skip ci]
fix(PROJ-456): resolve null pointer on checkout page [skip ci]
chore(ENG-789): bump lodash to 4.17.21 [skip ci]
docs(ENG-101): update README with local setup steps [skip ci]
refactor(PROJ-202): extract payment logic into service class [skip ci]

# ❌ Bad — missing ticket ID
feat: add login button [skip ci]

# ❌ Bad — missing [skip ci]
feat(ENG-123): add login button

# ❌ Bad — missing both
add login button
```

### Why `[skip ci]` on Every Commit?

CI (GitHub Actions) is triggered at the **pull request level**, not on individual commits. Including `[skip ci]` on commits prevents redundant CI runs on each push to a branch, saving build minutes and keeping feedback focused on PR reviews.

---

## 🔄 Git Workflow

### Standard Feature Flow

```
main
 └── develop
      └── feat/ENG-123-add-oauth-login   ← your branch
```

1. **Branch** off `develop` (or `main` for hotfixes)
2. **Commit** your changes following the commit message convention
3. **Push** your branch — the `pre-push` hook validates the branch name
4. **Open a Pull Request** into `develop`
5. GitHub Actions will validate branch name + all commit messages automatically
6. Get at least **1 approval** before merging
7. **Squash and merge** (preferred) or rebase — never merge commits directly into `develop`

### Hotfix Flow

```
main
 └── hotfix/ENG-789-patch-payment-crash
```

1. Branch directly off `main`
2. Fix the issue and commit with the correct format
3. Open a PR into **both** `main` and `develop`
4. After merging to `main`, tag a patch release

---

## ✅ Pull Request Checklist

Before requesting a review, make sure:

- [ ] Branch name follows the naming convention
- [ ] All commit messages include a Linear ticket ID and `[skip ci]`
- [ ] PR title references the Linear ticket ID
- [ ] Code is self-reviewed and tested locally
- [ ] No debug logs, commented-out code, or `console.log` left behind
- [ ] Relevant tests are added or updated
- [ ] CI checks are passing

---

## 🤖 Automated Enforcement

| Check | Where enforced |
|---|---|
| Branch naming | `pre-push` hook (local) + GitHub Actions (remote) |
| Commit message: ticket ID | `commit-msg` hook (local) + GitHub Actions (remote) |
| Commit message: `[skip ci]` | `commit-msg` hook (local) + GitHub Actions (remote) |

If a hook blocks your commit or push, read the error message — it will tell you exactly what's wrong and how to fix it.

---

## ❓ FAQ

**Q: My commit was rejected. What do I do?**
Read the error message printed by the hook. It will show which rule failed and give you a correct example.

**Q: How do I amend my last commit message?**
```bash
git commit --amend -m "feat(ENG-123): corrected message [skip ci]"
```

**Q: What if I need to skip the hook temporarily?**
Hooks should not be bypassed. If you have a genuine edge case, discuss it with the team lead before using `--no-verify`.

**Q: The CI check failed on GitHub but my hook passed locally. Why?**
Ensure your local hooks are up to date by re-running the install command:
```bash
curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/install.sh | bash
```
If the issue persists, check the GitHub Actions logs for the exact commit that failed.

---

*These guidelines are enforced automatically. When in doubt, ask your team lead.*
