# Root Cause Analysis (RCA) Template

> 🔵 **Blameless Postmortem** — The goal of this document is to understand what happened and prevent recurrence, not to assign blame. (Google SRE / ITIL standard)

---

## 📋 Basic Information

| Field | Details |
|-------|---------|
| **Incident ID** | {{INCIDENT_ID}} |
| **Module** | {{MODULE}} |
| **RCA Contributors** | {{CONTRIBUTORS}} |
| **Linear Feature Number** | {{LINEAR_NUMBER}} |
| **Date of Incident** | {{DATE_OF_INCIDENT}} |
| **Date of RCA** | {{DATE_OF_RCA}} |
| **Detection Method** | {{DETECTION_METHOD}} |

<!-- AI: DETECTION_METHOD options: "Monitoring alert", "Customer report", "Manual discovery", or other -->

---

## 📊 Impact Assessment

**Severity Level:** {{SEVERITY_LEVEL}}

<!-- AI: SEVERITY_LEVEL must be exactly one of: "🔴 Critical", "🟠 High", "🟡 Medium", "🟢 Low" -->

| Severity | Description |
|----------|-------------|
| 🔴 Critical | System down / major functionality broken |
| 🟠 High | Significant feature impairment |
| 🟡 Medium | Minor functionality issues |
| 🟢 Low | Cosmetic or edge case issues |

**Incident Metrics:**

| Metric | Value |
|--------|-------|
| **MTTD** (Mean Time to Detect) | {{MTTD}} |
| **MTTA** (Mean Time to Acknowledge) | {{MTTA}} |
| **MTTR** (Mean Time to Resolve) | {{MTTR}} |
| **Total Impact Duration** | {{IMPACT_DURATION}} |
| **Users / Customers Affected** | {{USERS_AFFECTED}} |

**Customer & Business Impact:**

{{CUSTOMER_BUSINESS_IMPACT}}

<!-- AI: Describe how this bug affected customers and business operations -->

---

## 🕐 Timeline of Events

| Time (UTC) | Event |
|------------|-------|
| {{TIME_OCCURRED}} | Issue first occurred |
| {{TIME_DETECTED}} | Issue detected |
| {{TIME_ACKNOWLEDGED}} | Team acknowledged |
| {{TIME_INVESTIGATION}} | Investigation started |
| {{TIME_ROOT_CAUSE}} | Root cause identified |
| {{TIME_FIX_DEPLOYED}} | Fix deployed |
| {{TIME_RESOLVED}} | Incident resolved |
| {{TIME_CUSTOMERS_NOTIFIED}} | Customers notified |

---

## 🔍 Incident Details

**Incident Description:**

{{INCIDENT_DESCRIPTION}}

<!-- AI: Describe what happened, when it was discovered, and initial symptoms -->

**What Went Wrong:**

{{WHAT_WENT_WRONG}}

<!-- AI: Technical explanation of the failure, error conditions, and system behavior -->

**Contributing Factors:**

{{CONTRIBUTING_FACTORS}}

<!-- AI: List factors that contributed to the incident but were not the direct root cause (e.g., lack of monitoring, technical debt, unclear ownership) -->

---

## 🎯 Root Cause Analysis

### 5 Whys Analysis

| # | Question | Answer |
|---|----------|--------|
| 1 | Why did the incident occur? | {{WHY_1}} |
| 2 | Why did that happen? | {{WHY_2}} |
| 3 | Why did that happen? | {{WHY_3}} |
| 4 | Why did that happen? | {{WHY_4}} |
| 5 | Why did that happen? | {{WHY_5}} |

---

### Product Root Cause

**Category:** {{PRODUCT_ROOT_CAUSE_CATEGORY}}

**Details:**

{{PRODUCT_ROOT_CAUSE_DETAILS}}

---

### Development Root Cause

**Category:** {{DEV_ROOT_CAUSE_CATEGORY}}

**Details:**

{{DEV_ROOT_CAUSE_DETAILS}}

---

### Testing Root Cause

**Category:** {{TEST_ROOT_CAUSE_CATEGORY}}

**Details:**

{{TEST_ROOT_CAUSE_DETAILS}}

---

## 🔧 Process Analysis

**What First Process Could Have Caught the Defect?**

<!-- AI: Mark exactly one item below with [x] and leave the rest as [ ] -->

- [ ] Requirements Review
- [ ] Design Review
- [ ] Code Review
- [ ] Unit Testing
- [ ] Integration Testing
- [ ] System Testing
- [ ] User Acceptance Testing
- [ ] Documentation Review
- [ ] Configuration Management

**Process Analysis Details:**

{{PROCESS_ANALYSIS_DETAILS}}

<!-- AI: Explain which process could have prevented this and why -->

---

## ⚡ Action Items

| Type | Description | Assignee | Due Date | Status |
|------|-------------|----------|----------|--------|
| 🛠️ Immediate Fix | {{IMMEDIATE_FIX}} | {{ASSIGNEE_1}} | {{DUE_DATE_1}} | {{STATUS_1}} |
| 🛡️ Preventive Action | {{PREVENTIVE_ACTION}} | {{ASSIGNEE_2}} | {{DUE_DATE_2}} | {{STATUS_2}} |
| 🔄 Process Improvement | {{PROCESS_IMPROVEMENT}} | {{ASSIGNEE_3}} | {{DUE_DATE_3}} | {{STATUS_3}} |
| ✔️ Verification / Monitoring | {{VERIFICATION_PLAN}} | {{ASSIGNEE_4}} | {{DUE_DATE_4}} | {{STATUS_4}} |

<!-- AI: STATUS options: "Not Started", "In Progress", "Done" -->

---

## 💡 Lessons Learned

**What went well?**

{{LESSONS_WENT_WELL}}

<!-- AI: Actions or processes that helped contain or resolve the incident faster -->

**What could be improved?**

{{LESSONS_TO_IMPROVE}}

<!-- AI: Gaps in tooling, process, communication, or detection that should be addressed -->

**Key Takeaways:**

{{KEY_TAKEAWAYS}}

<!-- AI: 2–3 concise bullet points summarizing the most important learnings -->

---

## ✅ Approval & Sign-off

| Role | Name | Date |
|------|------|------|
| **Reviewed By** | {{REVIEWER}} | {{REVIEW_DATE}} |
| **Approved By** | {{APPROVER}} | {{APPROVAL_DATE}} |

**Additional Notes:**

{{ADDITIONAL_NOTES}}
