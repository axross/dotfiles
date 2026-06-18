---
name: technical-document-best-practices
description: Apply this skill when drafting, structuring, editing, or reviewing technical documents in the software / web engineering domain — including design docs, RFCs, ADRs, runbooks, READMEs, API tutorials, internal team docs, and engineering blog posts. Covers audience analysis and scope/prerequisite statements, document-type selection (tutorial, how-to, reference, explanation), heading and flow organization, sentence-level clarity (active voice, present tense, short sentences), word-level discipline (consistent terminology, ambiguous pronouns, filler removal), list/table/code-example rules, Mermaid diagram authoring, voice and tone for global and inclusive readers, and maintenance practices that keep docs current. Use even when the request is phrased as "make this clearer", "how should I structure this", "is this readable", or "review my blog post".
---

# Technical Document Best Practices

Apply these rules whenever drafting, restructuring, editing, or reviewing a technical document in the software or web engineering domain. The rules apply across formats — design docs, RFCs, ADRs, runbooks, READMEs, tutorials, how-to articles, API references, and engineering blog posts (company-internal or personal).

This skill governs the *writing craft* of technical documents. It is domain-scoped to software / web engineering — the audience assumptions, vocabulary, and example forms (code blocks, terminal sessions, API shapes) reflect that. Out of scope: marketing copy, fiction, academic papers in non-software fields, and end-user product documentation for non-software products. For agent-skill authoring specifically, defer to [agent-skills-best-practices](../agent-skills-best-practices/SKILL.md), which inherits the rules here and adds skill-format-specific ones on top.

This skill is the source of truth for plain-English and CEFR-vocabulary discipline (see [voice-tone-and-maintenance.md](./references/voice-tone-and-maintenance.md)). When a document is authored by a specific person writing under their own name — e.g., Kohei via [english-text-authoring](../english-text-authoring/SKILL.md) — apply that person's word-choice and tone preferences as an accent *within* these rules; the structure, document-type, clarity, terminology, and inclusive-language rules here still govern. This applies only to documents (design docs, RFCs, runbooks, READMEs, blog posts); for that author's comments, chat, and PR descriptions, defer to their authoring skill.

## Audience and Document Type

See [audience-and-document-types.md](./references/audience-and-document-types.md) for:

- Identifying the primary reader and their prior knowledge before drafting
- Treating the document as self-contained — no references to local files, in-progress artifacts, or restricted-access resources
- Stating scope, prerequisites, and explicit out-of-scope items up front
- Picking one of the four document types (tutorial, how-to, reference, explanation) and not mixing them
- Mapping common software-engineering doc forms (RFC, ADR, runbook, README, blog post) to the four types
- The "if it isn't documented, it doesn't exist" rule and what it implies for completeness

## Structure and Flow

See [structure-and-flow.md](./references/structure-and-flow.md) for:

- Leading with the answer / TL;DR / decision before the supporting detail
- Motivating change in strategy and direction docs — answering "why now", naming stakes, framing proposals as candidates
- Task-based, sentence-case headings that use the reader's vocabulary
- Heading hierarchy rules — no skipped levels, no stacked headings without intro text
- Skimmability — descriptive headings, key concept first in the paragraph, short paragraphs
- Progressive disclosure within a document — concept near instruction, simple before complex
- Descriptive link text and stable anchors for addressability

## Sentence and Word Craft

See [sentence-and-word-craft.md](./references/sentence-and-word-craft.md) for:

- Active voice, second person ("you"), present tense as the default
- One idea per sentence and how to break long sentences
- Replacing weak verbs (`be`, `have`, `make`) and cutting filler phrases
- Avoiding colon-lead-in paragraph labels (`The principle:`, `The rule:`) except when introducing a diagram, code block, list, or table
- Defining new terms once and using the same term consistently — no synonym variation
- Acronym discipline (spell out on first use; only abbreviate when significantly shorter and reused)
- Eliminating ambiguous pronouns (`it`, `this`, `that`, `they`) by repeating the noun or placing it near the referent

## Lists, Tables, and Code Examples

See [lists-tables-and-code.md](./references/lists-tables-and-code.md) for:

- When to use bulleted lists, numbered lists, tables, or running prose
- Parallel grammar, capitalization, and punctuation across list items
- Numbered procedure steps starting with an imperative verb
- Introducing lists and tables with a colon-ending lead-in sentence
- Code example rules — minimal, runnable, realistic, with surrounding context
- Inline code formatting, UI-element formatting, and figure / table captions
- Authoring diagrams in [Mermaid](https://mermaid.ai/open-source/intro/) — picking the right diagram type, embedding in ` ```mermaid ` fenced blocks, and pairing with captions and prose summaries

## Voice, Tone, and Maintenance

See [voice-tone-and-maintenance.md](./references/voice-tone-and-maintenance.md) for:

- Conversational-but-professional voice; not blaming the reader
- Inclusive language and gender-neutral phrasing
- Globalization — avoiding idioms, sports / cultural metaphors, ambiguous date formats
- Capping working vocabulary at CEFR C1 (with a level-graded replacement table covering above-C2, C2, and C1 offenders) so non-native readers can read without a dictionary
- Accessibility — alt text, descriptive link text, not relying on color alone
- Maintenance — currency over completeness, ARID (accept some repetition), single source of truth
- Self-editing — multiple drafts, read aloud, take a break before review, cut on the second pass
