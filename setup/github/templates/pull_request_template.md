<!--
  ╔══════════════════════════════════════════════════════════════════╗
  ║              GITHUB PULL REQUEST TEMPLATE                        ║
  ║         AI-Agent Ready · Globally Applicable                     ║
  ╚══════════════════════════════════════════════════════════════════╝

  INSTRUCTIONS FOR AI AGENTS:
  - Fill in every section marked with <!-- AI: FILL --> comments
  - Leave checklist items as-is; check only those that apply
  - Do NOT remove any section headers or structural comments
  - Use plain English; be concise but complete
  - Replace all placeholder text (shown in [brackets])
-->

## 📋 PR Metadata
<!-- AI: FILL — Provide structured metadata for quick triage -->

| Field            | Value                                      |
|------------------|--------------------------------------------|
| **Title**        | [Short, imperative summary — max 72 chars] |
| **Type**         | [See "PR Type" section below]              |
| **Scope**        | [Module / service / component affected]    |
| **Priority**     | [ ] 🔴 Critical  [ ] 🟠 High  [ ] 🟡 Medium  [ ] 🟢 Low |
| **Linked Issue** | Closes #[issue-number] / Relates to #[issue-number] |
| **Author**       | @[github-username]                         |
| **Reviewers**    | @[reviewer1], @[reviewer2]                 |
| **Milestone**    | [milestone-name or N/A]                    |
| **Labels**       | [e.g. bug, enhancement, breaking-change]   |

---

## 🏷️ PR Type
<!-- AI: FILL — Check all that apply -->

- [ ] ✨ `feat` — New feature
- [ ] 🐛 `fix` — Bug fix
- [ ] ♻️ `refactor` — Code refactor (no feature/bug change)
- [ ] 🚑 `hotfix` — Critical production fix
- [ ] 🧪 `test` — Adding or updating tests
- [ ] 📦 `build` — Build system or dependency changes
- [ ] 🔧 `config` — Configuration changes
- [ ] 📝 `docs` — Documentation only
- [ ] ⚡ `perf` — Performance improvement
- [ ] 💄 `style` — Code style / formatting (no logic change)
- [ ] 🔒 `security` — Security fix or improvement
- [ ] 🗑️ `chore` — Maintenance / cleanup

---

## 📝 Summary
<!-- AI: FILL — 2–4 sentences describing WHAT this PR does and WHY -->

[Describe the change clearly. Explain the problem being solved or feature being added. Include any important design decisions made.]

---

## 🔍 Background & Motivation
<!-- AI: FILL — Why is this change needed? Link to context (issue, Slack, spec, etc.) -->

[Describe the root cause, user pain point, or business need driving this change. Include relevant context that reviewers need to evaluate the approach.]

**Related Resources:**
- Issue: #[number]
- Design Doc / RFC: [link or N/A]
- Slack Thread / Discussion: [link or N/A]
- External Reference: [link or N/A]

---

## 🔄 What Changed
<!-- AI: FILL — Summarize key changes by file/component. Use bullet points. -->

- **[File or Component]:** [What changed and why]
- **[File or Component]:** [What changed and why]
- **[File or Component]:** [What changed and why]

> Add or remove lines as needed. Be specific — e.g. "Refactored `getUserById()` to use a single DB query instead of N+1."

---

## 💥 Breaking Changes
<!-- AI: FILL — List any breaking changes. If none, write "None." -->

- [ ] This PR introduces breaking changes

**Details:** [Describe what breaks and the migration path, or write "None."]

---

## 🧪 Testing
<!-- AI: FILL — Describe how this was tested -->

### Test Coverage
- [ ] Unit tests added / updated
- [ ] Integration tests added / updated
- [ ] End-to-end tests added / updated
- [ ] Manual testing performed
- [ ] No tests required (explain below)

### Test Instructions
<!-- AI: FILL — Step-by-step instructions for reviewers to verify the change -->

1. [Step 1]
2. [Step 2]
3. [Expected result]

### Test Environments Verified
- [ ] Local / Dev
- [ ] Staging / QA
- [ ] Production (hotfix only)

---

## 📸 Screenshots / Recordings
<!-- AI: FILL — Attach screenshots or screen recordings for UI changes. Write "N/A" if not applicable. -->

| Before | After |
|--------|-------|
| [screenshot or N/A] | [screenshot or N/A] |

---

## ⚙️ Configuration & Environment Changes
<!-- AI: FILL — List any env vars, config keys, feature flags, or infrastructure changes -->

- [ ] New environment variables added
- [ ] Existing environment variables changed
- [ ] Feature flags added / modified
- [ ] Database migrations included
- [ ] Infrastructure / deployment changes

**Details:** [List changes or write "None."]

---

## 🔐 Security Considerations
<!-- AI: FILL — Call out any security implications. Write "None identified." if not applicable. -->

- [ ] This PR touches authentication / authorization logic
- [ ] This PR handles sensitive data (PII, credentials, tokens)
- [ ] This PR changes API surface (new endpoints, params, responses)
- [ ] Security review requested

**Notes:** [Describe security implications or write "None identified."]

---

## 📊 Performance Impact
<!-- AI: FILL — Describe any performance implications. Write "None expected." if not applicable. -->

- [ ] This PR may impact performance
- [ ] Benchmarks / profiling results attached

**Notes:** [Describe impact or write "None expected."]

---

## 🚀 Deployment Notes
<!-- AI: FILL — Any special steps needed during or after deployment -->

- [ ] Requires database migration before deploy
- [ ] Requires feature flag enabled before deploy
- [ ] Requires cache flush / invalidation after deploy
- [ ] Requires coordinated release with another PR/service
- [ ] Safe to deploy independently

**Rollback Plan:** [Describe how to roll back if issues arise, or write "Standard revert."]

---

## ✅ Author Checklist
<!-- AI: FILL — Check all completed items before submitting -->

- [ ] Code follows the project's style and contribution guidelines
- [ ] Self-review of code completed
- [ ] Inline comments added for complex logic
- [ ] All tests pass locally (`npm test` / `pytest` / etc.)
- [ ] No new linting warnings or errors introduced
- [ ] Documentation updated (README, API docs, changelogs, etc.)
- [ ] Dependent PRs are listed or merged
- [ ] PR title follows [Conventional Commits](https://www.conventionalcommits.org/) format

---

## 🤖 AI Agent Notes
<!--
  This section is for AI agents that created or assisted with this PR.
  Human reviewers may use this for additional context.
-->

- **Generated by:** [AI agent name / tool, or "Human"]
- **Confidence:** [ ] High  [ ] Medium  [ ] Low
- **Areas needing human review:** [List specific areas, or "Full review recommended"]
- **Known limitations / assumptions:** [List or write "None"]

---

## 💬 Additional Notes for Reviewers
<!-- AI: FILL — Anything else reviewers should know. Write "None." if not applicable. -->

[Add any context, open questions, or areas where you'd like focused feedback.]

---

<!--
  ─────────────────────────────────────────────────
  Template version: 1.0.0
  Maintained by: [your-org]
  Place this file at: .github/pull_request_template.md
  ─────────────────────────────────────────────────
-->
