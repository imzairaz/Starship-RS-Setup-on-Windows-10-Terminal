# ==========================================
# Windows Terminal + PowerShell 7 + Starship
# ==========================================


# ==========================================
# Starship Prompt Configuration
# ==========================================

if (Get-Command starship -ErrorAction SilentlyContinue) {

    Invoke-Expression (&starship init powershell)

    # Add empty line between prompts
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

if (Get-Command zoxide -ErrorAction SilentlyContinue) {

    Invoke-Expression (& {
        zoxide init powershell | Out-String
    })

}


# ==========================================
# FZF - Interactive Folder Picker
# ==========================================

if (Get-Command fzf -ErrorAction SilentlyContinue) {

    function fcd {

        $dir = fzf --walker=dir

        if ($dir) {
            Set-Location $dir
        }

    }

    Set-Alias cdf fcd

}


# ==========================================
# The Fuck - Command Correction Tool
# ==========================================

$env:TF_SHELL = "powershell"
$env:PYTHONWARNINGS = "ignore"

if (Get-Command thefuck -ErrorAction SilentlyContinue) {

    $fuckInit = thefuck --alias | Out-String

    if ($fuckInit) {

        Invoke-Expression $fuckInit

    }

}


# ==========================================
# Python 3.11 Scripts PATH
# ==========================================

$py311Scripts = "$env:LOCALAPPDATA\Programs\Python\Python311\Scripts"

if (Test-Path $py311Scripts) {

    if ($env:PATH -notlike "*$py311Scripts*") {

        $env:PATH = "$py311Scripts;$env:PATH"

    }

}


# ==========================================
# PSReadLine - Better History
# ==========================================

if (Get-Module -ListAvailable PSReadLine) {

    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView

    Set-PSReadLineKeyHandler `
        -Key UpArrow `
        -Function HistorySearchBackward

    Set-PSReadLineKeyHandler `
        -Key DownArrow `
        -Function HistorySearchForward

}


# ==========================================
# LSD - Better ls Command
# ==========================================

if (Get-Command lsd -ErrorAction SilentlyContinue) {

    Remove-Item Alias:ls -Force -ErrorAction SilentlyContinue

    Set-Alias ls lsd

}


# ==========================================
# Notepad++ Replacement
# ==========================================

function notepad {

    & "C:\Program Files\Notepad++\notepad++.exe" $args

}
