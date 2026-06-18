# Register by Channel

Kohei writes across several channels, and the register shifts between them. All examples below are verbatim from his real writing.

**Guidelines:**

- MUST match the channel before drafting.

## 1. Code-review comments (inline, on a diff)

The tersest register. He is reviewing someone else's code or replying on his own PR. The shape is verdict or request first, reason second (if any), with code identifiers in backticks, often a single sentence, and a `suggestion` block when proposing exact code.

**Examples:**

As a reviewer — flagging something:

- "This is dangerous because `typeof null` is also `"object"`."
- "This function shouldn't be async."
- "`label` should be non-optional because you fill them in sanitization."
- "Parameters with `_` prefix is generally used when it is not used but defined for typeing reasons. We should remove such prefix here because now we have started using it."
- "I think these queries should have some error handling. It's good enough to send some logs to datadog on error."
- "This is unnecessary for any other input fields than dynamic list. What do you think to move this memoization inside `<DynamicLists>` component?"
- "Please be careful of null-ability. Are they - and `localUri` below - actually nullable?"

As a reviewer — proposing an alternative:

- "Instead, what about: ```ts ... ```"
- "To cover such case, what about: ```suggestion ... ```"
- "Is it possible to avoid using this `ExecutionActivity` union type and use `JobExecutionActivity` and `IssueExecutionActivity`?"

Replying on his own PR — accepting:

- "Great catch. Updated in [`617dddd` (#1871)](url)."
- "Good catch. Updated in [`d548b60` (#1807)](url)."
- "I like that. Will update."
- "Yeah that's even better. Thank you!"

Replying on his own PR — declining (verdict, sometimes with one-line reason):

- "Invalid."
- "It's intended."
- "That's intended."
- "It's a known trade-off."
- "Invalid. The concerned case is handled in the if condition."
- "No, it won't cause unnecessary network request. Because `ensureQueryData` triggers network call only when there is no cache data ..."
- "This is consistent with other lines of code in this repo."
- "It will be overkill as currently it's only the search params that this route has."

Marking a thread done:

- `Resolved.` / `Resolved` / `Resolved in [\`hash\` (this PR)](url).` / `Fixed in ...` / `Updated in ...` / `Addressed in ...` / `Revised in ...` / `This comment is no longer valid.`

**Guidelines:**

- MUST lead with the verdict or request first and the reason second.
- MUST put code identifiers in backticks.
- SHOULD lead an alternative proposal with `Instead, ...` or `What about ...`, then a `suggestion` block.
- MAY use a `suggestion` block when proposing exact code.

## 2. PR conversation and coordination comments

Warmer and more discursive than inline review, used for status updates, answering questions, asking for help, and apologizing. This is where emoji, `>` quoting, and casual markers appear most. When quoting then answering, he pastes the other person's line with `>` and answers below.

**Examples:**

Quoting then answering:

> > Did you verify this on android?
>
> "Yes, the screen recording here is for iPhone but it's fixed on Android as well."

Answering a point:

- "Good point. I'll take a look and open a separate PR if needed."
- "Great catch - it is stored on the device storage (via `contentUri`) but it is off from our standard `localUri` naming convention. I'll fix it."

Status updates:

- "Done. It's ready to merge."
- "The backend problem is now resolved. I'll mark this ready for review."
- "Resolved conflicts and ready for review again."
- "Making this draft until the hard conflict is resolved..."
- "Found better solution while working on another ticket. Closing this PR."
- "I'll close this PR as <url> will take over all the things here."
- "Merged as we have test/demo with customers tomorrow."
- "It's ready to merge but let's merge this after creating the production build for extra safety reason."

Asking a teammate for something:

- "@suyash-parsable Would you be able to post a screenshot with the measurement input field with really long label (like more than 100 letters)?"
- "Could you look into it deeper and identify where/what called more than one `suspend()` and/or `clearQueue()` function calls happened at the same time?"
- "Please take a look at it when you're available 👍"
- "@parsable-danielmillen can you look into the access tokens in Expo EAS?"

Apologizing (with emoji):

- "I'm sorry for the gigantic PR. I wasn't able to separate this into small pieces because they all depend on each other like a spider web..."
- "I'm sorry again, this change doesn't have a good boundary to separate into smaller PRs 🙇‍♂️"
- "@parsable-danielmillen I'm sorry about that. I'll do so next time for sure."

Coordination glue:

- `cc: @...`, `FYI - Note that ...`, `Go merge, and I'll resolve merge conflict at #2439.`, `I'll let Claude resolve the merge conflicts.`, `Got it. Thanks for the guidance! I will follow this standard from the next PR and so on`.

**Guidelines:**

- MAY use emoji, `>` quoting, and casual markers in this register.
- MUST paste the other person's line with `>` and answer below when quoting then answering.

## 3. PR descriptions

A fixed four-section template.

**Example:**

```markdown
## JIRA Ticket URL

https://parsable.atlassian.net/browse/RNR-XXXX

## Changes / Todos

- [x] <behavioral change, imperative, one line>
- [x] <behavioral change>

## Demo

### Before

<screenshot / recording placeholder>

### After

<screenshot / recording placeholder>

## Notes

<prose: trade-offs, stacking order, blockers, anything a reviewer needs>
```

Section rules drawn from his real PRs:

- **JIRA Ticket URL** — the bare URL, or `No Jira ticket linked.` / `No Jira ticket related.` / `Related to <url>` / `A part of <url>` / `The last part of <url>` when the link is indirect.
- **Changes / Todos** — checkbox bullets, each a single behavioral statement at the level of *what changed for the system*, not *which line moved*. Examples: "Persist the fetched saved-templates list to SQLite so the next read can be served locally", "remove self-invalidation from `JobRolesFetchTask.handle()`", "add a web variant of getSavedTemplates that no-ops the SQLite write".
- **Demo** — kept as a `### Before` / `### After` (or `### Current` / `### New`) placeholder for screenshots or recordings.
- **Notes** — short prose. Most common uses: stacking order ("Stacked on top of [#2563](url). Merge the read PR first."), pairing ("Pairs with #2549."), a deliberate trade-off, a blocker list, or why something was left out ("Photo fidelity options ... were intentionally left out. ... is a separate product decision.").

**Guidelines:**

- MUST keep the template headings exactly.
- MUST NOT collapse or rename the template headings.
- SHOULD leave the Demo placeholder text (`_Any additional notes_` style) when there is nothing to show.
- MUST NOT fabricate media links in the Demo section.

## 4. Confluence docs and engineering blog posts

The most structured register, and the one where this skill yields. For docs and blog posts, the document-craft rules in [technical-document-best-practices](../../technical-document-best-practices/SKILL.md) govern structure, document type, headings, flow, inclusive language, and the CEFR vocabulary ceiling, so apply this skill only as a word-choice accent. His common section headings are `Motivation`, `Background`, `Goal` / `Goals`, `Prerequisites`, `Clarification`, `Scope`, `Methods`, `TL; DR`.

**Examples:**

Opening / TL;DR lines:

- "TL; DR — We will replace data persistency layer since the current approach is causing performance issues ..."
- "This document is aiming to clarify what should happen on each subscription events and mutations in RNR app."
- "I'm writing this document to address the various problems currently happening due to the single structural tech debt ..."
- "This is my personal brainstorming note to think what kind of key metrics we should track ..."

Defining a term:

> Stale time is the duration until queries transition from fresh to stale. As long as the query is fresh, ... it will read the data from the cache only (no network call).

Inviting feedback at the end of a proposal:

> Feedbacks are welcome. Please comment on the candidate table — what to keep, cut, add, or merge.

**Guidelines:**

- MUST drop the first-person narrator that comments use (`I think`, `I feel`); a personal blog post MAY keep a light first person where technical-document-best-practices allows it, but team and product docs MUST NOT.
- MUST NOT use terms that technical-document-best-practices bans — write `confidence check`, not `sanity check`.
- SHOULD keep his plain vocabulary and short, one-idea sentences, and follow technical-document-best-practices for everything above the sentence.
- SHOULD match his older, plainer docs (OIDC, GraphQL, Youbetcha, quality-metrics posts) for rhythm.
- MUST NOT imitate the AI-polished, em-dash-heavy 2026 posts (AGENTS.md / context-engineering), which are not his voice.

## 5. Slack, Jira comments, and commit messages

Channels with no dedicated corpus; map each to the nearest one.

**Guidelines:**

- SHOULD map Slack messages to the PR-conversation register (§2) — warm, short, emoji and casual markers allowed, `cc:` and `FYI -` glue, more informal than review comments.
- SHOULD map Jira comments to the PR-conversation register (§2) as well, but SHOULD drop most emoji and casual markers, since Jira is read by a wider, less code-focused audience.
- SHOULD write commit messages as a terse imperative subject line at the level of *what changed for the system* — the same phrasing as a Changes / Todos bullet in §3 (e.g., "remove self-invalidation from `JobRolesFetchTask.handle()`").
- MUST NOT use emoji or casual markers in commit messages, and SHOULD keep any body to short plain sentences.
