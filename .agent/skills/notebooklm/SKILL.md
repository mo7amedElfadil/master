---
name: notebooklm
description: "Expert guide for the NotebookLM CLI (`nlm`) and MCP server - interfaces for Google NotebookLM. Use this skill when users want to interact with NotebookLM programmatically, including: creating/managing notebooks, adding sources (URLs, YouTube, text, Google Drive), generating content (podcasts, reports, quizzes, flashcards, mind maps, slides, infographics, videos, data tables), conducting research, chatting with sources, or automating NotebookLM workflows. Triggers on mentions of \"nlm\", \"notebooklm\", \"notebook lm\", \"podcast generation\", \"audio overview\", or any NotebookLM-related automation task."
version: "0.3.12"
---

# NotebookLM Skill — Redirected

> [!IMPORTANT]
> **This skill has been superseded by `nlm-skill`.**
> The canonical, comprehensive NotebookLM skill is located at:
> `.agent/skills/nlm-skill/SKILL.md`
>
> Read that file for the full 29-tool MCP reference, CLI commands, workflows, and troubleshooting.

## Quick Context

- **Package**: `notebooklm-mcp-cli` v0.3.12 (installed via `uv tool install notebooklm-mcp-cli --force`)
- **Executables**: `nlm` (CLI) and `notebooklm-mcp` (MCP server)
- **Auth**: Cookie-based via Chrome DevTools Protocol (`nlm login`)
- **Profile**: `~/.notebooklm-mcp-cli/profiles/default`
- **MCP Config**: `~/.gemini/antigravity/mcp_config.json` (entry: `notebooklm`)
- **WSL Note**: Requires `google-chrome-stable` installed on Linux for `nlm login` (WSLg provides display)

## Most Common Commands

```bash
nlm login                                    # Authenticate (cookie extraction)
nlm notebook list                            # List all notebooks
nlm notebook create "Title"                  # Create notebook
nlm source add <nb-id> --file path.md        # Add local file as source
nlm source add <nb-id> --url "https://..."   # Add URL as source
nlm notebook query <nb-id> "question"        # One-shot Q&A
nlm slides create <nb-id> --confirm          # Generate slides
nlm audio create <nb-id> --confirm           # Generate podcast
nlm studio status <nb-id>                    # Check generation progress
nlm download slide-deck <nb-id> --output slides.pptx --format pptx  # Download slides
nlm doctor                                   # Diagnose issues
```

## Full Reference

See `.agent/skills/nlm-skill/SKILL.md` for:
- All 29 MCP tools with parameters
- Complete CLI command reference
- Workflow decision tree
- Research & source discovery
- Content generation (audio, video, slides, reports, quizzes, etc.)
- Error recovery table
- Rate limiting guidelines
