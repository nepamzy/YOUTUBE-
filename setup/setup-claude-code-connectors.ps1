# Adds the official fal and Replicate MCP servers to Claude Code for the current Windows user.
# No API keys are written into this script or Claude configuration.
# Run from PowerShell in the repository root or any folder.

$ErrorActionPreference = "Stop"

if (-not (Get-Command claude -ErrorAction SilentlyContinue)) {
    throw "Claude Code CLI was not found in PATH. Install/open Claude Code first; no changes were made."
}

Write-Host "Checking existing Claude Code MCP servers..."
$existing = (& claude mcp list 2>&1 | Out-String)
Write-Host $existing

if ($existing -match '(?im)^\s*fal\s') {
    Write-Host "Existing 'fal' entry found; leaving it unchanged."
} else {
    Write-Host "Adding fal MCP server..."
    & claude mcp add --transport http --scope user fal https://mcp.fal.ai/mcp-relay
    if ($LASTEXITCODE -ne 0) { throw "Could not add fal MCP server." }
}

if ($existing -match '(?im)^\s*replicate\s') {
    Write-Host "Existing 'replicate' entry found; leaving it unchanged."
} else {
    Write-Host "Adding Replicate MCP server..."
    & claude mcp add --transport sse --scope user replicate https://mcp.replicate.com/sse
    if ($LASTEXITCODE -ne 0) { throw "Could not add Replicate MCP server." }
}

Write-Host ""
Write-Host "Configured entries:"
& claude mcp list

Write-Host ""
Write-Host "NEXT: Open Claude Code and run /mcp to complete provider authentication."
Write-Host "For Replicate, follow its browser/token approval flow."
Write-Host "Do not launch image generation. Check model pricing and free eligibility first."
