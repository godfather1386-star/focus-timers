<div align="center">

# ⏱️ Focus Timers

**Four countdowns. Start one, reset it whenever you like.**

![Windows](https://img.shields.io/badge/Windows-10%20%7C%2011-0078D6?style=flat-square)
![Build](https://img.shields.io/badge/Build-GitHub%20Actions-2088FF?style=flat-square&logo=githubactions&logoColor=white)
![Theme](https://img.shields.io/badge/Theme-Dark-0b1020?style=flat-square)
![Timers](https://img.shields.io/badge/Timers-4-8b9dff?style=flat-square)

[Timers](#-the-four-timers) · [Using a timer](#-using-a-timer) · [Shortcuts](#-keyboard-shortcuts) · [Get the app](#-get-the-app) · [FAQ](#-faq)

</div>

---

## ✨ Overview

Focus Timers is a calm, dark-themed set of four ready-made countdowns for work sprints and breaks. Every timer lives on its own glowing card with a ring that slowly drains as time passes. There is nothing to set up and no account to create: pick a card, press **Start**, and get on with your day.

- 🎯 **Four presets**, from a 45-minute deep-focus block down to a 5-minute breather
- 🔀 **Fully independent cards**: run one, several, or all four at once
- 🔔 **A soft chime** when time is up
- ⌨️ **Keyboard shortcuts** for hands-free control
- 🪟 **Window title countdown**, so you can check the time from the taskbar
- 🌙 **Easy on the eyes**, with a deep midnight palette and a colour for every timer

---

## 🎨 The four timers

| | Timer | Length | Best for | Colour |
|:-:|:--|:-:|:--|:--|
| 💜 | **Deep focus** | 45 min | Long, uninterrupted work blocks | Indigo |
| 🩵 | **Sprint** | 15 min | A quick burst on one task | Teal |
| 🧡 | **Short break** | 10 min | Stretch, snack, reset | Amber |
| 🩷 | **Micro break** | 5 min | A breather between tasks | Rose |

---

## 🕹️ Using a timer

Each card shows the time left in big numbers, a ring that empties as the minutes go by, a small status light, and two buttons.

| State | What you see | Buttons |
|:--|:--|:--|
| **Ready** | Full ring, full time, status says *ready* | **Start** · **Reset** |
| **Running** | Ring draining, light pulsing, status says *running* | **Running** (disabled) · **Reset** |
| **Time's up** | Time shows `00:00`, card glows brighter, status says *time's up* | **Restart** · **Reset** |

A few things worth knowing:

- **Reset any time.** It puts the card straight back to its full time.
- **No pausing.** A running timer keeps going until it finishes or you reset it, so a break is always a real break.
- **Cards don't affect each other.** Starting or resetting one never touches the others.
- **Always on time.** Timers keep counting while the window is in the background or covered by other windows.
- **Quiet when idle.** Nothing is ticking until you start a timer.

> [!TIP]
> With several timers running, the window title shows the one closest to finishing, for example `12:34 • Focus Timers`.

---

## ⌨️ Keyboard shortcuts

Press the number that matches the card's position, left to right. The number row and the numpad both work.

| Keys | Action |
|:-:|:--|
| <kbd>1</kbd> – <kbd>4</kbd> | **Start** that timer, or **restart** it after it has finished |
| <kbd>Shift</kbd> + <kbd>1</kbd> – <kbd>4</kbd> | **Reset** that timer |

| Key | Timer |
|:-:|:--|
| <kbd>1</kbd> | 45 minutes |
| <kbd>2</kbd> | 15 minutes |
| <kbd>3</kbd> | 10 minutes |
| <kbd>4</kbd> | 5 minutes |

---

## 🔔 When time is up

The card lights up, the numbers give a small pulse, the status changes to *time's up*, and a gentle three-note chime plays. The button turns into **Restart**, ready for another round.

> [!NOTE]
> Your browser or app only plays sound after you have clicked or pressed a key once. Starting any timer counts, so the chime will always work.

---

## 🚀 Get the app

There are two ways to use Focus Timers. Pick whichever suits you.

### Option 1 · Open it in your browser

Double-click **`index.html`**. It runs in Chrome, Edge or Firefox with nothing to install.

<details>
<summary><b>Make it feel like a real app (Edge)</b></summary>

<br>

Right-click your desktop, choose **New → Shortcut**, and paste this as the location (change the path to where your file lives):

```text
"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --app="file:///C:/Users/you/Focus/index.html"
```

The timers then open in their own window with no tabs or address bar.

</details>

### Option 2 · Build a Windows `.exe` with GitHub Actions

GitHub can build a ready-to-run `FocusTimers.exe` for you. You don't need to install anything on your own computer.

**1 · Open the Actions tab**
In your repository, click **Actions** at the top.

**2 · Pick the workflow**
Click **Build Windows EXE** in the left-hand list.

**3 · Run it**
Click **Run workflow** on the right, then the green **Run workflow** button.

**4 · Wait for the green tick**
Click the new run to watch it. The first build takes around 5 to 15 minutes, and later ones are quicker.

**5 · Download**
Open the finished run, scroll to **Artifacts** at the bottom, and click **FocusTimers-exe**.

**6 · Unzip and double-click**
Unzip the download and open **`FocusTimers.exe`**. It's portable, so you can keep it anywhere and it needs no installer.

> [!IMPORTANT]
> The first time you open an unsigned app, Windows SmartScreen may say it doesn't recognise the publisher. Click **More info → Run anyway**.
> The app needs the Microsoft Edge WebView2 runtime, which comes with Windows 11 and most up-to-date Windows 10 PCs.

<details>
<summary><b>Optional: sign the app so SmartScreen stays quiet</b></summary>

<br>

If you own a code-signing certificate, add two repository secrets under **Settings → Secrets and variables → Actions**:

| Secret name | What to put in it |
|:--|:--|
| `WINDOWS_PFX_BASE64` | Your certificate (`.pfx`) file, base64-encoded |
| `WINDOWS_PFX_PASSWORD` | The certificate's password |

Run the workflow again and the downloaded `.exe` will be signed. With no secrets, you simply get an unsigned app that works the same way.

</details>

---

## 📁 What's in this repo

```text
├── index.html                    ← the whole app: one file, no dependencies
└── .github/
    └── workflows/
        └── build.yml             ← the "Build Windows EXE" button
```

---

## ❓ FAQ

<details>
<summary><b>The Actions tab says "There are no workflow runs yet."</b></summary>

<br>

That's normal until you start one. Click **Build Windows EXE** in the left-hand list, then **Run workflow**.

</details>

<details>
<summary><b>I can't see "Build Windows EXE" in the list.</b></summary>

<br>

The workflow file isn't in the right place. On the **Code** tab, open `.github`, then `workflows`, and check that `build.yml` is inside.

</details>

<details>
<summary><b>The run shows a red ✗.</b></summary>

<br>

Open the run, click the job named **build**, then click the step with the red ✗. The last few lines of its log say what went wrong.

</details>

<details>
<summary><b>Can I change the timer lengths or colours?</b></summary>

<br>

Yes. Open `index.html` and look for the `CONFIG` list near the top of the script. Each entry holds a length in minutes, a title, a label and its colours. Edit it, save, and run the build again to get a new `.exe`.

</details>

<details>
<summary><b>Will it keep time if my laptop sleeps?</b></summary>

<br>

Yes. Timers follow the real clock, so when your computer wakes up they show the true time left, and any that finished while it slept will show *time's up*.

</details>

---

<div align="center">

Made for focus. Start a timer and get going. ⏱️

</div>
