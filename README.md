<div align="center">
  <img src="Step%20by%20Step/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon.jpg" width="112" alt="Step By Step app icon">

  # Step By Step

  **A fitness-powered interactive story for iPhone**

  Turn real-world movement into energy, then spend that energy to shape your survival story.
</div>

> [!NOTE]
> **Step By Step is an active side project.** It has grown into a promising idea that I plan to explore at a sustainable pace while continuing to strengthen my Swift and iOS development skills. Features, architecture, and visual design may change as I learn, experiment, and refine the experience.

## About

Step By Step combines daily movement with interactive fiction. The app reads walking activity from HealthKit, converts eligible steps into in-game energy, and uses that energy as a resource inside choice-driven stories.

The first playable story, **Survive**, follows a five-day escape through a city overtaken by a zombie outbreak. Decisions affect health, consume energy, and determine whether the player reaches safety or encounters a fatal outcome.

This project began as an experiment in gamified fitness and has become a hands-on environment for exploring SwiftUI architecture, HealthKit, data visualization, state management, persistence, and longer-form product design.

## Development Snapshots

<div align="center">
  <img src="ReadMe%20Images/IMG_4096.jpg" width="205" alt="Step conversion and story selection screen">
  &nbsp;
  <img src="ReadMe%20Images/IMG_4095.jpg" width="205" alt="Survive story home and progress screen">
  &nbsp;
  <img src="ReadMe%20Images/IMG_4093.jpg" width="205" alt="Illustrated Survive chapter screen">
  &nbsp;
  <img src="ReadMe%20Images/IMG_4094.jpg" width="205" alt="Health and energy story decisions">
</div>

> These screenshots are development snapshots. The current interface and story content may differ as the project evolves.

## Features

### Fitness and Energy

- Read-only HealthKit access for step count and walking/running distance
- Configurable daily step goal, with a default of 5,000 steps
- Manual conversion of eligible steps into energy
- Goal-relative conversion: each one-tenth of the daily goal earns one energy point
- Health and energy values constrained to a 0–10 range
- Daily energy reset while preserving player health
- Local persistence for goals, converted steps, health, and energy

### Activity Insights

- Today’s steps, distance, and goal completion
- Current and longest goal streaks
- Best step day
- Seven-day average with previous-week trend comparison
- Scrollable year-to-date step chart
- Goal, personal-best, and average reference lines
- Pull-to-refresh for current HealthKit data

### Achievements

- Milestones for steps completed in a day
- Total-step and total-distance achievements
- Story achievements for completing each day of *Survive*
- Persistent unlock progress and earned dates

### Story and Gameplay

- One playable five-day story with 28 story entries and 50 decisions
- Decisions that modify both health and energy
- A completed success ending and a reusable death/failure state
- Saved chapter progress with resume and restart actions
- Completion percentage and attempt tracking
- Story-specific achievements
- Zoomable in-game town map
- Bundled illustrated scenes for each stage of the journey

## Requirements

- A Mac with Xcode 16 or newer
- An iPhone running iOS 18.0 or newer
- An Apple Developer signing team for device installation
- Health access granted by the user
- Git, if cloning from the command line

The app is designed for iPhone in portrait orientation. It uses Swift 5 language mode and Apple frameworks only; there are no third-party package dependencies.

## Build and Run

1. Clone the repository:

   ```sh
   git clone https://github.com/Great-Visions-Code/Step-by-Step.git
   cd Step-by-Step
   ```

2. Open `Step by Step.xcodeproj` in Xcode.
3. Select the **Step by Step** target.
4. Under **Signing & Capabilities**, choose your development team.
5. If necessary, replace `com.GVDev.StepByStep` with a bundle identifier registered to your team.
6. Select an iPhone running iOS 18 or newer and press **Run**.
7. Approve Health access when prompted.

A physical iPhone provides the most meaningful experience because the core gameplay depends on real HealthKit activity. No prebuilt app or App Store release is included.

## How It Works

1. HealthKit supplies the player’s step count and walking/running distance.
2. The home screen compares those steps with the configured daily goal.
3. Eligible steps can be converted manually into energy.
4. Story decisions spend energy and may also change health.
5. Chapter progress, player resources, goals, and achievements are stored locally.
6. Reaching zero health sends the player to the death chapter; surviving the five-day route reaches the completed ending.

For example, with a 5,000-step goal, every 500 eligible steps can produce one energy point. Energy is capped at 10.

## Project Structure

```text
Step-by-Step/
├── Step by Step.xcodeproj/       # Xcode project and shared scheme
├── Step by Step/
│   ├── Step_by_StepApp.swift     # Application entry point
│   ├── Model/                    # Story, fitness, achievement, and player data
│   ├── ViewModel/                # App state, rules, persistence, and coordination
│   ├── View/                     # SwiftUI screens and reusable components
│   ├── Utilities/                # Branding, styling, metadata, and extensions
│   ├── Resources/                # App icon and illustrated story assets
│   └── Step by Step.entitlements # HealthKit capability
├── ReadMe Images/                # Development screenshots
└── Step-by-Step-Info.plist
```

The app uses an MVVM-style structure:

- Models describe steps, player resources, achievements, stories, chapters, and decisions.
- View models own presentation state, conversion rules, story progression, achievement evaluation, and local persistence.
- `HealthKitManager` isolates HealthKit authorization and queries.
- SwiftUI views compose the dashboard, stats, settings, story home, and gameplay experience.
- `UserDefaults` stores lightweight progress and preferences on the device.

## Privacy and Data

Step By Step requests read access to:

- Step count
- Walking and running distance

The app does not request permission to write Health data. Gameplay state and preferences are stored locally with `UserDefaults`. The current codebase contains no account system, cloud synchronization, advertising, third-party analytics, or external tracking SDK.

An email-based bug-report screen is included, but no report is sent unless the user chooses to compose and send it.

## Project Direction

Because this is a side project and learning platform, there is no fixed public release schedule. Areas with room for future exploration include:

- Deeper branches and additional endings for *Survive*
- New interactive stories
- Expanded achievement tiers and story-linked rewards
- Stronger persistence and save-state modeling
- Automated tests for fitness conversion and story rules
- Accessibility, localization, and interface refinement
- Continued architecture and performance improvements

These are areas of interest rather than promised deliverables. The project will evolve alongside my experience and the ideas that prove most valuable.

## Known Limitations

- *Survive* is currently the only playable story.
- The story has one completed success ending; most alternate choices currently lead forward or to the shared death state.
- The app requires iOS 18 and is configured for portrait-oriented iPhone use.
- HealthKit behavior is best tested on a physical device.
- Persistence uses `UserDefaults`; there is no account or cross-device sync.
- The repository does not currently include an automated test target.
- The interface and balancing remain subject to change.

## Background

Step By Step is designed and developed by Great-Visions Software by Gustavo Vazquez. It reflects an interest in combining movement, game systems, and narrative design while building deeper practical experience with SwiftUI and the Apple platform.

The project’s long-term value is not limited to a finished app. It is also a place to try ambitious ideas, learn from implementation decisions, and grow into a stronger developer one feature at a time.

## License

No license file is currently included in this repository.

## Contact

- **Portfolio:** [great-visions-code.github.io](https://great-visions-code.github.io)
- **Email:** great.visions@icloud.com
- **GitHub:** [@Great-Visions-Code](https://github.com/Great-Visions-Code)
