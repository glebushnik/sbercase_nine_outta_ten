# Technical Writer / Enablement Lead Responsibilities for AI Copilot Platform for Langflow

**Version:** 1.0  
**Status:** Final draft  
**Document owner:** Technical Writer / Enablement Lead  
**Last updated:** 2026-04-23

---

## 1. Executive Summary

### 1.1 Product Overview
The AI Copilot platform lets business users describe tasks in natural language and receive validated, executable workflows on top of Langflow. Its promise of **self-serve** (PRD §2) only holds if users can learn the system without a developer. That learning path is owned by this role.

As a **Technical Writer / Enablement Lead**, you design and maintain the documentation, task examples, onboarding guides, and best-practice content that let business users, power users, and admins succeed without engineering help.

### 1.2 Why this role matters in PRD
PRD §25.2 defines Technical Writer / Enablement Lead responsibilities as:
- user education,
- task examples,
- onboarding guides,
- internal documentation,
- best practices.

Your content directly supports PRD §2 (self-serve), §11 (UX strategy: explainability, progressive disclosure), §12 (guiding users through every journey path), and §22.1 (self-serve completion rate).

---

## 2. Key Responsibilities

### 2.1 User Onboarding Content
You create the onboarding material that business users see on day one:
- Task-first tutorials aligned with the "Happy path" (PRD §12.1).
- Example task phrasings for each supported use case (§10.1–§10.5).
- Contextual help embedded in the guided wizard (in cooperation with UX Designer).

#### Deliverables
- First-run onboarding content.
- Task-phrasing gallery per use case.
- In-product help strings and tooltips.

### 2.2 Task Examples and Phrasing Library
Vague requests (PRD §12.2) are a core failure mode. You reduce them by providing:
- A **library of high-quality example tasks** that business users can copy and adapt.
- Before/after examples showing how to sharpen a vague request into a well-specified one.
- Anti-patterns: phrasings that the platform cannot support (and why).

#### Deliverables
- Task-phrasing library with copy-paste examples.
- "How to write a good task" quickstart.
- Anti-pattern catalog.

### 2.3 Explainability and Trust Content
Users must understand what the platform is telling them (PRD §11.3, §18). You write:
- Plain-language explanations of **confidence scores** and what thresholds mean for action.
- Explanations of **evidence** (why a finding is trustworthy) aligned with PRD §18.4.
- Guidance for low-confidence outcomes (PRD §12.6 and §18.5) — what to do, when to ask for human review.

#### Deliverables
- Confidence and evidence explainer content.
- Low-confidence decision guide.
- "How to read a report" reference.

### 2.4 Edge-Case and Recovery Guidance
Users hit the non-happy paths (PRD §12.2–§12.7). You document how to recover:
- Missing data path guide.
- Credential setup guide (PRD §12.4).
- Policy rejection explanation — when the system refuses and what to do next (PRD §12.7, §19).
- Error and fallback messages (coordinated with UX Designer).

#### Deliverables
- Recovery guide per edge-case journey.
- Policy rejection explainer.
- Error-message library (shared with UX).

### 2.5 Admin and Operator Documentation
The admin persona (PRD §5.4) and operator mode (PRD §11.2) also need documentation:
- Component registry and approval workflow guide.
- Custom component governance guide (aligned with PRD §13.11, §16.5).
- Audit, policy, and abuse-handling operational guide (PRD §19).

#### Deliverables
- Admin console documentation.
- Approval workflow and custom-component governance guide.
- Audit and abuse-event operational reference.

### 2.6 Internal Documentation and Handoff
You maintain documentation that internal teams rely on:
- **Runbooks** for Solutions Engineers onboarding new customers.
- **Design decision log** (why key architectural choices were made — PRD §26.6).
- Release notes and migration guides for component/template versioning (PRD §20.2).

#### Deliverables
- Internal runbook library.
- Living decision log.
- Release-note template and cadence.

### 2.7 Best Practices Program
As usage grows, you codify what works:
- Collect patterns from Solutions Engineers and Domain Experts.
- Turn repeated success patterns into canonical best-practice guides.
- Deprecate outdated guidance as the platform evolves.

#### Deliverables
- Best-practice guide per use case category.
- Quarterly content refresh.
- Deprecation notices for outdated content.

### 2.8 Cross-functional Collaboration
- **UX / Product Designer** — co-own in-product copy, tooltips, error messages.
- **Product Manager** — align content roadmap with feature roadmap and MVP scope.
- **Solutions Engineer** — raw material from field deployments for best-practice content.
- **Domain Expert** — validate domain phrasing and examples.
- **AI Architect** — document agentic-layer limitations so users know what the system will and won't do (PRD §17).
- **Security / Privacy Engineer** — document policy rejections and abuse-handling accurately (PRD §19).

---

## 3. Detailed Tasks and Deliverables

### 3.1 Onboarding Content
- First-run tutorials.
- In-product help strings and tooltips.

### 3.2 Task Examples
- Phrasing library per use case.
- "How to write a good task" quickstart.
- Anti-pattern catalog.

### 3.3 Trust Content
- Confidence and evidence explainers.
- Low-confidence decision guide.

### 3.4 Recovery Guidance
- Edge-case recovery guides.
- Error-message library.

### 3.5 Admin Docs
- Admin console documentation.
- Custom-component governance and approval guides.

### 3.6 Internal Documentation
- Solutions-Engineer runbooks.
- Design decision log.
- Release notes and migration guides.

### 3.7 Best Practices
- Per-use-case best-practice guides.
- Quarterly refresh cycle.

---

## 4. Success Metrics

### 4.1 Self-Serve Support
- Self-serve completion rate (PRD §22.1) — content should drive this up.
- Drop-off by stage (PRD §22.2) — content should reduce drop-off at known friction points.

### 4.2 Onboarding Efficiency
- Time to first useful workflow (PRD §22.1).
- Credential setup completion rate (PRD §22.2).

### 4.3 Content Health
- Documentation coverage of each supported use case.
- Staleness rate (percentage of docs updated in last N months).
- Support ticket deflection attributable to documentation.

---

## 5. PRD Alignment

- **Workstream:** contributor across A (UX & User Research), D (Validation & Trust — trust content), E (Security & Governance — abuse/policy content).
- **Core PRD sections:** §2 (self-serve), §5 (personas), §10 (use cases), §11 (UX strategy), §12 (user journeys), §18 (trust), §19 (abuse), §22.1–§22.2 (metrics).
- **MVP scope:** onboarding content and task examples for the 2 MVP use cases (conversation analytics, recurring report) — PRD §23.1.

---

## 6. Human Resources and Responsibilities

You collaborate closely with:
- **UX / Product Designer** — in-product copy and tooltips.
- **Product Manager** — content roadmap alignment.
- **Solutions Engineer** — field material for best practices.
- **Domain Expert** — domain-accurate phrasing.
- **AI Architect** — documenting agentic-layer behavior and limitations.
- **Security / Privacy Engineer** — policy and abuse-handling documentation.
