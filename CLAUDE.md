# CLAUDE.md

This repository holds macOS dotfiles managed by [dotbot](https://github.com/anishathalye/dotbot). Running [`./install`](./install) symlinks tracked files into `$HOME` according to the map in [`install.conf.yaml`](./install.conf.yaml). [`README.md`](./README.md) carries the setup commands.

One consequence shapes every task here: **a file in this repository is live at its installed location.** Editing `~/.zshrc` or `~/.claude/settings.json` edits this repository through a symlink. There is no build step and no deploy step. A save takes effect in the next shell or the next agent session, and `git status` in this repository is the only record that it happened.

## Repository Map

Every tracked path and what it owns:

| Path                                                    | Owns                                                                                                              |
| ------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| [`install.conf.yaml`](./install.conf.yaml)               | The symlink map. A file is not installed until this file lists it.                                                 |
| [`install`](./install)                                   | dotbot entry point. Syncs the `dotbot` submodule, then applies the map.                                            |
| `dotbot/`                                                | Vendored submodule, pinned at v1.23.1. Never edit; `./install` updates it.                                        |
| [`claude/CLAUDE.md`](./claude/CLAUDE.md)                 | The **user-scope** agent agreement, installed to `~/.claude/CLAUDE.md`. It applies to every project, so it holds nothing specific to this repository — that is this file's job. |
| `claude/hooks/`                                           | Claude Code hooks, installed as a directory link. `session-start.sh` restores mise's PATH.                        |
| `claude/settings.json`                                   | Claude Code harness settings: permission allowlist, hooks, model, effort level.                                    |
| `agents/.skill-lock.json`                                | The record of which agent skills are installed and from which upstream. The `skills` CLI writes it through its link at `~/.agents/.skill-lock.json`. Generated — never hand-edited. |
| `agents/skills/`                                         | The installed skill bodies, written by the `skills` CLI through the `~/.agents/skills` directory link. Gitignored except `.gitkeep`, which keeps the directory present on a fresh clone. |
| `.gitignore`                                             | Ignores everything under `claude/skills/` and `agents/skills/` (except `agents/skills/.gitkeep`), so no skill content is ever committed. |
| `gitconfig`                                              | Shared git config. Includes `gitconfig-personal` always, and `gitconfig-parsable` only for `git@github.com:parsable/**` remotes. |
| `gitignore_global`, `ssh/config`, `zshrc`, `zshenv`       | Shell and SSH configuration, each linked to its dotfile.                                                           |
| `config/`                                                 | XDG-style config: `starship.toml` and `karabiner/karabiner.json`.                                                 |
| `Brewfile`, `mise.toml`                                   | Package and toolchain manifests, linked into `$HOME` and applied by hand (see below).                              |

## The Symlink Contract

`./install` is idempotent and safe to re-run. It only creates directories and links; the `shell:` block that once ran `brew bundle`, `mise trust`, and `mise install` is commented out, so those remain manual steps.

**Guidelines:**

- MUST add a `link:` entry to [`install.conf.yaml`](./install.conf.yaml) for every new top-level file, then run `./install`. A tracked file with no entry is committed but never reaches `$HOME`, which looks like the change silently doing nothing.
- MUST NOT add an entry for a file created inside an already-linked directory. `~/.claude/hooks` and `~/.agents/skills` are **directory** links, so their contents follow automatically.
- MUST NOT add a `link:` entry under `~/.claude/skills/`. The `skills` CLI owns the per-skill links there, and the Claude desktop app owns `synced/`.
- MUST verify after any `install.conf.yaml` change that no link dangles: `find ~ -maxdepth 2 -type l ! -exec test -e {} \; -print`. A `link:` whose target does not exist yet produces a broken symlink rather than an error.
- MUST NOT edit anything under `dotbot/`; it is a pinned submodule.
- MUST treat `agents/.skill-lock.json` as generated output of the `skills` CLI, and commit whatever that CLI writes rather than editing it.

## The Agent Skill Set

Skills are **installed, never vendored.** Every skill comes from one of three upstreams. Their bodies live in this checkout under `agents/skills/`, but are gitignored; what is committed is `agents/.skill-lock.json`, which records each installed skill and its source:

| Upstream                                                              | Visibility |
| --------------------------------------------------------------------- | ---------- |
| [`axross/skills`](https://github.com/axross/skills)                   | public     |
| [`axross/secret-skills`](https://github.com/axross/secret-skills)     | private    |
| [`axross/parsable-skills`](https://github.com/axross/parsable-skills) | private    |

The `skills` CLI installs each skill into `~/.agents/skills/<name>` and links it from `~/.claude/skills/<name>`. `~/.agents/skills` is itself a dotbot directory link to `agents/skills/`, so every install lands in this checkout. [`README.md`](./README.md) carries the command that restores the whole set from the lockfile after a clone.

Add or remove a skill with the CLI, then commit the lockfile it rewrote:

```bash
npx skills add <owner>/<repo> --global --agent claude-code universal --yes --skill <name>
npx skills remove --global --yes <name>
```

Both agents go on every `add`. With `claude-code` alone, the CLI v1.7.4 has only one target directory and silently switches to copy mode, which leaves a real directory in `~/.claude/skills/` instead of a link. The agent identifier is `claude-code`, not `claude`; the CLI rejects `claude` and writes nothing. `--skill` takes one name per flag, so repeat it for several.

The lockfile records sources, not versions. `npx skills add` always installs the upstream's current head, so a restore yields the latest skills and rewrites the lockfile's hashes and timestamps.

**Guidelines:**

- MUST consult the `agent-skill-management` skill before adding, renaming, moving, or removing a skill, and to route a defect found in an installed skill.
- MUST fix a skill defect in its upstream repository and reinstall. An installed copy under `agents/skills/` is gitignored, so an edit to it is never recorded and is lost on the next install.
- MUST NOT commit skill content to this repository; keep `agents/skills/` ignored except its `.gitkeep`. This deliberately departs from `agent-skill-management`'s rule to commit installed skill roots: that rule serves a repository that authors skills, and this one only consumes them.
- MUST commit the lockfile after every `npx skills add` or `remove`, since it is the only record of the installed set.
- MUST NOT put a rule specific to one project in a global skill; it belongs in that project's own agent file.

## Verification

This repository has no test suite, formatter, or linter, and no skill content to validate. The gates are the checks below, run against what changed:

```bash
jq empty claude/settings.json                                                  # settings still parse
find ~ -maxdepth 2 -type l ! -exec test -e {} \; -print                        # no dangling dotbot link
find ~/.claude/skills ~/.agents -type l ! -exec test -e {} \; -print           # no dangling skill link
grep -o '\./skills/[^)]*' claude/CLAUDE.md | sed 's|^\.|'"$HOME"'/.claude|' | xargs ls >/dev/null  # skill links resolve
```

**Guidelines:**

- MUST run `jq empty claude/settings.json` after editing it. A syntax error there surfaces only when the next session loads it.
- MUST use links of the form `./skills/<name>/SKILL.md` from `claude/CLAUDE.md`. That form resolves from `~/.claude/CLAUDE.md`, where the agent reads it, but not inside this repository, where the skills live under `agents/skills/`, not `claude/skills/`. Check them with the last command above, not with `check-links.mjs`.
- MUST verify a shell or hook change by starting a new session or shell, since nothing rebuilds and a syntax error surfaces only at load.
- MUST report which checks ran and which could not, because no CI will catch what a session skips (see below).

## Environment Gotchas

Each of these has cost time before:

- **mise tools are missing from the Bash tool's PATH** unless `claude/hooks/session-start.sh` runs. Claude Code re-exports a fixed PATH per command that omits mise's shim directory, so `node`, `npm`, and `gh` become "command not found". The hook appends mise's shims to `$CLAUDE_ENV_FILE`. When a mise-managed tool goes missing mid-session, that hook is the thing to check.
- **Commits are GPG-signed** (`commit.gpgsign = true`, and `tag.gpgSign`). A commit fails outright when the signing key is unavailable, rather than falling back to unsigned.
- **Git identity switches on the remote URL.** A `git@github.com:parsable/**` remote pulls in `gitconfig-parsable`; everything else gets `gitconfig-personal` only. An HTTPS remote for a Parsable repository does **not** match, so it silently uses the personal identity.
- **There is no `.github/` directory** — no CI, and no independent review workflow. Nothing verifies a change after the fact, so the checks above must run in-session.

## Accepted Deviation: Human Review Replaces the Independent Review

The change loop the user-scope agreement mandates ends every change with an independent review — a separate session under a bot identity, so the author never certifies its own work. This repository has no infrastructure to run one, and standing up CI for a personal dotfiles repository costs more than it returns.

The deviation is therefore deliberate: **in this repository, the maintainer's own review stands in place of the independent review.** It is recorded here rather than silently violated, and it changes nothing else about the loop — the tracking issue, the plan-approval gate, and in-session verification all still apply. Report a change here as awaiting the maintainer's review, and never describe the self-check as an independent review.
