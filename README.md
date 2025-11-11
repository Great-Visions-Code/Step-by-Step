# 🚶‍♂️ Step By Step — A Fitness-Powered Text RPG for iOS

> Turn your real-world steps into “energy” to survive branching stories. Walk more, go farther in the narrative.

[![UI](https://img.shields.io/badge/Framework-SwiftUI-informational)](#)
[![HealthKit](https://img.shields.io/badge/HealthKit-enabled-informational)](#)

---

## Table of Contents
- [Overview](#overview)
- [Core Features](#core-features)
- [Current Status](#current-status)
- [Get Started (Dev)](#get-started-dev)
- [Architecture](#architecture)
- [Configuration](#configuration)
- [Roadmap](#roadmap)
- [Changelog (high level)](#changelog-high-level)
- [Privacy & Data](#privacy--data)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## Overview

**Step By Step** is a mobile RPG where your daily steps fuel your progress. The more you walk, the more energy you earn to unlock story paths. The flagship story, _**Survive**_, is set during a zombie apocalypse, with choices that affect survival over a tense 5-day narrative. Each day includes critical decisions and branching outcomes, encouraging real-world movement and replayability.

---

## Core Features

### 🧠 Story & Gameplay
- ✅ **Branching narrative** with multiple endings and failure states  
- ✅ **Energy-driven choices** — every decision costs real-world-earned energy  
- ✅ **Checkpointing** and **attempt tracker** for replays  
- ✅ **Story Home View**: resume, restart, view stats and decision history  
- ✅ **Dynamic story progression**: unlock chapters with energy use

### 🏃 Fitness Integration
- ✅ **HealthKit-powered step tracking**  
- ✅ **Step → Energy conversion logic**  
- ✅ **Dashboard** with daily goal progress and energy management  
- ✅ **Streak tracking**, **7-day history**, **year-to-date (YTD)** stats  
- ✅ **7-day moving average overlay** and **week-over-week comparison**  
- ✅ **Achievements system**: max steps, total steps, and distance milestones  
- ✅ **Persistent fitness stat storage** with date-earned badges

### 🏆 Achievements
- ✅ Unlocks for fitness and story milestones  
- ✅ Badge view with date earned  
- ✅ Persistent local tracking  
- ⏳ Planned: multiple endings per story, story-linked unlocks  
- ⏳ Planned: more depth to fitness milestone tiers  

---

## Current Status

### 📍 Story Content
- **Days 1–5** of _Survive_ are fully playable  
- Multiple endings and branching logic currently being developed  

### 🔧 Systems
- ✅ HealthKit integration and permissions  
- ✅ Energy logic and conversion  
- ✅ Full achievement logic, with unlock date  
- ✅ Dashboard + stat visualization (ring, YTD, charts, 7-day avg)  
- ✅ Story flow and state management (resume, restart, history)

### 🎨 UI / Design
- ⏳ UI/UX visuals polished  
- ⏳ Story achievements (by ending and milestones)  
- ⏳ New story branches and alternate endings  

---

## Roadmap

| Feature                              | Status        |
|--------------------------------------|---------------|
| Alternate endings for Survive        | 🔨 In progress |
| Story achievements per branch        | 🧠 Exploring   |
| Fitness tier expansion               | ⚙️ Planned     |
| Settings screen                      | ⚙️ Planned     |
| New story arcs (up to 5 total)       | 💡 Ideation    |

---

## Changelog (High Level)

- **Oct 2025** — Achievements tracking and progress persistence  
- **Sep 2025** — Chart view launched with scroll, avg line, and YTD stats  
- **Aug 2025** — Story logic refactor; state & checkpoint support  
- **Jul 2025** — Dashboard and HealthKit core logic implemented  
- **Jun 2025** — First storyboard concepts of _Survive_ drafted

---

## Privacy & Data

- App requests **HealthKit** permission (step data only)  
- All data stays **on device**  
- No 3rd-party tracking or analytics  
- Future cloud sync will be opt-in only  

---

## Contributing

This is a solo dev project (for now), but feedback, design ideas are always welcome. If you’re into gamified health, narrative design, or just building unique shit, let’s connect!

---

## Contact

- **Portfolio**: [great-visions-code.github.io](https://great-visions-code.github.io)
- **Email**: great.visions@icloud.com
- **GitHub**: [@Great-Visions-Code](https://github.com/Great-Visions-Code)