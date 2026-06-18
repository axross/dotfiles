---
name: english-text-authoring
description: Apply this skill when drafting or editing any English text that the user (Kohei Asai, GitHub axross) will publish or send under his own name — GitHub PR descriptions, PR and code-review comments and replies, commit messages, Confluence pages and engineering blog posts, Slack messages, Jira comments, and any reply to a teammate. Captures his limited-vocabulary, non-native register, recurring expressions, sentence rhythm, directness, hedging, and emoji habits so the output reads as written by him rather than by an AI. Use even when the request is phrased "draft a reply", "write the PR description", "respond as me", "phrase this", "on my behalf", "reword this comment", or "say this to <teammate>".
metadata:
  type: reference
---

# English Text Authoring

Apply this skill whenever producing English text that the user — **Kohei Asai** (GitHub / Slack handle `axross`, Staff Engineer, English is his second language) — will publish or send under his own name. The goal is mimicry: a reader who knows his writing should not be able to tell the text was drafted by an AI.

This skill governs *how he sounds*, not *what to say*. The decision about content, technical correctness, and whether to send at all stays with the task. This skill only shapes wording, vocabulary range, sentence rhythm, register, and tone.

**Boundary with technical documents.** For doc-shaped output — Confluence docs and engineering blog posts — the structure, document-type, flow, clarity, inclusive-language, and vocabulary-ceiling rules in [technical-document-best-practices](../technical-document-best-practices/SKILL.md) govern; apply this skill there only as a word-choice accent, and drop the first-person narrator, the terms that skill bans (e.g., `sanity check` → `confidence check`), and the heavier hedging. For comments and chat — code-review comments, PR conversation, PR descriptions, Slack, Jira, and commit messages — this skill governs fully and technical-document-best-practices does not apply.

## Prime directive and signature

See [prime-directive.md](./references/prime-directive.md) for:

- The overriding rule — reproduce his voice but never his typos or grammar slips, and never out-write him
- The load-bearing signature markers to apply before reading the detailed references
- The provenance of the profile and which AI-generated samples to exclude as style sources

## Voice profile

See [voice-profile.md](./references/voice-profile.md) for:

- The core personality of the writing — limited vocabulary, terseness, directness softened by hedging
- Sentence construction and rhythm rules, punctuation habits, and what to keep vs. drop
- Emoji and casual-marker usage (`tho`, `kinda`, `anyways`, `FYI`, `cc:`)
- How he marks opinion vs. fact, and how he stays polite while being blunt

## Register by channel

See [registers.md](./references/registers.md) for:

- **Code-review comments** — verdict-first, link-to-commit replies, inline suggestions
- **PR conversation and coordination comments** — warmer, quotes with `>`, status updates, apologies
- **PR descriptions** — the fixed JIRA / Changes-Todos / Demo / Notes template and how each section reads
- **Confluence docs and blog posts** — TL;DR / Motivation / Background framing, how-to steps, term definitions

## Expression bank

See [expression-bank.md](./references/expression-bank.md) for:

- 200+ verbatim example phrasings, grouped by communication intent — pull the matching one rather than inventing
- Approving / praising, and rejecting or dismissing a concern (verdicts)
- Pointing to the commit that addresses feedback
- Proposing team action, and asking or suggesting via a question
- Hedging and marking opinion vs. fact, and explaining a reason
- Committing to future action, apologizing, coordinating, and answering yes / no

## Vocabulary and expression corpus

See [vocabulary-map.md](./references/vocabulary-map.md) for:

- The "an AI would write X; Kohei writes Y" lookup tables — consult whenever a polished or formal word is about to enter the draft
- Verb, connective / transition, hedge / modality, and intensifier / quantifier swaps
- Stock-phrase (expression-to-expression) replacements
- Kohei's lexical signatures to reach for, and his punctuation / structure forms
- How this personal corpus relates to the general plain-English ceiling owned by [technical-document-best-practices](../technical-document-best-practices/references/voice-tone-and-maintenance.md)
