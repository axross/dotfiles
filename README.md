# dotfiles

My config file set. This repository contents are managed by [dotbot](https://github.com/anishathalye/dotbot).

## Configuration Setup

To restore the configs from this repository to your machine, you can clone this repository and run:

```
$ ./install
```

To apply the config change to this repository contents, you can also run:

```
$ ./install
$ git push
```

## Mise Installation

In this config set, I use [mise](https://mise.jdx.dev/) for programming language/tool version manager.

To install mise and programming languages, you can run:

```
$ mise trust
$ mise install
```

## Agent Skills Installation

Agent skills are not stored in this repository. [`agents/.skill-lock.json`](./agents/.skill-lock.json) records which skills are installed and where each one comes from ([axross/skills](https://github.com/axross/skills), [axross/secret-skills](https://github.com/axross/secret-skills), or [axross/parsable-skills](https://github.com/axross/parsable-skills)).

To install them on a new machine, run `./install` first so `~/.agents/.skill-lock.json` links to the lockfile, then run this from the repository root:

```
$ sh -c "$(jq -r '.skills | to_entries | group_by(.value.source)[] | "npx --yes skills add \(.[0].value.source) --global --agent claude-code universal --yes" + (map(" --skill \(.key)") | join("")) + " </dev/null"' agents/.skill-lock.json)"
```

It runs `npx skills add` once per upstream. Each skill is installed into `~/.agents/skills/` and linked from `~/.claude/skills/`. Notes:

- The two private upstreams need GitHub read access.
- The skills are installed at their latest upstream version, not the version recorded in the lockfile, so commit the lockfile afterward.
- Tested with `skills` CLI 1.7.4.
