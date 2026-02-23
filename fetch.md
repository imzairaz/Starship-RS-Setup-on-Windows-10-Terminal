# 🚀 Zai PowerShell Startup Banner
**ASCII Logo + System Specs | Windows 10 • PowerShell 7 • Windows Terminal**

A clean and minimal **PowerShell startup banner** that shows:

- Custom **ASCII “Zai” logo** (left)
- **PC specifications** (right)
- Perfect alignment
- Nerd Font icons
- Works smoothly with **Starship prompt**
- No flicker, no icon stacking

---

## ✨ Preview

```

````

---

## 🧩 Requirements

- **Windows 10**
- **Windows Terminal**
- **PowerShell 7+**
- **Nerd Font** (JetBrainsMono Nerd Font recommended)
- Optional: **Starship prompt**

---

## 🔧 Step 1 — Install Nerd Font (Required)

Download and install a Nerd Font:

👉 https://www.nerdfonts.com/font-downloads

Recommended:
- **JetBrainsMono Nerd Font**
- FiraCode Nerd Font

After installing:
- Restart Windows Terminal
- Go to
  `Settings → Profiles → PowerShell → Appearance`
- Set **Font Face** to your Nerd Font

---

## 🔧 Step 2 — Open PowerShell Profile

Open your PowerShell profile file:

```powershell
notepad $PROFILE
````

If prompted → click **Yes** to create it.

---

## 🔧 Step 3 — Paste the Zai Banner Code

Paste **everything below** into your profile:

```powershell
function Show-ZaiBanner {
    if ($global:ZAI_BANNER_SHOWN) { return }
    $global:ZAI_BANNER_SHOWN = $true

    Clear-Host

    $logo = @(
" ███████████            ███ ",
"░█░░░░░░███            ░░░  ",
"░     ███░    ██████   ████ ",
"     ███     ░░░░░███ ░░███ ",
"    ███       ███████  ░███ ",
"  ████     █ ███░░███  ░███ ",
" ███████████░░████████ █████",
"░░░░░░░░░░░  ░░░░░░░░ ░░░░░ "
)

    # Icons (Nerd Font)
    $I_USER = ""
    $I_HOST = "󰟀"
    $I_OS   = "󰍹"
    $I_SH   = ""
    $I_CPU  = "󰍛"
    $I_RAM  = "󰘚"
    $I_GPU  = "󰢮"
    $I_DISK = "󰋊"
    $I_UP   = "󱫐"

    # Gather info
    try {
        $os  = Get-CimInstance Win32_OperatingSystem
        $cs  = Get-CimInstance Win32_ComputerSystem
        $cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
        $gpu = Get-CimInstance Win32_VideoController | Select-Object -First 1

        $ram = [math]::Round($cs.TotalPhysicalMemory / 1GB, 1)

        $disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
        $diskTotal = [math]::Round($disk.Size / 1GB, 0)
        $diskFree  = [math]::Round($disk.FreeSpace / 1GB, 0)

        $uptime = (Get-Date) - $os.LastBootUpTime
        $uptimeStr = "{0}d {1}h {2}m" -f $uptime.Days, $uptime.Hours, $uptime.Minutes

        $rows = @(
            @{ i=$I_USER; l="User";   v=$env:USERNAME },
            @{ i=$I_HOST; l="Host";   v=$env:COMPUTERNAME },
          # @{ i=$I_OS;   l="OS";     v="$($os.Caption) ($($os.OSArchitecture))" },
			@{ i=$I_OS;   l="OS";     v="Win 10 LTSC (64-bit)" },
            @{ i=$I_SH;   l="Shell";  v="PowerShell $($PSVersionTable.PSVersion)" },
            @{ i=$I_CPU;  l="CPU";    v=($cpu.Name -replace "\s+", " ").Trim() },
            @{ i=$I_RAM;  l="RAM";    v="$ram GB" },
            @{ i=$I_GPU;  l="GPU";    v=($gpu.Name -replace "\s+", " ").Trim() },
            @{ i=$I_DISK; l="Disk";   v="C: $diskTotal GB / $diskFree GB free" },
            @{ i=$I_UP;   l="Uptime"; v=$uptimeStr }
        )
    } catch {
        $rows = @(@{ i="!"; l="Info"; v="Unavailable" })
    }

    # Layout
    $leftWidth  = ($logo | Measure-Object Length -Maximum).Maximum + 2
    $labelWidth = 7
    $maxLines   = [Math]::Max($logo.Count, $rows.Count)

    for ($n = 0; $n -lt $maxLines; $n++) {
        $left = if ($n -lt $logo.Count) { $logo[$n] } else { "" }
        Write-Host ($left.PadRight($leftWidth)) -NoNewline -ForegroundColor Gray

        if ($n -lt $rows.Count) {
            $icon  = $rows[$n].i
            $label = $rows[$n].l.PadRight($labelWidth)
            $value = $rows[$n].v

            Write-Host "  $icon  " -NoNewline -ForegroundColor Cyan
            Write-Host "$label"     -NoNewline -ForegroundColor Cyan
            Write-Host " : "        -NoNewline -ForegroundColor DarkGray
            Write-Host "$value"     -ForegroundColor White
        } else {
            Write-Host ""
        }
    }

    Write-Host ""
}

Show-ZaiBanner

```

---

## ⭐ Step 4 — Keep Starship Prompt Working (Optional)

If you use **Starship**, keep this **below** the banner:

```powershell
if (Get-Command starship -ErrorAction SilentlyContinue) {
  Invoke-Expression (&starship init powershell)
}
```

---

## 🔁 Step 5 — Reload Profile

```powershell
. $PROFILE
```

Open a **new Windows Terminal tab** to see the banner.

---

## 🛠 Troubleshooting

### ❌ ASCII blocks not showing

* Ensure profile file is saved as **UTF-8**
* Ensure terminal font is a **Nerd Font**

### ❌ Icons look like squares

* Nerd Font not applied
* Restart Windows Terminal after changing font

### ❌ Banner repeats

* The script prevents double printing using a global flag

---

## 🧠 Notes

* This banner runs **only at shell startup**
* Safe for **VS Code**, **Windows Terminal**, and **PowerShell 7**
* Clean, minimal, and fast

---

## 💎 Result

You now have a **professional, personalized terminal** with:

* ASCII branding
* Live system info
* Clean layout
* Starship compatibility

Enjoy your **Zai-grade PowerShell setup** 🚀
