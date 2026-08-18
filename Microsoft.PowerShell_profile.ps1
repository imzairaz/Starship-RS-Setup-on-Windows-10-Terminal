# ==========================================
# Windows Terminal + PowerShell 7 + Starship
# ==========================================


# ==========================================
# Starship Prompt Configuration
# ==========================================
if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)

    # Add an empty line between prompts for better readability.
    # Avoid adding spacing after clear/cls commands so a cleared terminal starts clean.
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
# Zoxide - Smart Directory Navigation
# ==========================================
# Replaces cd with a smarter directory jumper.
# Example:
#   z github
#   z project
Invoke-Expression (& { (zoxide init powershell | Out-String) })


# ==========================================
# FZF - Interactive Folder Picker
# ==========================================
# Quickly browse and select folders from the current location.
#
# Usage:
#   cdf
#
# Controls:
#   ↑ ↓  Select folder
#   Enter Open folder
#   ESC   Cancel
function fcd {
    $dir = fzf --walker=dir

    if ($dir) {
        Set-Location $dir
    }
}

Set-Alias cdf fcd


# ==========================================
# The Fuck - Command Correction Tool
# ==========================================
# Automatically fixes previous mistyped commands.
# Example:
#   Typo command → fuck → corrected command
$env:TF_SHELL = "powershell"


# ==========================================
# Python Scripts Path Configuration
# ==========================================
# Add Python 3.11 Scripts folder to PATH
# (Required for tools installed with pip)
$py311Scripts = "$env:LOCALAPPDATA\Programs\Python\Python311\Scripts"

if ($env:PATH -notlike "*$py311Scripts*") {
    $env:PATH = "$py311Scripts;$env:PATH"
}


# ==========================================
# Initialize The Fuck Alias
# ==========================================
# Loads thefuck PowerShell alias without showing Python warnings.
if (Test-Path "$py311Scripts\thefuck.exe") {
    $env:PYTHONWARNINGS = "ignore"

    $fuckAlias = (& "$py311Scripts\thefuck.exe" --alias 2>$null) | Out-String

    if ($fuckAlias) {
        Invoke-Expression $fuckAlias
    }
}


# ==========================================
# PSReadLine - Enhanced Command History
# ==========================================
# Enables command suggestions and better history navigation.
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Search previous commands using arrow keys.
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward


# ==========================================
# Terminal Aliases
# ==========================================
# Use lsd instead of default ls for icons and better output.
Set-Alias ls lsd


# ==========================================
# Notepad Replacement
# ==========================================
# Opens Notepad++ whenever "notepad" command is used.
function notepad {
    & "C:\Program Files\Notepad++\notepad++.exe" $args
}
