# ==========================================
# Windows Terminal + PowerShell 7 + Starship
# ==========================================
function cdf {
    $folder = Get-ChildItem -Directory | ForEach-Object { $_.FullName } | fzf
    if ($folder) {
        Set-Location $folder
    }
}
# ==========================================
# Starship Prompt
# ==========================================
if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)

    # Blank line between prompts, but not before the first one, and not
    # right after clear/cls — a cleared screen should start clean too.
    $__starshipPrompt = $function:prompt

    function prompt {
        $__lastCmd = (Get-History -Count 1).CommandLine
        if ($MyInvocation.HistoryId -gt 1 -and $__lastCmd -notin @('clear', 'cls')) {
            Write-Host ""
        }
        & $__starshipPrompt
    }
}

# ==========================================
# Zoxide (smart cd)
# ==========================================
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# ==========================================
# fzf fuzzy cd
# ==========================================
# Type: cdf
# Opens a fuzzy folder picker
function fcd {
    $dir = fzf --walker=dir
    if ($dir) {
        Set-Location $dir
    }
}
Set-Alias cdf fcd

# ==========================================
# thefuck
# ==========================================
$env:TF_SHELL = "powershell"

# Ensure Python 3.11 Scripts folder takes priority in PATH
$py311Scripts = "$env:LOCALAPPDATA\Programs\Python\Python311\Scripts"
if ($env:PATH -notlike "*$py311Scripts*") {
    $env:PATH = "$py311Scripts;$env:PATH"
}

# Generate and evaluate the alias clean of warnings
if (Test-Path "$py311Scripts\thefuck.exe") {
    $env:PYTHONWARNINGS = "ignore"
    $fuckAlias = (& "$py311Scripts\thefuck.exe" --alias 2>$null) | Out-String
    if ($fuckAlias) {
        Invoke-Expression $fuckAlias
    }
}

# ==========================================
# PSReadLine
# ==========================================
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# ==========================================
# Aliases
# ==========================================
Set-Alias ls lsd

# ==========================================
# Open Notepad++ instead of standard Notepad
# ==========================================
function notepad {
    & "C:\Program Files\Notepad++\notepad++.exe" $args
}
