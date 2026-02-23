# 🚀 Starship RS Setup on Windows 10
**Windows Terminal + PowerShell 7 + VS Code**

A clean, modern, and fully working **developer-grade terminal setup** using **Starship.rs**, **Catppuccin**, and **Nerd Fonts** on **Windows 10**.

---

## ✅ What You’ll Get

- Windows Terminal
- PowerShell 7 (default shell)
- Catppuccin color theme
- Nerd Font icons
- Starship prompt
- Preset-based customization
- Same look in Windows Terminal & VS Code

Fast • Clean • Professional 💎

---

## 🔹 Step 1 – Install Windows Terminal

Download:
https://github.com/microsoft/terminal/releases

> Windows 11 users can skip default terminal application setup.

---

## 🔹 Step 2 – Install PowerShell 7

Download:
https://github.com/PowerShell/PowerShell/releases

After installation:

- Open **Windows Terminal**
- **Settings → Startup**
  - Default Profile → **PowerShell 7**
  - Default Terminal Application → **Windows Terminal** (Windows 10 only)

---

## 🔹 Step 3 – Terminal Appearance

**Settings → Profiles → PowerShell → Appearance**

- Transparency: `70%`
- Enable Acrylic Material: `ON`

---

## 🎨 Step 4 – Install Catppuccin Theme

Repository:
https://github.com/catppuccin/windows-terminal

Choose a flavor:

| Flavor | Files |
|------|------|
| Frappe | `frappe.json`, `frappeTheme.json` |
| Latte | `latte.json`, `latteTheme.json` |
| Macchiato | `macchiato.json`, `macchiatoTheme.json` |
| Mocha | `mocha.json`, `mochaTheme.json` |

---

## 🔹 Step 5 – Apply Catppuccin Theme

Open Settings → **Open JSON file**  
Shortcut: `Ctrl + Shift + ,`

Paste `flavor.json` inside:

```json
"schemes": [
  // paste Catppuccin scheme here
]
````

Paste `flavorTheme.json` inside:

```json
"themes": [
  // paste Catppuccin theme here
]
```

Save → Close.

Then:

**Settings → Profiles → Appearance → Color Scheme**
Select your Catppuccin flavor.

---

## 🔠 Step 6 – Install Nerd Font (Required)

Starship icons require Nerd Fonts.

Download:
[https://www.nerdfonts.com/font-downloads](https://www.nerdfonts.com/font-downloads)

Recommended:

* JetBrainsMono Nerd Font
* FiraCode Nerd Font

After installing font:

* Restart Windows Terminal
* **Settings → Profiles → Appearance → Font Face**
* Select your Nerd Font

### Why Nerd Fonts?

* Git icons
* Branch symbols
* Language logos
* Clean professional UI
* Proper Starship rendering

---

## 🔐 Step 7 – Fix Execution Policy

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Restart Terminal.

---

## 📦 Step 8 – Install Chocolatey

Run PowerShell (Admin recommended):

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Verify:

```powershell
choco --version
```

---

## 🌟 Step 9 – Install Starship

```powershell
choco install starship -y
```

Verify:

```powershell
starship --version
```

---

## 📝 Step 10 – Setup PowerShell Profile (Safe Method)

Open profile:

```powershell
notepad $PROFILE
```

Add:

```powershell
if (Get-Command starship -ErrorAction SilentlyContinue) {
  Invoke-Expression (&starship init powershell)
}
```

Save → close → restart Terminal.

---

## 🧩 Step 11 – Create Starship Config (IMPORTANT – Windows 10)

On Windows 10, `.config` **does not exist by default**.

### Create `.config` folder

```powershell
mkdir $env:USERPROFILE\.config -Force
```

### Create / edit Starship config

```powershell
notepad $env:USERPROFILE\.config\starship.toml
```

Click **Yes** if prompted.

---

### ✨ Example Minimal Config

```toml
add_newline = true

[character]
success_symbol = "❯"
error_symbol = "❯"

[git_branch]
symbol = " "

[nodejs]
symbol = " "

[python]
symbol = " "
```

Save → close.

Reload:

```powershell
. $PROFILE
```

---

## 🎨 Step 12 – Use Starship Presets

List presets:

```powershell
starship preset
```

Apply a preset:

```powershell
starship preset nerd-font-symbols > $HOME\.config\starship.toml
```

Examples:

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

## 🧪 Step 13 – Test Setup

```powershell
starship --version
where.exe starship
```

---

## 🛠 Troubleshooting

### ❌ `starship` not recognized

```powershell
choco install starship -y
```

Restart Terminal & VS Code.

---

### ❌ `choco` not recognized

Reinstall Chocolatey and restart Terminal.

---

### ❌ VS Code terminal errors

Ensure `$PROFILE` contains only:

```powershell
if (Get-Command starship -ErrorAction SilentlyContinue) {
  Invoke-Expression (&starship init powershell)
}
```

---

### ❌ Scripts blocked

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

## 📍 Windows 10 Paths Reference

| Item               | Path                                                                   |
| ------------------ | ---------------------------------------------------------------------- |
| Starship config    | `C:\Users\<You>\.config\starship.toml`                                 |
| PowerShell profile | `C:\Users\<You>\Documents\PowerShell\Microsoft.PowerShell_profile.ps1` |
| Starship binary    | `C:\ProgramData\chocolatey\bin\starship.exe`                           |

---

## ✨ Final Result

You now have a **modern, themed, icon-rich terminal** with:

* Starship.rs
* Catppuccin colors
* Nerd Font icons
* PowerShell 7
* Windows Terminal
* VS Code terminal sync

Enjoy your **developer-grade Windows terminal** 🚀
