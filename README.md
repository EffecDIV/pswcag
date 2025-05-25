# WCAG Accessibility Tools for PrestaShop

> Accessibility-first module for PrestaShop 1.7 – 8.x  
> Fully compliant with WCAG 2.1 AA guidelines — with or without JavaScript.

[![License: GPL v3](https://img.shields.io/badge/license-GPLv3-blue.svg)](LICENSE)
[![PrestaShop Compatibility](https://img.shields.io/badge/PrestaShop-1.7--8.x-brightgreen)](https://www.prestashop.com)

---

## ✨ Overview

**WCAG Accessibility Tools** is a lightweight, production-ready module that adds frontend accessibility features to your PrestaShop store.  
It enables better user experience for people with disabilities, provides full keyboard and screen reader support, and includes a JavaScript-free fallback using `:has()` and `<noscript>`.

---

🎥 https://github.com/EffecDIV/pswcag/releases/tag/release-video

---

## 🎯 Key Features

- 🔠 Font resizing (increase/decrease)
- 🌗 High contrast mode
- 🖤 Grayscale rendering
- 🔗 Underline all links
- 🛑 Stop animations
- 🎹 Keyboard shortcuts (Alt + A / G / C / ArrowUp / ArrowDown / M / L)
- 🚫 Full `noscript` fallback using CSS `:has()` — no JavaScript required
- 📌 Draggable UI with position memory
- 🌐 Multilingual & translatable via PrestaShop’s native tools

---

## 🧱 Technical Details

| Compatibility        | Version           |
|----------------------|-------------------|
| PrestaShop           | 1.7.x – 8.0.x     |
| PHP                  | 7.4+              |
| Browser support      | Chrome 105+, Safari 15.4+, partial Firefox |

> ⚠️ The `noscript` fallback using `:has()` requires modern browser support. Firefox support is partial as of 2025.

---

## 🚀 Installation

### 📦 From Git

```bash
git clone https://github.com/EffecDiv/pswcag.git pswcag
