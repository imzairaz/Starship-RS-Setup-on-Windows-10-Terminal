# 🚀 Starship RS Setup on Windows 10
*(Windows Terminal + PowerShell 7 + VS Code)*

Clean, simple, and fully working setup.

---

## 🔹 Step 1 – Install Windows Terminal
Download from:
https://github.com/microsoft/terminal/releases

> Windows 11 users can skip default terminal application setup.

---

## 🔹 Step 2 – Install PowerShell 7
Download from:
https://github.com/PowerShell/PowerShell/releases

After installation:
- Open Windows Terminal
- Settings → Startup → Default Profile → **PowerShell 7**
- Default Terminal Application → **Windows Terminal** (Windows 10 only)

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
**Open JSON file** (Ctrl + Shift + ,)

Paste `flavor.json` into:

```json
"schemes": [
  // paste Catppuccin scheme here
]
````

Paste `flavorTheme.json` into:

```json
"themes": [
  // paste Catppuccin theme here
]
```

Save and close.

Then:
Settings → Profiles → Appearance → Color Scheme → select your flavor.

---

## 🔠 Step 6 – Install Nerd Font (Required)

Starship icons need Nerd Fonts.

Download:
[https://www.nerdfonts.com/font-downloads](https://www.nerdfonts.com/font-downloads)

Recommended:

* JetBrainsMono Nerd Font
* FiraCode Nerd Font

Install the font → Restart Terminal →
Settings → Profiles → Appearance → Font Face → Select Nerd Font.

### Benefits of Nerd Fonts

* Git icons
* Branch symbols
* Language logos
* Clean and professional UI
* Perfect Starship experience

---

## 🔐 Step 7 – Fix Execution Policy

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Restart Terminal.

---

## 📦 Step 8 – Install Chocolatey

Run PowerShell (Administrator recommended):

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

## 📝 Step 10 – Setup PowerShell Profile (Safe Method)

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

Restart Windows Terminal and VS Code.

---

## 🎨 Step 11 – Set Starship Presets

List all presets:

```powershell
starship preset
```

Apply one:

```powershell
starship preset <preset-name> > $HOME\.config\starship.toml
```

Examples:

```powershell
starship preset nerd-font-symbols > $HOME\.config\starship.toml
```

```powershell
starship preset pastel-powerline > $HOME\.config\starship.toml
```

```powershell
starship preset minimal > $HOME\.config\starship.toml
```

Reload:

```powershell
. $PROFILE
```

---

## 🧪 Step 12 – Test Everything

```powershell
starship --version
where.exe starship
```

You should see Starship version and its path.

---

## 🛠 Troubleshooting

### ❌ `starship is not recognized`

```powershell
choco install starship -y
```

Restart Terminal & VS Code.

---

### ❌ `choco is not recognized`

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Restart Terminal.

---

### ❌ VS Code Terminal errors at startup

Ensure your profile is safe:

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

### ❌ Script blocked

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Restart terminal.

---

## ✨ Final Result

You now have:

* Windows Terminal
* PowerShell 7
* Catppuccin Theme
* Nerd Font Icons
* Starship Prompt
* Presets System
* Same look in Windows Terminal & VS Code

Fast. Clean. Professional. Developer-grade terminal experience. 💎
