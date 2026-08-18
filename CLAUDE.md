# CLAUDE.md

This repository holds macOS dotfiles managed by [dotbot](https://github.com/anishathalye/dotbot). Running [`./install`](./install) symlinks tracked files into `$HOME` according to the map in [`install.conf.yaml`](./install.conf.yaml). [`README.md`](./README.md) carries the setup commands.

One consequence shapes every task here: **a file in this repository is live at its installed location.** Editing `~/.zshrc`, `~/.claude/settings.json`, or anything under `~/.claude/skills/` edits this repository through a symlink. There is no build step and no deploy step. A save takes effect in the next shell or the next agent session, and `git status` in this repository is the only record that it happened.

## Repository Map

Every tracked path and what it owns:

| Path                                                    | Owns                                                                                                              |
| ------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| [`install.conf.yaml`](./install.conf.yaml)               | The symlink map. A file is not installed until this file lists it.                                                 |
| [`install`](./install)                                   | dotbot entry point. Syncs the `dotbot` submodule, then applies the map.                                            |
| `dotbot/`                                                | Vendored submodule, pinned at v1.23.1. Never edit; `./install` updates it.                                        |
| [`claude/CLAUDE.md`](./claude/CLAUDE.md)                 | The **user-scope** agent agreement, installed to `~/.claude/CLAUDE.md`. It applies to every project, so it holds nothing specific to this repository — that is this file's job. |
| `claude/skills/`                                         | The agent skill set, installed as the `~/.claude/skills` directory link.                                           |
| `claude/hooks/`                                           | Claude Code hooks, installed as a directory link. `session-start.sh` restores mise's PATH.                        |
| `claude/settings.json`                                   | Claude Code harness settings: permission allowlist, hooks, model, effort level.                                    |
| `agents/.skill-lock.json`                                | Lockfile the `skills` CLI writes, installed to `~/.agents/`. Generated — never hand-edited.                       |
| `gitconfig`                                              | Shared git config. Includes `gitconfig-personal` always, and `gitconfig-parsable` only for `git@github.com:parsable/**` remotes. |
| `gitignore_global`, `ssh/config`, `zshrc`, `zshenv`       | Shell and SSH configuration, each linked to its dotfile.                                                           |
| `config/`                                                 | XDG-style config: `starship.toml` and `karabiner/karabiner.json`.                                                 |
| `Brewfile`, `mise.toml`                                   | Package and toolchain manifests, linked into `$HOME` and applied by hand (see below).                              |

## The Symlink Contract

`./install` is idempotent and safe to re-run. It only creates directories and links; the `shell:` block that once ran `brew bundle`, `mise trust`, and `mise install` is commented out, so those remain manual steps.

**Guidelines:**

- MUST add a `link:` entry to [`install.conf.yaml`](./install.conf.yaml) for every new top-level file, then run `./install`. A tracked file with no entry is committed but never reaches `$HOME`, which looks like the change silently doing nothing.
- MUST NOT add an entry for a file created inside an already-linked directory. `~/.claude/skills` and `~/.claude/hooks` are **directory** links, so their contents follow automatically — a new skill needs no map change.
- MUST verify after any `install.conf.yaml` change that no link dangles: `find ~ -maxdepth 2 -type l ! -exec test -e {} \; -print`. A `link:` whose target does not exist yet produces a broken symlink rather than an error.
- MUST NOT edit anything under `dotbot/`; it is a pinned submodule.
- MUST treat `agents/.skill-lock.json` as generated output of the `skills` CLI, and commit whatever that CLI writes rather than editing it.

## The Agent Skill Set

`claude/skills/` is a **mixed** set, and the distinction decides where a rule change goes:

- Some skills are installed from [`axross/skills`](https://github.com/axross/skills) with the `skills` CLI. Re-running the install **overwrites** them, so a hand-edit is lost.
- Some skills are authored only here and have no upstream: `english-text-authoring`, `parsable-github-operation`, `parsable-jira-operation`.

Install or refresh an upstream skill with `--copy`, so it lands as a real directory this repository can commit rather than a symlink into the CLI's cache:

```bash
npx skills add axross/skills --global --agent claude-code --copy --skill <name>
```

The agent identifier is `claude-code`, not `claude`; the CLI rejects `claude` and writes nothing.

**Guidelines:**

- MUST consult [Agent Skill Management](./claude/skills/agent-skill-management/SKILL.md) before adding, renaming, moving, or removing a skill, and to route a defect found in a skill installed from upstream.
- MUST check whether a skill has an upstream before hand-editing it. For an upstream skill, fix it upstream and reinstall; a local edit survives only until the next install.
- MUST follow [Agent Skill Authoring](./claude/skills/agent-skill-authoring/SKILL.md) for the skill format.
- MUST update every inbound reference when renaming a skill. Cross-references between skills are plain prose as often as Markdown links, so `check-links.mjs` alone will not catch them — grep the old name across `claude/` as well.
- MUST NOT put a rule specific to one project in a global skill; it belongs in that project's own agent file.

## Verification

This repository has no test suite, formatter, or linter. `agent-skill-authoring` bundles the only automated gates available: three structural validators, one per kind of skill edit, plus a relative-link checker.

```bash
node claude/skills/agent-skill-authoring/scripts/check-skill-frontmatter.mjs claude/skills  # frontmatter, naming, discovery contract
node claude/skills/agent-skill-authoring/scripts/check-skill-body.mjs claude/skills         # section anatomy, guideline bullets, token budget
node claude/skills/agent-skill-authoring/scripts/check-skill-references.mjs claude/skills   # SKILL.md <-> references/ wiring
node claude/skills/agent-skill-authoring/scripts/check-links.mjs claude/                    # relative-link integrity
```

**Guidelines:**

- MUST run the structural validator that owns what changed — `check-skill-frontmatter.mjs` for frontmatter, `check-skill-body.mjs` for prose, `check-skill-references.mjs` for added, moved, or renamed reference files — and all three when unsure, plus `check-links.mjs` whenever a file moved or a link changed. Report every `WARN` line rather than treating a zero exit code as silence; advisory warnings never affect the exit code.
- MUST use repository-relative links of the form `./skills/<name>/SKILL.md` from `claude/CLAUDE.md`. That form resolves both here and from `~/.claude/CLAUDE.md` through the symlink; a `~/.claude/...` path resolves in neither and cannot be link-checked.
- MUST verify a shell or hook change by starting a new session or shell, since nothing rebuilds and a syntax error surfaces only at load.
- MUST report which checks ran and which could not, because no CI will catch what a session skips (see below).
- MUST NOT run `agent-skill-authoring`'s bundled link-freshness audit (`scripts/link-freshness/check.mjs`) as part of this gate. It reaches the network and is scheduled against the default branch only, never invoked from a session or a hook.

## Environment Gotchas

Each of these has cost time before:

- **mise tools are missing from the Bash tool's PATH** unless `claude/hooks/session-start.sh` runs. Claude Code re-exports a fixed PATH per command that omits mise's shim directory, so `node`, `npm`, and `gh` become "command not found". The hook appends mise's shims to `$CLAUDE_ENV_FILE`. When a mise-managed tool goes missing mid-session, that hook is the thing to check.
- **Commits are GPG-signed** (`commit.gpgsign = true`, and `tag.gpgSign`). A commit fails outright when the signing key is unavailable, rather than falling back to unsigned.
- **Git identity switches on the remote URL.** A `git@github.com:parsable/**` remote pulls in `gitconfig-parsable`; everything else gets `gitconfig-personal` only. An HTTPS remote for a Parsable repository does **not** match, so it silently uses the personal identity.
- **There is no `.github/` directory** — no CI, and no independent review workflow. Nothing verifies a change after the fact, so the checks above must run in-session.

## Accepted Deviation: Human Review Replaces the Independent Review

The change loop the user-scope agreement mandates ends every change with an independent review — a separate session under a bot identity, so the author never certifies its own work. This repository has no infrastructure to run one, and standing up CI for a personal dotfiles repository costs more than it returns.

The deviation is therefore deliberate: **in this repository, the maintainer's own review stands in place of the independent review.** It is recorded here rather than silently violated, and it changes nothing else about the loop — the tracking issue, the plan-approval gate, and in-session verification all still apply. Report a change here as awaiting the maintainer's review, and never describe the self-check as an independent review.
