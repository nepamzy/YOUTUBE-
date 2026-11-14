# THE UNTOLD FILES — Claude image connector setup

This setup connects the official fal and Replicate MCP servers to Claude Code, and documents the matching Claude Desktop setup.

## Spending rule: FREE OPTIONS ONLY

- Connecting either MCP server is free.
- Do not purchase credits, add a payment method, start a paid generation, or run a model with a non-zero price.
- Before every generation, inspect the exact model and current price.
- If the model is not explicitly free for this account and this run, STOP and ask the owner. Do not assume that a free connector means free image generation.
- Replicate's "Try for Free" collection contains limited free runs; availability and remaining free runs must be checked on the account/model page.
- fal model runs are normally pay-per-output. Only run a fal model if fal explicitly shows that the account has an active free program and free runs remaining. Otherwise leave fal connected but unused.

## Official server names and endpoints

| Provider | Claude connector/server name | Official MCP URL | Authentication |
|---|---|---|---|
| fal | `fal` | `https://mcp.fal.ai/mcp-relay` | fal browser OAuth sign-in; no API key for supported clients |
| Replicate | `replicate` | `https://mcp.replicate.com/sse` | Replicate API token and browser approval |

Official setup references:
- fal: https://fal.ai/mcp
- Replicate: https://mcp.replicate.com/
- Replicate MCP docs: https://replicate.com/docs/reference/mcp
- Claude remote connectors: https://support.claude.com/en/articles/11175166-get-started-with-custom-connectors-using-remote-mcp

## Claude Code on Windows

From PowerShell, run the included `setup-claude-code-connectors.ps1` script. It adds both servers at user scope without embedding API keys.

Then open Claude Code and run:

```text
/mcp
```

Authenticate fal in the browser when prompted. Authenticate Replicate using the Replicate sign-in/token approval flow. Then run:

```text
/mcp
```

Confirm both `fal` and `replicate` show as connected. Also run `claude mcp list` in PowerShell to inspect configured servers.

If either name already exists, the script leaves that existing entry untouched. Inspect it before changing anything.

## Claude Desktop

Remote connectors are managed through the Claude account:
1. Open Claude Desktop.
2. Open **Settings → Connectors** (or **Customize → Connectors**, depending on the current layout).
3. Choose **Add custom connector**.
4. Add the exact name and URL from the table above.
5. Complete the provider's authentication and approval.

Important: Claude Free accounts are limited to one remote custom connector. If this applies to the account, do not remove or replace an existing connector without the owner's decision. Both servers can still be configured in Claude Code independently.

## Required verification

Do not report setup as complete until all relevant checks pass:
- Claude Code `claude mcp list` shows both servers.
- Claude Code `/mcp` shows both servers connected/authenticated.
- Claude Desktop shows each connector as connected if the account plan permits both.
- Use a non-billable discovery/list/pricing operation only; do not generate an image as a connection test.
- Confirm each server can list/search models and inspect pricing without launching a prediction.

## Episode 001 image delivery workflow

For THE UNTOLD FILES Episode 001:
1. Use the existing approved prompts in `episodes/001-the-woman-who-sold-her-husbands-secret/image_prompts.md`.
2. Generate only after verifying the selected run is free and the owner has approved that exact model/run.
3. Save each completed image locally under:
   `episodes/001-the-woman-who-sold-her-husbands-secret/images/`
4. Use the exact filenames from the prompt pack:
   `approach.jpg`, `home.jpg`, `workshop.jpg`, `customers.jpg`, `market_offer.jpg`, `temptation.jpg`, `stolen_notebook.jpg`, `midnight_exchange.jpg`, `missing_secret.jpg`, `confrontation.jpg`, `false_formula.jpg`, `rebuilding_trust.jpg`.
5. Validate every file exists, opens correctly, and is a single 16:9 scene (not a storyboard/collage).
6. Commit and push the actual binary image files to the GitHub repository. A prompt file, URL, provider media-library entry, or local-only image is NOT proof that the GitHub upload succeeded.
7. Report the exact commit SHA and links to the image files only after GitHub confirms the commit.

Never publish the video or spend money without explicit owner approval.
