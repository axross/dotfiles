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

Agent skills are installed at two levels, and only their lockfiles are committed. Each lockfile records which skills are installed and where each one comes from ([axross/skills](https://github.com/axross/skills), [axross/secret-skills](https://github.com/axross/secret-skills), or [axross/parsable-skills](https://github.com/axross/parsable-skills)).

- **User level**: bodies in `agents/skills/`, recorded in [`agents/.skill-lock.json`](./agents/.skill-lock.json). Only skills no project provides, because a user-level skill masks a same-named project skill.
- **Project level**: bodies in `.agents/skills/`, linked from `.claude/skills/`, recorded in [`skills-lock.json`](./skills-lock.json). The core skills sessions in this repository load.

To install them on a new machine, run `./install` first so `~/.agents/.skill-lock.json` links to the lockfile and `~/.agents/skills` links to `agents/skills/`, then run this from the repository root:

```
$ sh -c "$(jq -r '.skills | to_entries | group_by(.value.source)[] | "npx --yes skills add \(.[0].value.source) --global --agent claude-code universal --yes" + (map(" --skill \(.key)") | join("")) + " </dev/null"' agents/.skill-lock.json)"
```

Then restore the project-level skills for this repository:

```
$ npx --yes skills experimental_install --agent claude-code universal
```

`experimental_install` (alias `install`) is marked experimental. If it fails, install the same skills directly, one `--skill` per name in `skills-lock.json`:

```
$ npx --yes skills add axross/skills --agent claude-code universal --yes --skill <name> --skill <other-name>
```

The user-level command runs `npx skills add` once per upstream. Each skill is installed into `~/.agents/skills/`, which is `agents/skills/` in this repository, and linked from `~/.claude/skills/`. Notes:

- The two private upstreams need GitHub read access.
- The skills are installed at their latest upstream version, not the version recorded in the lockfile, so commit the lockfile afterward.
- Tested with `skills` CLI 1.7.4 (user level) and 1.9.0 (project level).

To undo a change that removed user-level skills, check out the earlier revision, delete any project-level install it does not record (`.agents/`, `.claude/skills/`, `skills-lock.json`), and re-run the user-level command above. Checking out alone does not restore removed bodies, because they are gitignored.

If `~/.agents/skills` is still a real directory, which is the case on a machine set up before skill bodies moved into this repository, `./install` cannot link it. Move its contents in once, then re-run `./install`:

```
$ mkdir -p agents/skills
$ mv ~/.agents/skills/* agents/skills/
$ rm -f ~/.agents/skills/.DS_Store && rmdir ~/.agents/skills
$ ./install
```
