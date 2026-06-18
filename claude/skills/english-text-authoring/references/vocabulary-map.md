# Vocabulary and Expression Corpus

The word-to-word and expression-to-expression lookup. The left column is what a fluent writer or an AI reaches for by default; the right column is what Kohei (`axross`) actually writes. When a left-column word or phrase is about to enter a draft, you MUST swap it for the right-column form.

This is the corpus that keeps the vocabulary *range* narrow — the single strongest signal of his voice. He reuses a small set of words on purpose; widening it reads as not-him.

These tables capture Kohei's *personal* lexical choices, not a general readability standard. The general plain-English / CEFR-vocabulary ceiling for technical documents is owned by [technical-document-best-practices](../../technical-document-best-practices/references/voice-tone-and-maintenance.md); his choices mostly align with it but are scoped tighter. In a Confluence doc or blog post, that skill's ceiling governs (see §4 of [registers.md](./registers.md)).

## Verbs

Maps default / AI-fluent verbs to the verb forms Kohei actually writes.

| Default / AI-fluent | Kohei writes |
| --- | --- |
| utilize, leverage *(in comments)* | use |
| commence, initiate | start |
| terminate, halt | stop, close |
| rectify, remediate, address the defect | fix |
| ascertain, determine | identify, figure out, find |
| elucidate, clarify *(verb)* | explain |
| implement, introduce | add, create |
| eliminate, discard *(prose)* | remove, delete, drop |
| modify, alter | update, change, modify |
| resolve *(a thread)* | resolve, address |
| verify, validate | verify, test, do a sanity check, check |
| comprehend | understand |
| postpone, defer | postpone, do it later, do it in the next PR |
| reconsider | rethink, reconsider |

**Guidelines:**

- MUST swap a left-column verb for the right-column form before it enters a draft.
- MUST write `use` in new docs, even though `leverage` and `utilize` appear in some of his older Confluence docs ("leverage cookie-based authentication", "utilize SQLite relationship"); technical-document-best-practices grades both above the C1 ceiling, and in comments he almost always says `use`.
- MUST NOT reach for `leverage` or `utilize` in new docs.

## Connectives and transitions

Maps default / AI-fluent connectives and transitions to the forms Kohei actually writes.

| Default / AI-fluent | Kohei writes |
| --- | --- |
| Furthermore, Moreover, In addition | Also, / Additionally, |
| Consequently, Therefore, Thus, Hence | So / So that ... |
| Nevertheless, Notwithstanding, That said | However, / But / tho |
| Conversely, Alternatively *(formal)* | Instead, / Alternatively, |
| Regarding, With respect to, In terms of | about / `-wise` (`concept-wise`, `performance-wise`) / in <X> aspect(s) |
| Subsequently, Thereafter | and so on / from the next PR / later |
| As a result of | due to / because of |
| In order to, So as to, For the purpose of | to / for the sake of |
| Provided that, In the event that | as long as / when / if |
| Given that, Since | as / because |

**Guidelines:**

- MUST swap a left-column connective for the right-column form before it enters a draft.

## Hedges and modality

Maps default / AI-fluent hedges and modality markers to the forms Kohei actually writes.

| Default / AI-fluent | Kohei writes |
| --- | --- |
| In my assessment, From my perspective | in my opinion / I think / in my understanding |
| It is my belief that | I think / I feel / I assume / I guess |
| It would be advisable to | I recommend to / I highly recommend to / Recommend to |
| It appears that | It seems / Seems to be / It seems like |
| Presumably, It is likely that | Probably |
| I would suggest that we | What about ~? / Is it possible to ~? / Let's ~ |
| Could you kindly, Would you mind | Would you be able to ~? / Could you ~? / can you ~? |
| Please correct me if I am mistaken | Please correct me if I'm wrong. |
| I am uncertain why | I'm not sure why ... |

**Guidelines:**

- MUST swap a left-column hedge for the right-column form before it enters a draft.

## Intensifiers, quantifiers, approximations

Maps default / AI-fluent intensifiers, quantifiers, and approximations to the forms Kohei actually writes.

| Default / AI-fluent | Kohei writes |
| --- | --- |
| numerous, a multitude of, several | a lot of / many / various |
| approximately, roughly | around / `~` (e.g. `~50`) |
| significantly, considerably | a lot / pretty / quite (`a quite tricky`, `pretty good`) |
| slightly, marginally | a little bit / a little / slightly |
| excessively | too (`too nitpicking`, `too much straight forward`) |
| entirely | entirely / completely |
| occasionally | sometimes |
| currently, at present | currently / for now / right now / at the moment / as of now |

**Guidelines:**

- MUST swap a left-column intensifier, quantifier, or approximation for the right-column form before it enters a draft.

## Stock phrases (expression-to-expression)

Maps default / AI-fluent stock phrases to the expressions Kohei actually writes.

| Default / AI-fluent | Kohei writes |
| --- | --- |
| This is by design / the intended behavior | It's intended. / Intended. / That's intended. |
| This is not a legitimate concern | Invalid. / It's not a valid concern. |
| This is a recognized / accepted compromise | It's a known trade-off. / That's an acknowledged trade-off. |
| This falls outside the scope of this PR | Out of scope for this PR. / it's out of scope of this work |
| Good observation / Excellent point / Astute catch | Great catch. / Good catch. / Good point. |
| I concur / I am in agreement | Agreed. / True. / That makes sense! / You are right. |
| Apologies for the oversight | My bad / Oh I'm sorry I overlooked. |
| This is a substantial / sizeable pull request | I'm sorry for the gigantic PR. |
| I will investigate further | I'll take a look / Could you look into it deeper ...? / I will keep my eyes on this matter. |
| This has been resolved in commit <hash> | Resolved in [`hash` (this PR)](url). / Fixed in ... / Updated in ... |
| Would it be feasible to / Might we consider | Is it possible to ~? / What about ~? / Would you be able to ~? |
| out of an abundance of caution | for extra safety reason / for the sake of safety |
| This would be over-engineering | It will be overkill / it would be over-abstraction |
| Please feel free to reach out | please feel free to ping me / I'll reach out in Slack |
| Let me provide context for future readers | Just as the context who would have reached here in the future, ... |
| This is consistent with the existing pattern | This is consistent with other lines of code in this repo. / to stay consistent with the established pattern |

**Guidelines:**

- MUST swap a left-column stock phrase for the right-column expression before it enters a draft.

## Kohei's lexical signatures (reach for these)

Lists words and forms Kohei favors that an AI would not default to, which read as him when used correctly.

- **`manner`** for *way / style* — "Should these be the same manner?", "align them to the same manner for the consistency".
- **`-wise`** — `concept-wise`, `performance-wise`; also "in both appearance and purpose aspects" and "in <X> aspect".
- **`trade-off`** (hyphenated) — "It's a known trade-off."
- **`overkill`**, **`workaround`**, **`hacky`**, **`nitpicking`** / **`too nitpicking`**.
- **`sanity check`** / **`checkup`**, **`tie breaker`** — `sanity check` is in-voice for comments and chat, but MUST become `confidence check` in docs, which technical-document-best-practices bans as ableist.
- **`for the sake of`**, **`for now`**, **`as is`** ("keep it as is").
- **`folks`** / **`other folks`**, **`guys`** ("Thanks guys!").
- **`Generically`** as a broad-statement opener (= generally/broadly).
- **`decent`** ("a decent way"), **`good enough`** ("It's good enough to ...").
- **`relatively`** / **`relatively light operation`**, **`fairly`** ("fairly simple/small").
- Casual: **`tho`**, **`kinda`**, **`anyways`**, **`gonna`**, **`FYI`**, **`cc:`**, **`convo`**, **`lol`**, **`haha`**.

**Guidelines:**

- SHOULD reach for these signature words and forms (used correctly), as they read as him.
- MUST swap `sanity check` for `confidence check` in docs, since technical-document-best-practices bans `sanity check` as ableist.

## Punctuation and structure (when an AI would do X, do Y)

Maps AI-default punctuation and structure choices to the forms Kohei actually writes.

| AI default | Kohei form |
| --- | --- |
| Em dash to join clauses: `the test passes — it never asserts` | New sentence, or ` - ` aside, or `So` / `Because`. Reserve `—` for `title — description` only. |
| Semicolon between clauses: `It works; the cache is stale` | Two sentences: `It works. But the cache is stale.` |
| Colon to join two clauses | Two sentences. Colon only before a list, code block, or quote. |
| Soften a question with "I was wondering whether ..." | Trailing `...?` — "are the both those required?" → "...required?" |
| Bare symbol name in prose: `the queryFn` | Backticked: `the \`queryFn\`` |
| Long multi-clause sentence | Split into 2–3 short sentences, one idea each, blank line between bigger points. |
| Footnote / reference section | Inline full URL, or a `ref:` / `ref.` line, or `[\`hash\` (this PR)](url)`. |

**Guidelines:**

- MUST swap an AI-default punctuation or structure choice for the right-column Kohei form before it enters a draft.
