# Data / Analytics Engineer Responsibilities for AI Copilot Platform for Langflow

**Version:** 1.0  
**Status:** Final draft  
**Document owner:** Data / Analytics Engineer  
**Last updated:** 2026-04-23

---

## 1. Executive Summary

### 1.1 Product Overview
The AI Copilot platform enables business users to generate, validate, and execute workflows from natural language tasks. Langflow serves as the execution runtime, while the control plane handles intent understanding, planning, validation, and governance.

As a **Data / Analytics Engineer**, you are responsible for everything that touches **data** in the execution plane: ingestion, connectors, profiling, transformations, quality, lineage, and reliability. Without you, the platform has no trustworthy inputs — which means no trustworthy outputs.

### 1.2 Why this role matters in PRD
PRD §25.1 defines Data / Analytics Engineer responsibilities as:
- data ingestion,
- connectors,
- profiling,
- transformations,
- data reliability.

You are the co-owner of **Workstream F — Templates / Components / Integrations** together with the Langflow Engineer (PRD §25.3), and a key contributor to data onboarding flows (§13.4) and the "missing data path" journey (§12.3).

---

## 2. Key Responsibilities

### 2.1 Data Source Onboarding and Connectors
You design and maintain the data ingestion layer that Langflow workflows and the control plane consume:
- Build and maintain **connectors** to internal and external data sources (dialog stores, ticketing systems, CRMs, knowledge bases, file uploads).
- Support the three onboarding paths from PRD §12.3: existing source, connect new source, upload file.
- Implement **safe-mode credential validation** (PRD §12.4) so data sources are verified before workflow execution.
- Own the contracts between connectors and downstream components: schema, pagination, rate limits, auth model, error taxonomy.

#### Deliverables
- Connector SDK and component templates (registered in the Capability Registry).
- Connector catalog with risk classification and approval status.
- Credential validation and preview tooling for the onboarding wizard.

### 2.2 Data Profiling and Source Validation
Before a workflow runs, the platform must know whether a source is usable. You own:
- **Source validation** — schema checks, freshness checks, volume checks (PRD §13.4).
- **Data preview** generation for the guided wizard.
- **Data profiling** — descriptive statistics, PII presence detection, distribution shifts, empty-field ratios.
- Feeding profiling results into the Validation Engine's **Data readiness validation** stage (PRD §18.3).

#### Deliverables
- Profiling service with reusable profilers per source type.
- Data readiness report schema consumed by Validation Engine.
- Preview component integrated into UX onboarding flow.

### 2.3 Transformations and Data Preparation
You provide the reusable, approved transformation components that workflows compose:
- Redaction / masking components (coordinated with Security Engineer; see PRD §21.1).
- Normalization, deduplication, filtering, windowing.
- Time-window selection components (for "last N days" semantics in task specs — see Appendix A).
- Aggregation primitives used by reporting layers.

All transformations must expose input/output contracts, be versioned, and live in the approved component registry.

#### Deliverables
- Approved transformation component library.
- Time-window and aggregation primitives.
- Test harness for transformations (see §20.2 compatibility checks).

### 2.4 Data Quality and Reliability
You ensure data reliability that supports the platform's trust framework:
- Define **data quality signals** that feed the Evaluator (evidence coverage, sample size, noise, conflicting sources) — PRD §12.6 and §18.
- Monitor connector freshness, failure rates, and schema drift.
- Provide **quality metadata** that the Evaluator uses to explain low-confidence outputs.

#### Deliverables
- Data quality signals exposed to the Evaluator.
- Connector health monitoring with SLOs.
- Drift detection and alerting on source schemas.

### 2.5 Data Governance and Lineage
You implement the data-side half of governance (PRD §21.2):
- **Source registration** — every source has an owner, classification, and policy tags.
- **Data classification** — PII / confidential / internal / public, driven by Security Engineer policy.
- **Execution lineage** — every workflow run records which sources, fields, and records contributed to the output (feeds the Evidence Model, PRD §18.4).
- **Retention rules** — coordinate with Security and DevOps on storage lifecycle.

#### Deliverables
- Source registry integrated with Capability Registry / Metadata Service.
- Lineage capture spec (what every connector/transformer must emit).
- Classification tags and policy-based access enforcement at the data layer.

### 2.6 Support for Recurring Workflows
Recurring jobs (PRD §12.8) depend on stable data pipelines. You ensure:
- Scheduled ingestion is idempotent and checkpointed.
- Incremental loads are supported where possible.
- Last-known-good recovery for scheduled jobs (PRD §14.2).

#### Deliverables
- Incremental/checkpointed ingestion patterns.
- Backfill and recovery runbooks for recurring jobs.

### 2.7 Cross-functional Collaboration
- **Langflow Engineer** — co-own Workstream F; agree on component contracts and compiler targets for data components.
- **Backend / Platform Engineer** — metadata services, versioning, storage.
- **AI Architect** — provide training data and profiling signals for planner / evaluator models.
- **Evaluation / Applied Scientist** — expose data quality signals feeding confidence and evidence.
- **Security / Privacy Engineer** — classification, redaction, retention, connector approvals.
- **Domain Expert** — validate that domain semantics (e.g., dialog schema, complaint categories) match real data.

---

## 3. Detailed Tasks and Deliverables

### 3.1 Connector Platform
- Define connector SDK and registration flow.
- Implement priority MVP connectors (per PRD Open Questions §27.1 and §27.6 — to be resolved with PM and Solutions Engineer).
- Provide credential validation and safe preview mode.

### 3.2 Profiling and Readiness
- Profiling service with per-source profilers.
- Readiness report schema feeding Validation Engine.
- Preview widget for guided onboarding UX.

### 3.3 Transformation Library
- Time-window, aggregation, filtering, deduplication, normalization primitives.
- Redaction/masking components (with Security).
- Versioning and deprecation policy per PRD §20.2.

### 3.4 Quality and Lineage
- Quality signals contract shared with Evaluator.
- Lineage capture in every connector and transformer.
- Health monitoring and drift detection.

### 3.5 Governance
- Source registry schema.
- Classification tags and enforcement.
- Retention lifecycle coordination.

---

## 4. Success Metrics

### 4.1 Data Reliability
- Connector failure rate (PRD §22.3).
- Schema drift incident rate.
- Source freshness SLO compliance.

### 4.2 Quality Contribution
- Evidence coverage rate (PRD §22.4) attributable to profiling/lineage.
- Data readiness validation pass rate.

### 4.3 Platform Velocity
- Time to add new source connector (PRD §22.5).
- Transformation component reuse rate.

---

## 5. PRD Alignment

- **Workstream:** F (Templates / Components / Integrations) — co-owner with Langflow Engineer.
- **Core PRD sections:** §12.3, §12.4, §12.8, §13.4, §14.2, §18.3 (data readiness), §18.4 (evidence), §20.2, §21.2, §22.3–§22.5.
- **MVP scope:** source onboarding for selected sources, data validation, preview — all inside §23.1 "MVP included".
- **Out of scope (MVP):** arbitrary external integrations, public connector marketplace (§23.2).

---

## 6. Human Resources and Responsibilities

You collaborate closely with:
- **Langflow Engineer** — co-owner of data component integration into Langflow flows.
- **Backend / Platform Engineer** — metadata, storage, versioning.
- **Security / Privacy Engineer** — classification, redaction, connector approval.
- **Evaluation / Applied Scientist** — data quality signals for confidence scoring.
- **Solutions Engineer** — field feedback on connectors and onboarding patterns.
- **Domain Expert** — domain schema validation.
