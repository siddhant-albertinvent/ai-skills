# CLAUDE.md — ai-skills

## What this repo is

A central tooling library. Other projects install assets from here via curl one-liners. Nothing in this repo runs as a service — it is source-of-truth for scripts, templates, and workflows distributed to other repos.

## Repo layout

```
setup/
  github/
    install.sh              ← runs all 3 GitHub scripts
    githooks.sh             ← installs Git hooks
    setup-workflows.sh      ← installs GitHub Actions workflows
    setup-pr-template.sh    ← installs PR template
    CONTRIBUTING.md         ← developer onboarding doc (copy to target repos)
    templates/
      pull_request_template.md
    workflows/
      branch-validation.yml
      commit-validation.yml
  rca/
    install.sh            ← installs RCA template
    RCA_Template.md
specs/                      ← design/spec documents
```

## Script conventions

- All scripts are **curl-installable** — they must work when piped through `bash` with no local files available.
- Scripts download assets from `https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/...`
- All scripts are **idempotent** — safe to re-run; they update/overwrite existing files.
- All scripts **require a Git repo** context (`git rev-parse --git-dir`) and exit with an error if not found.
- Follow the colour scheme used in existing scripts: `CYAN` for info, `GREEN` for success, `YELLOW` for warnings, `RED` for errors.
- Print a banner at the start and a summary box at the end.

## Naming conventions

| Script | Purpose |
|--------|---------|
| `githooks.sh` | Clones this repo into `.githooks/`, sets `core.hooksPath` |
| `setup-*.sh` | Downloads/copies specific asset types |
| `setup-all.sh` | Orchestrates other scripts via `bash <(curl ...)` |

## What NOT to do

- Do not add logic to scripts that belongs in the target project (e.g., project-specific env vars).
- Do not hardcode project names — scripts must be generic and reusable.
- Do not skip the Git repo guard at the top of each script.
- Do not modify `CONTRIBUTING.md` — it is the canonical developer onboarding doc distributed to other repos.

## Conventions enforced (for reference)

### Branch naming
```
feat/<TICKET-ID>-<short-desc>    e.g. feat/ENG-123-add-oauth
bug/<TICKET-ID>-<short-desc>     e.g. bug/ENG-456-fix-redirect
hotfix/<TICKET-ID>-<short-desc>  e.g. hotfix/ENG-789-patch-crash
```

### Commit messages
```
<type>(<ticket-id>): <description> [skip ci]
```
Types: `feat`, `fix`, `hotfix`, `chore`, `docs`, `refactor`, `test`, `style`, `ci`
