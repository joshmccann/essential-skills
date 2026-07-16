#!/usr/bin/env bash
# Essential Skills - one-command installer
set -e
DEST="$HOME/.claude/skills"
mkdir -p "$DEST"
TMP="$(mktemp -d)"
echo "Installing Essential Skills into $DEST ..."

git clone --depth 1 https://github.com/anthropics/skills "$TMP/anthropic" >/dev/null 2>&1
cp -R "$TMP/anthropic/skills/mcp-builder" "$DEST/"
cp -R "$TMP/anthropic/skills/webapp-testing" "$DEST/"
cp -R "$TMP/anthropic/skills/brand-guidelines" "$DEST/"

git clone --depth 1 https://github.com/vercel-labs/skills "$TMP/vercel" >/dev/null 2>&1
cp -R "$TMP/vercel/skills/find-skills" "$DEST/"

git clone --depth 1 https://github.com/oliwoodman/llm-council-skill "$DEST/llm-council" >/dev/null 2>&1
rm -rf "$DEST/llm-council/.git"

rm -rf "$TMP"
echo ""
echo "Done. Installed all 5 skills. Restart Claude Code to load them."
