---
name: product-requirement-guidelines
description: The methodology for specifying a product requirement, feature spec, or Jira ticket description. Covers framing the problem/outcome before the solution, separating "what" from "how", explicit non-goals and assumptions, right-sizing scope to the change, testable acceptance criteria, and — for view-affected or architecturally broad changes — framing a spec's UI design and system-design/architecture sections.
when_to_use: Apply when writing, refining, or reviewing a product requirement, feature spec, or ticket description, including any plan-writing or ticket-drafting step of a delivery workflow. Use for "write a PRD", "refine this ticket", "write acceptance criteria", "what's the scope of this change", "is this requirement testable", or "does this need a UI design / architecture section".
user-invocable: false
---

# Product Requirement Guidelines

Apply this skill whenever drafting or reviewing the parts of a product requirement, feature spec, or Jira ticket description that describe **what** is needed and **how completion is verified** — not how it is built. It is general-purpose: any product requirement, feature specification, or ticket description benefits from it, not only a delivery workflow's plan-writing step.

This skill deliberately does not own everything a spec contains. It owns problem framing, scope boundaries, acceptance-criteria craft, and — when those sections are warranted — the spec-level framing of the UI design and system-design/architecture sections. It does not own the implementation mechanics behind them:

- UI component structure, CSS, and markup mechanics — [UI Design Guidelines](/Users/axross/Repositories/frontline-worker-client/.agents/skills/ui-design-guidelines/SKILL.md) (design vocabulary: color, accessibility, states, wording) and [React Component Guidelines](/Users/axross/Repositories/frontline-worker-client/.agents/skills/react-component-guidelines/SKILL.md) (component mechanics: styling, testIDs, conventions). This skill owns only how to *describe* hierarchy, states, accessibility, and responsive intent in the spec (see below).
- Actual data flow implementation, routes, and module placement — [Project Structure](/Users/axross/Repositories/frontline-worker-client/.agents/skills/project-structure/SKILL.md). This skill owns only how to *describe* system-design decisions in the spec (see below).
- Test coverage strategy — [Quality Assurance Guidelines](/Users/axross/Repositories/frontline-worker-client/.agents/skills/quality-assurance-guidelines/SKILL.md) and [Development Guidelines › Verification](/Users/axross/Repositories/frontline-worker-client/.agents/skills/development-guidelines/references/verification.md).

## Spec Structure and Section Order

A spec's sections MUST appear in one canonical order, so product, tech-lead, and reviewer readers always find each part where they expect it: requirements first (split functional vs non-functional), then the scope boundary, then what changes, then design, then how completion is verified.

**Canonical order:**

1. **Functional requirements** — what the system must do (behavioral, user-facing outcomes).
2. **Non-functional requirements** — qualities and constraints: performance, cost/volume, cardinality, platform/compatibility, security, no-behavior-change, naming conventions, and the like.
3. **Non-goals** — deliberate exclusions (see [problem-and-scope.md](./references/problem-and-scope.md#non-goals-and-out-of-scope)).
4. **Files to change** (coding work) or **Things to change** (non-coding work — e.g. feature flags, Datadog/config changes) — what will change and why, at file/artifact granularity.
5. **System design / architecture** — design rationale, data flow, module boundaries, alternatives (see [architecture-overview-framing.md](./references/architecture-overview-framing.md)); include a **UI design** subsection here when the work is view-affected (see [ui-design-framing.md](./references/ui-design-framing.md)).
6. **Acceptance criteria** — the verifiable checklist (see [acceptance-criteria.md](./references/acceptance-criteria.md)).
7. **Testing strategy** — the coverage to add or update.

**Guidelines:**

- MUST order the spec's sections exactly as above; do not reorder.
- MUST include **Functional requirements** and **Non-functional requirements** as distinct sections (both recommended); when one has nothing relevant, write "Not applicable" rather than deleting the heading.
- MUST place **Non-goals** immediately after the two requirements sections — before any design or implementation content — because it defines scope for product and tech-lead readers.
- MUST include a **Files to change** / **Things to change** section after Non-goals that names what changes and why, instead of burying the change list inside System design / architecture.
- MUST keep **System design / architecture** after Files to change, and MAY omit it entirely when the change is tiny and has no architectural impact.
- MUST place **Acceptance criteria** before **Testing strategy**.
- SHOULD open with one or two sentences of problem/outcome framing before Functional requirements (see [problem-and-scope.md](./references/problem-and-scope.md#outcome-before-solution)); MAY add an **Assumptions** section (see [problem-and-scope.md](./references/problem-and-scope.md#assumptions-vs-open-questions)) placed immediately after Non-goals when present.

## Problem Framing and Scope

See [problem-and-scope.md](./references/problem-and-scope.md) for:

- stating the user-facing outcome and problem before any solution detail
- writing explicit non-goals and out-of-scope bullets
- separating stated assumptions from open questions
- right-sizing the section to the size of the change
- replacing vague quality adjectives with concrete, checkable statements

## Acceptance Criteria Craft

See [acceptance-criteria.md](./references/acceptance-criteria.md) for:

- writing criteria a reviewer can verify independently, without reading implementation code
- preferring concrete, checkable phrasing over adjectives
- covering the happy path, edge/error/empty states, and explicit non-effects
- right-sizing the checklist and including verification-gate criteria
- tracing every criterion back to the rest of the spec

## UI Design Section Framing

See [ui-design-framing.md](./references/ui-design-framing.md) for:

- when a spec needs a UI design section at all (view-affected changes only) and at what fidelity
- describing hierarchy and layout intent in spec terms, not implementation
- enumerating interaction states (default, disabled, loading, error, empty)
- stating accessibility intent as testable, WCAG-referencing criteria
- stating responsive behavior intent and copy/microcopy constraints

## Architecture Overview Framing

See [architecture-overview-framing.md](./references/architecture-overview-framing.md) for:

- when a spec needs a system-design/architecture section at all (broad or hard-to-reverse changes only)
- describing data flow and module boundaries at spec level, not implementation
- recording alternatives considered and why they were rejected
- stating constraints and non-functional requirements as measurable targets

## Spec Template

See [template.md](./references/template.md) for:

- a self-contained, annotated Markdown skeleton for the full spec in the canonical section order (Functional / Non-functional requirements → Non-goals → Files/Things to change → System design → Acceptance criteria → Testing strategy)
- what belongs in each slot, and how to right-size or omit a section
