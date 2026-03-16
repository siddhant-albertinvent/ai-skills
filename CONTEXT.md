# ai-skills — Repository Context

## Purpose

A central repository of reusable developer tooling assets:
- **Git workflow enforcement** (hooks + CI workflows)
- **Document templates** (PR template, RCA template)

These files are copied or installed into other projects to enforce consistent engineering standards across the org.

---

## Repository Structure

```
ai-skills/
├── CONTEXT.md                          ← this file
├── pull_request_template.md            ← GitHub PR template (AI-agent ready)
├── RCA_Template.md                     ← Root cause analysis postmortem template
└── github-flow/
    ├── hooks-repo/
    │   └── install.sh                  ← Git hooks installer (curl-installable)
    ├── .githooks/
    │   ├── commit-msg                  ← Git hook: enforces commit message format
    │   └── pre-push                    ← Git hook: enforces branch naming convention
    └── .github/
        └── workflows/
            ├── branch-validation.yml   ← GitHub Actions: validates branch names on push/PR
            └── commit-validation.yml   ← GitHub Actions: validates commit messages on push/PR
```

---

## File Details

### Templates

| File | Purpose |
|------|---------|
| `pull_request_template.md` | Structured PR template with AI-agent instructions. Place at `.github/pull_request_template.md` in target repos. |
| `RCA_Template.md` | Blameless postmortem template using `{{PLACEHOLDER}}` syntax. Fill with incident details. |

### Git Hooks (`github-flow/.githooks/`)

| File | Trigger | Enforces |
|------|---------|----------|
| `commit-msg` | Every commit | Linear ticket ID (e.g. `ENG-123`) + `[skip ci]` present in message. Skips merge/revert commits. |
| `pre-push` | Every push | Branch name matches `(feat\|bug\|hotfix)/<TICKET-ID>-<short-desc>`. Protected branches are exempt. |

### Install Script (`github-flow/hooks-repo/`)

| File | Usage |
|------|-------|
| `install.sh` | Served via `curl`. Clones this repo into `.githooks/` in the target project and sets `core.hooksPath`. Re-running it pulls latest hooks. |

**One-liner install for any project:**
```bash
curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/install.sh | bash
```

### GitHub Actions Workflows (`github-flow/.github/workflows/`)

| File | Trigger | What it checks |
|------|---------|----------------|
| `branch-validation.yml` | Push or PR (non-protected branches) | Branch name follows `(feat\|bug\|hotfix)/<TICKET-ID>-<desc>` pattern |
| `commit-validation.yml` | Push or PR | All commits in the push/PR contain a Linear ticket ID and `[skip ci]` |

---

## Conventions Enforced

### Branch Naming
```
feat/<TICKET-ID>-<short-desc>    e.g. feat/ENG-123-add-oauth-login
bug/<TICKET-ID>-<short-desc>     e.g. bug/ENG-456-fix-checkout-redirect
hotfix/<TICKET-ID>-<short-desc>  e.g. hotfix/ENG-789-patch-payment-crash
```
Protected (exempt): `main`, `master`, `develop`, `integration`, `dev`, `staging`, `qa`, `release/*`, `merge*`

### Commit Messages
```
<type>(<ticket-id>): <short description> [skip ci]
```
- **type**: `feat`, `fix`, `hotfix`, `chore`, `docs`, `refactor`, `test`, `style`, `ci`
- **ticket-id**: Linear ticket ID, e.g. `ENG-123`
- **[skip ci]**: Required on all commits — CI runs at PR level, not per-commit

Skipped automatically: merge commits (`Merge branch ...`), revert commits (`Revert "..."`)
