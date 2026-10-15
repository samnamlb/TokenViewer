# TokenViewer

> A brutally simple token counter and visualizer for LLMs with a classic early-2000s Eclipse IDE aesthetic. Works like Notepad, counts like tiktoken.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Web-lightgrey.svg)](#)
[![Zero Dependencies](https://img.shields.io/badge/Dependencies-Zero-brightgreen.svg)](#)

TokenViewer is a zero-dependency, ultra-lightweight application that lets you type or paste text and instantly see how large language models tokenize it. It estimates token counts in real time, highlights token boundaries with distinct colors, and provides actionable heuristics to optimize and shorten your prompts.

---

## Ways to Run

### 1. 🌐 Web & PWA (Zero Install)
- Host on **GitHub Pages** by pushing this repo (auto-deploys via GitHub Actions).
- Open `index.html` in any modern browser.
- **Install as Desktop App:** Click the **Install TokenViewer** icon in your browser's address bar (Chrome / Edge) to add it directly to your Windows Start Menu and Desktop. Works 100% offline via Service Worker.

### 2. ⚡ Standalone Native Executable (`TokenViewer.exe`)
- Download `TokenViewer.exe` from [Releases](https://github.com/your-username/TokenViewer/releases).
- Only **~97 KB** (embeds native hi-res icon, zero console window flash).
- Runs in dedicated frameless app mode using Windows' built-in browser engine.

### 3. 📦 Portable ZIP
- Download `TokenViewer-Portable.zip`.
- Extract anywhere and double-click `TokenViewer.exe` or `CreateShortcut.vbs` to add a desktop shortcut.

### 4. 💿 Windows Installer (`TokenViewer-Setup.exe`)
- Run the Inno Setup wizard to install TokenViewer into `%LOCALAPPDATA%` or `Program Files`.
- Automatically sets up Start Menu and Desktop shortcuts and clean uninstall support.

---

## Features

- **Classic Eclipse IDE Interface** — Early-2000s professional suite aesthetic: 3D beveled borders, Tahoma UI font, Courier New text editor, sunken status bar fields, and zero emojis.
- **Real-Time Token Estimation** — Live token counts update instantly as you type.
- **Token Highlighting** — Toggle alternating background colors to visualize exact token boundaries (`Ctrl+H`).
- **Token Analysis Panel** — Detailed breakdown with 3 views (`Ctrl+B`):
  - **Token List:** Enumerates every token with its index, text snippet, and UTF-8 byte length.
  - **Token Map:** High-density visual map where each cell represents a token sized by byte length.
  - **Tips & Cost:** Heuristics for shortening prompts and estimated API costs.
- **Model Selector** — Compare estimates across GPT-4o (`o200k_base`), GPT-4 / 3.5 (`cl100k_base`), GPT-3 (`p50k_base`), and Claude 3.5+.
- **File Management** — New (`Ctrl+N`), Open (`Ctrl+O`), Save (`Ctrl+S`), and native drag-and-drop support.
- **Dark / Light Mode** — Subdued high-contrast themes for daytime or night-time writing.

---

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl+N` | New file |
| `Ctrl+O` | Open file |
| `Ctrl+S` | Save file |
| `Ctrl+H` | Toggle token highlighting |
| `Ctrl+B` | Toggle token details panel |

---

## How It Estimates Tokens

LLMs do not read plain text character-by-character. Instead, they partition text into **tokens** using Byte Pair Encoding (BPE).

1. **Pre-tokenization Stage:** Text is segmented using the official GPT regex pattern (`cl100k_base` / `o200k_base`) to isolate contractions, words, numbers, and whitespace.
2. **Sub-token Heuristic:** UTF-8 byte length is calculated per segment and matched against model-specific byte-per-token ratios (typically 3.3–3.8 bytes/token) to estimate sub-word splits.

> *Note:* Designed for fast, immediate feedback while crafting prompts. For strict billing audits, refer to OpenAI's `tiktoken` library.

---

## Repository Structure

```text
TokenViewer/
├── .github/
│   └── workflows/
│       ├── deploy-pages.yml   # Auto-deploys to GitHub Pages on push
│       └── release.yml        # Builds .exe, installer & zip on git tag (v*)
├── TokenViewer.cs             # C# source for lightweight Windows launcher
├── build.bat                  # Local one-click build script (uses csc.exe)
├── installer.iss              # Inno Setup installer script
├── index.html                 # Main application (GitHub Pages entry)
├── TokenViewer.html           # Standalone application file
├── TokenViewer.ico            # Application icon
├── icon-192.png               # PWA icon (192x192)
├── icon-512.png               # PWA icon (512x512)
├── manifest.json              # Web App Manifest for PWA installation
├── sw.js                      # Offline caching Service Worker
├── launch.bat                 # Script launcher fallback
├── CreateShortcut.vbs         # Desktop shortcut generator
├── LICENSE                    # MIT License
└── README.md                  # Project documentation
```

---

## Building Locally

No external SDKs or Node.js required! Windows already includes the C# compiler:

1. Double-click `build.bat` (or run in terminal):
   ```cmd
   build.bat
   ```
2. It compiles `TokenViewer.cs` using Windows' built-in `csc.exe` and links `TokenViewer.ico`.
3. Output: `TokenViewer.exe` (~97 KB).

---

## Publishing to GitHub

1. **Initialize & push to GitHub:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit of TokenViewer"
   git remote add origin https://github.com/<your-username>/TokenViewer.git
   git branch -M main
   git push -u origin main
   ```
2. **Enable GitHub Pages:**
   - In GitHub, go to **Settings** → **Pages** → Source: **GitHub Actions**.
   - Your web app is immediately live at `https://<your-username>.github.io/TokenViewer/`!
3. **Publish a Release:**
   - Push a tag:
     ```bash
     git tag v1.0.0
     git push origin v1.0.0
     ```
   - The `.github/workflows/release.yml` workflow will automatically build `TokenViewer.exe`, compile `TokenViewer-Setup.exe`, create `TokenViewer-Portable.zip`, and publish them directly to your Releases tab.

---

## License

Released under the [MIT License](LICENSE).
