# ai-skills

Central repository of reusable engineering standards. Install Git hooks, GitHub Actions workflows, PR templates, and RCA templates into any project with a single curl command.

---

## Installation

### Full setup (recommended)

Installs Git hooks, GitHub Actions workflows, and the PR template in one command:

```bash
curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/github/install.sh | bash
```

### Install individually

**Git hooks** (enforces commit message format and branch naming locally):
```bash
curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/github/githooks.sh | bash
```

**GitHub Actions workflows** (enforces commit messages and branch naming on push/PR):
```bash
curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/github/setup-workflows.sh | bash
```

**PR template** (structured pull request template, AI-agent ready):
```bash
curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/github/setup-pr-template.sh | bash
```

**RCA template** (blameless postmortem template, saved to `templates/`):
```bash
curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/rca/install.sh | bash
```

---

## What gets installed

| Script | Installs to | Purpose |
|--------|-------------|---------|
| `install.sh` | — | Runs all 3 GitHub scripts |
| `githooks.sh` | `.githooks/` | Git hooks: commit-msg, pre-push |
| `setup-workflows.sh` | `.github/workflows/` | branch-validation.yml, commit-validation.yml |
| `setup-pr-template.sh` | `.github/` | pull_request_template.md |
| `setup-rca.sh` | `templates/` | RCA_Template.md |

---

## Conventions enforced

### Branch naming
```
feat/<TICKET-ID>-<short-desc>    →  feat/ENG-123-add-oauth-login
bug/<TICKET-ID>-<short-desc>     →  bug/ENG-456-fix-checkout-redirect
hotfix/<TICKET-ID>-<short-desc>  →  hotfix/ENG-789-patch-payment-crash
```

### Commit messages
```
<type>(<ticket-id>): <description> [skip ci]
```

Examples:
```
feat(ENG-123): add OAuth login flow [skip ci]
fix(PROJ-456): resolve null pointer on checkout [skip ci]
chore(ENG-789): bump lodash to 4.17.21 [skip ci]
```

---

## Updating

Re-run any install command to pull the latest version. All scripts are idempotent.

---

## Developer onboarding

See [setup/github/CONTRIBUTING.md](setup/github/CONTRIBUTING.md) for the full Git workflow guide including branch naming rules, commit message format, and PR checklist. Copy this file to your project repo for team onboarding.
