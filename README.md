# 🚀 Starship RS Setup on Windows 10 (Windows Terminal + VS Code)

Clean, simple and 100% working guide.

---

## 🔹 Step 1 – Install Windows Terminal
Download from:
https://github.com/microsoft/terminal/releases

Windows 11 users can skip default terminal setup.

---

## 🔹 Step 2 – Install PowerShell 7
Download from:
https://github.com/PowerShell/PowerShell/releases

Restart Windows Terminal after installation.

Set PowerShell 7 as default:
- Settings → Startup → Default Profile → PowerShell 7
- Default Terminal Application → Windows Terminal (Win10 only)

---

## 🔹 Step 3 – Terminal Appearance
Settings → Profiles → PowerShell → Appearance

- Transparency: `70%`
- Enable Acrylic Material: `ON`

---

## 🎨 Step 4 – Install Catppuccin Theme
Go to:
https://github.com/catppuccin/windows-terminal

Choose one flavor:

| Flavor | Files |
|-------|------|
| Frappe | `frappe.json`, `frappeTheme.json` |
| Latte | `latte.json`, `latteTheme.json` |
| Macchiato | `macchiato.json`, `macchiatoTheme.json` |
| Mocha | `mocha.json`, `mochaTheme.json` |

---

## 🔹 Step 5 – Apply Catppuccin Theme

Open Settings →
`Open JSON file` (Ctrl + Shift + ,)

Paste flavor JSON into:

```json
"schemes": [
  // paste Catppuccin scheme here
]
````

Paste flavorTheme JSON into:

```json
"themes": [
  // paste Catppuccin theme here
]
```

Save and close.

Then:
Settings → Profiles → Appearance → Color scheme → Select your flavor.

---

## 🔠 Step 6 – Install Nerd Font (Required)

Starship icons only work with Nerd Fonts.

Download:
[https://www.nerdfonts.com/font-downloads](https://www.nerdfonts.com/font-downloads)

Recommended:

* JetBrainsMono Nerd Font
* FiraCode Nerd Font

Install font → Restart Terminal →
Settings → Profile → Appearance → Font Face → Select Nerd Font.

### Benefits:

* Git icons
* Branch symbols
* Language icons
* Clean UI
* Professional look

---

## 🔐 Step 7 – Fix Execution Policy

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Restart terminal.

---

## 📦 Step 8 – Install Chocolatey

Run PowerShell (Admin recommended):

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Check:

```powershell
choco --version
```

---

## 🌟 Step 9 – Install Starship

```powershell
choco install starship -y
```

Check:

```powershell
starship --version
```

---

## 📝 Step 10 – Setup PowerShell Profile (Important)

Open profile:

```powershell
notepad $PROFILE
```

Paste:

```powershell
if (Get-Command starship -ErrorAction SilentlyContinue) {
  Invoke-Expression (&starship init powershell)
}
```

Save and close.

Restart Terminal and VS Code.

---

## 🧪 Step 11 – Test

```powershell
starship --version
where.exe starship
```

You should see Starship version and path.

---

## 🛠 Troubleshooting

### 1. `starship is not recognized`

Starship is not installed or PATH not refreshed.

Fix:

```powershell
choco install starship -y
```

Restart Terminal & VS Code.

---

### 2. `choco is not recognized`

Chocolatey not installed.

Fix:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Restart terminal.

---

### 3. VS Code Terminal shows errors

Make sure your profile is safe:

```powershell
notepad $PROFILE
```

Must contain:

```powershell
if (Get-Command starship -ErrorAction SilentlyContinue) {
  Invoke-Expression (&starship init powershell)
}
```

---

### 4. Execution policy blocks scripts

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Restart terminal.

---

## ✨ Result

You now have:

* Windows Terminal
* PowerShell 7
* Catppuccin Theme
* Nerd Font Icons
* Starship Prompt
* Clean + Fast + Modern UI
* Same look in Windows Terminal & VS Code

Perfect terminal for developers 🚀
