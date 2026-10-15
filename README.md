
<p align="center">
  <img src="TokenViewer.ico" alt="TokenViewer logo" width="128">
</p>

<h3 align="center">TokenViewer</h3>

<p align="center">
  A brutally simple token counter and visualizer for LLMs.
  <br>
  Works like Notepad.
</p>

<p align="center">
  <a href="https://samnamlb.github.io/TokenViewer/">
    <img src="https://img.shields.io/badge/Demo-Live%20on%20Web-4A90D9?style=for-the-badge&logo=googlechrome&logoColor=white" alt="Live Demo">
  </a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="MIT License">
  <img src="https://img.shields.io/badge/Platform-Windows%20%7C%20Web-lightgrey.svg" alt="Windows and Web">
  <img src="https://img.shields.io/badge/Dependencies-Zero-brightgreen.svg" alt="Zero Dependencies">
</p>
---

## Live Demo

Run TokenViewer directly in your browser without installing anything:

--> **[https://samnamlb.github.io/TokenViewer/](https://samnamlb.github.io/TokenViewer/)**

---

## Features

- **Real-Time Token Estimation** — Live token counts as you type.
- **Token Highlighting** — Highlights rainbow style to visualize exact token (`Ctrl+H`).
- **Token Analysis Panel** — (`Ctrl+B`):
  - **Token List:** Enumerates every token with its index, text snippet, and UTF-8 byte length.
  - **Token Map:** Visual map where each cell represents a token sized by byte length.
  - **Tips & Cost:** Heuristics for shortening prompts and estimated API costs.
- **Model Selector** — Compare estimates across GPT-4o (`o200k_base`), GPT-4 / 3.5 (`cl100k_base`), GPT-3 (`p50k_base`), and Claude 3.5+.
- **Dark / Light Mode** — Themes for daytime or night-time writing.

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

LLMs do not read plain text character-by-character. Instead, they split text into **tokens** using Byte Pair Encoding (BPE).

1. **Pre-tokenization Stage:** Text is segmented using the official GPT regex pattern (`cl100k_base` / `o200k_base`) to isolate contractions, words, numbers, and whitespace.
2. **Sub-token Heuristic:** UTF-8 byte length is calculated per segment and matched against model-specific byte-per-token ratios (typically 3.3–3.8 bytes/token) to estimate sub-word splits.

> *Note:* Designed for fast, immediate feedback while crafting prompts. For strict billing audits, refer to OpenAI's `tiktoken` library.


## License

Released under the [MIT License](LICENSE).
