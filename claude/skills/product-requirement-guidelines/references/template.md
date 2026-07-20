# Spec Template

Apply this reference as a starting skeleton for a spec, in the canonical section order from [Spec Structure and Section Order](../SKILL.md#spec-structure-and-section-order). Copy the skeleton, fill each slot per [problem-and-scope.md](./problem-and-scope.md), [acceptance-criteria.md](./acceptance-criteria.md), [architecture-overview-framing.md](./architecture-overview-framing.md), and [ui-design-framing.md](./ui-design-framing.md), and delete the italic annotations before publishing.

**Guidelines:**

- MUST keep the sections in the order below; do not reorder.
- MUST include **Functional requirements** and **Non-functional requirements** (both recommended); write "Not applicable" when a section has nothing, rather than deleting the heading.
- MUST place **Non-goals** immediately after the requirements, and **Files to change** / **Things to change** after Non-goals.
- MUST place **Acceptance criteria** before **Testing strategy**.
- MAY omit **System design / architecture** when the change is tiny with no architectural impact, and MAY omit **UI design** unless the work is view-affected.
- MUST delete the italic annotations before the spec is final; right-size per [problem-and-scope.md](./problem-and-scope.md#right-sizing-scope).

## Skeleton

Everything in `<…>` is a slot to fill; everything in italics is an annotation to delete.

```markdown
<One or two sentences of problem/outcome framing: who is affected, what is broken or
missing, and the outcome sought — before any solution detail.>
_(See problem-and-scope.md → Outcome Before Solution.)_

## Functional requirements

- <What the system must do — a behavioral, user-facing outcome; one requirement per bullet.>
_(Write "Not applicable" if the change has no functional behavior.)_

## Non-functional requirements

- <A quality or constraint: performance, cost/volume, cardinality, platform/compatibility,
  security, no-behavior-change, naming convention, etc.>
_(Write "Not applicable" if none apply.)_

## Non-goals

- <Something that could reasonably have been in scope, deliberately excluded, and why.>
_(See problem-and-scope.md → Non-Goals and Out-of-Scope.)_

## Assumptions  _(optional — omit if none)_

- <A belief the plan relies on that the reader might disagree with.>
_(See problem-and-scope.md → Assumptions vs. Open Questions.)_

## Files to change  _(coding work)_  /  Things to change  _(non-coding work)_

- `<path/to/file>` — <what changes there and why.>
- <For non-coding work: the flag / config / dashboard change and why.>

## System design / architecture  _(omit when tiny with no architectural impact)_

<Data flow, module boundaries, key decisions and alternatives considered.>
_(See architecture-overview-framing.md. Add a "UI design" subsection here when view-affected — see ui-design-framing.md.)_

## Acceptance criteria

- <One observable happy-path behavior a reviewer can verify from the diff or the running UI.>
- <One relevant edge/disabled/empty/error-state behavior.>
- <An explicit "X is unaffected" criterion when this change sits next to something untouched.>
_(See acceptance-criteria.md → Coverage and Right-Sized Checklists.)_

## Testing strategy

- <The coverage to add or update, plus the verification gates (format/lint, unit, e2e, build).>
```
