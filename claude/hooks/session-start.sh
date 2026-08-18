#!/usr/bin/env bash
#
# SessionStart hook: put mise-managed CLI tools (node, npm, gh, ...) on PATH for
# every Bash tool call in the session.
#
# Claude Code sources a per-session shell snapshot before each Bash command, and
# that snapshot re-exports a fixed PATH that omits mise's shim directory — so
# mise-managed tools are otherwise "command not found" in the non-interactive
# shell the Bash tool uses. Claude Code also runs $CLAUDE_ENV_FILE as a preamble
# before each Bash command, applied on top of the snapshot; appending mise's shim
# directory to PATH there restores the tools for the whole session.
#
# Shims (a single PATH export) are used rather than `mise activate` shell hooks:
# they need no per-command subprocess, parse identically in bash and zsh, and
# still resolve per-directory tool versions at exec time.
set -euo pipefail

# This hook exists to expose mise-managed tools, so mise is a hard prerequisite.
# Resolve its path via `command -v` (the portable `which`); fail loudly if it is
# missing so the environment gets fixed rather than silently losing its toolchain.
mise_bin="$(command -v mise || true)"
if [ -z "$mise_bin" ]; then
  echo "session-start hook: mise not found on PATH — install mise (https://mise.jdx.dev) so its managed CLIs (node, npm, gh, ...) are available to Bash commands." >&2
  exit 1
fi

# Nothing to persist into if the harness didn't hand us an env file. Some builds
# leave CLAUDE_ENV_FILE empty (claude-code#15840); degrade quietly.
[ -n "${CLAUDE_ENV_FILE:-}" ] || exit 0

# Shim activation is a single portable PATH export (parses in the bash/zsh
# preamble and still resolves per-directory tool versions at exec time).
activation="$("$mise_bin" activate bash --shims)"

# SessionStart also fires on resume/clear/compact against the same env file, so
# append the activation only once.
if ! grep -qF "$activation" "$CLAUDE_ENV_FILE" 2>/dev/null; then
  printf '%s\n' "$activation" >> "$CLAUDE_ENV_FILE"
fi

echo "mise: mise-managed CLI tools (node, npm, gh, ...) are on PATH for Bash commands this session."
