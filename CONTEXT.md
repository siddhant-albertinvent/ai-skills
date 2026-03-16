# ai-skills — Repository Context

## Purpose

A central repository of reusable developer tooling assets:
- **Git workflow enforcement** (hooks installer + CI workflows)
- **Document templates** (PR template, RCA template, CONTRIBUTING guide)
- **Specs** (specifications and design documents)

Files are copied or installed into other projects to enforce consistent engineering standards across the org.

---

## Repository Structure

```
ai-skills/
├── CONTEXT.md                              ← this file
├── CLAUDE.md                               ← Claude Code instructions for this repo
├── LICENSE
├── README.md
├── setup/
│   ├── github/
│   │   ├── install.sh                      ← Runs all 3 GitHub setup scripts in one command
│   │   ├── CONTRIBUTING.md                 ← Developer onboarding guide (Git workflow standards)
│   │   ├── githooks.sh                     ← Installs Git hooks only (clones repo → .githooks/)
│   │   ├── setup-workflows.sh              ← Installs GitHub Actions workflows only
│   │   ├── setup-pr-template.sh            ← Installs GitHub PR template only
│   │   ├── templates/
│   │   │   └── pull_request_template.md    ← GitHub PR template (AI-agent ready)
│   │   └── workflows/
│   │       ├── branch-validation.yml       ← GitHub Actions: validates branch names on push/PR
│   │       └── commit-validation.yml       ← GitHub Actions: validates commit messages on push/PR
│   └── rca/
│       ├── RCA_Template.md                 ← Root cause analysis postmortem template
│       └── install.sh                    ← Downloads RCA template to templates/ in target project
└── specs/                                  ← Specification documents (currently empty)
```

---

## File Details

### Setup Scripts

Each script is independently curl-installable and idempotent (safe to re-run for updates).

| Script | What it installs | Target location in project |
|--------|-----------------|---------------------------|
| `setup/github/install.sh` | Runs all 3 GitHub scripts below | — |
| `setup/github/githooks.sh` | Git hooks (clones this repo → `.githooks/`) | `.githooks/` + `core.hooksPath` |
| `setup/github/setup-workflows.sh` | GitHub Actions workflow files | `.github/workflows/` |
| `setup/github/setup-pr-template.sh` | GitHub PR template | `.github/pull_request_template.md` |
| `setup/rca/install.sh` | RCA postmortem template | `templates/RCA_Template.md` |

**Install everything (recommended):**
```bash
curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/github/install.sh | bash
```

**Install individually:**
```bash
# Git hooks only
curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/github/githooks.sh | bash

# GitHub Actions workflows only
curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/github/setup-workflows.sh | bash

# PR template only
curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/github/setup-pr-template.sh | bash

# RCA template only
curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/rca/install.sh | bash
```

### Templates & Assets

| File | Purpose |
|------|---------|
| `setup/github/templates/pull_request_template.md` | Structured PR template with AI-agent instructions. Installed to `.github/pull_request_template.md`. |
| `setup/rca/RCA_Template.md` | Blameless postmortem template using `{{PLACEHOLDER}}` syntax. Installed to `templates/RCA_Template.md`. |
| `setup/github/CONTRIBUTING.md` | Full developer onboarding guide covering branch naming, commit conventions, Git workflow, and FAQ. Copy to target repos. |

### GitHub Actions Workflows (`setup/github/workflows/`)

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
