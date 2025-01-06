//
//  SurviveStory.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 1/4/25.
//

import Foundation

/// A static struct containing the "Survive" story data.
///
/// This struct acts as a centralized repository for all chapters, decisions,
/// and metadata related to the "Survive" storyline. It ensures the story's
/// content is separate from logic, improving maintainability and scalability.
struct SurviveStory {
    /// An array of `StoryContent` objects representing the chapters in the "Survive" story.
    static let chapters: [StoryContent] = [
        // MARK: ChapterID: 11 - Awakening
        StoryContent(
            chapterID: 11,
            storyDay: 1,
            chapterTitle: "Awakening",
            chapterImages: ["survive-11-bedroom-image"],
            chapterText: """
                    The sound pulls you violently from sleep—piercing, relentless, and unfamiliar. Not an alarm clock. Not a car horn. It’s something darker, sharper. The kind of noise that makes your chest clench and your pulse race before your mind even has time to process.

                    Your breath catches as you bolt upright, eyes darting around your room. Shadows flicker on the walls, faint and jagged, cast by a dim, pulsing light sneaking through the edges of your curtains. The air feels heavy, electric, like the world outside is holding its breath.

                    That sound—it’s blaring, vibrating through your skull like an air raid siren. You’ve never heard anything like it before, except maybe in disaster movies. But this isn’t a movie. This is your life, your neighborhood. And neighborhoods like yours don’t make noises like this.

                    You swing your legs off the bed, your heart pounding in your chest. The floor feels cold under your feet as you stumble toward the window. Every instinct screams at you to stay put, but the pull of curiosity is too strong. With trembling fingers, you grab the edge of the curtain and peel it back.

                Your stomach lurches.

                    Outside, the world is chaos. Cars are stopped in the middle of the street, some still running, headlights cutting weakly through a haze of smoke. People are running—sprinting, really—screaming as they scatter in all directions. A woman stumbles over a curb, clutching a child in her arms. Behind her, something follows.

                Not someone. Something.

                    The figure lurches after her, its movements wrong, unnatural. Its head jerks sharply, snapping toward her like it’s on a string. It moves faster than you expect, closing the gap. She screams again, the sound piercing through the sirens, before it leaps. You see her fall. You see her stop moving.

                    You stagger back from the window, bile rising in your throat. Your mind races, trying to piece together what you just saw. No. This can’t be real. It doesn’t make sense.

                    The sirens drone on, loud and unrelenting, pressing into your thoughts like a vice. You glance at your nightstand. Your phone sits there, vibrating frantically, its screen lighting up with notifications. Emergency alerts? Texts? A loved one trying to reach you?

                    Your eyes flick to the TV remote on the dresser. Maybe the news will explain this—maybe it’ll tell you it’s some kind of hoax, some kind of terrible mistake.

                    But then your gaze shifts to the door. The pull of the unknown outside, the need to know if this is really happening, feels overwhelming. Maybe if you just open the door, step outside, you’ll see something that makes this all make sense. Or maybe you won’t.

                    Your hands tremble as the weight of the moment presses down on you. What do you do?
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Open the front door to see if this is real", nextChapterID: 9,
                                HPChange: 0, EPChange: 0), // Death Chapter
                ChapterDecision(decisionText: "Grab your phone or turn on the TV to seek comfort or answers", nextChapterID: 12,
                                HPChange: 0, EPChange: 0)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 12 - Warning
        StoryContent(
            chapterID: 12,
            storyDay: 1,
            chapterTitle: "Warning",
            chapterImages: ["survive-12-tvBroadcast-image"],
            chapterText: """
                    Your hands tremble as you snatch up the phone, its incessant buzzing vibrating against your fingertips. The screen is a blur of red and white—notifications flashing faster than you can process. You swipe at the screen, unlocking it as an emergency alert dominates the display:

                    “EMERGENCY ALERT: UNKNOWN OUTBREAK. MILITARY CHECKPOINTS ESTABLISHED. SEEK NEAREST CHECKPOINT OR STAY INDOORS. AVOID CONTACT WITH INFECTED.”

                    Your chest tightens, and your throat feels dry as you stare at the words. Military checkpoints? Outbreak? Infected? This can’t be real.

                    The phone buzzes again, its battery indicator flashing: 4% Battery Remaining. You curse under your breath and toss it aside, your eyes darting toward the TV. You grab the remote with shaking hands, fumbling with the buttons until the screen flickers to life.

                    The news anchor’s voice fills the room, trembling and unsteady:
                    “…military forces have been deployed to the city. Checkpoints are being established at key locations for evacuation and containment. Residents are strongly urged to remain indoors unless a checkpoint is within immediate reach. Repeat: avoid contact with the infected at all costs.”

                    The anchor looks off-camera, his eyes wide with fear, before a shaky video feed takes over the screen. It’s a cell phone recording—a street not unlike your own. Figures stumble into view, their jerky, unnatural movements filling you with a sense of dread. In the background, a military convoy barrels down the road, its rumble like thunder. A soldier waves people toward the vehicles, shouting over the chaos, as one of the figures lunges into the frame.

                    The video cuts off abruptly, replaced by the anchor, his voice cracking. “Stay calm. Stay safe. Help is coming.”

                    The words feel hollow as the TV screen flickers and dies, leaving the room in silence. You’re frozen in place, gripping the remote so tightly your knuckles ache.

                    Your mind races. Checkpoints. Military. Containment. The words swirl in your head, but they don’t feel real. A cold sweat forms on your brow as you glance toward the door. The sirens outside seem louder now, pulsing like a heartbeat.

                    What are you supposed to do? Stay here and wait for help? It feels safer inside… but is it really? What if the infected find you? What if you’re trapped?

                    Your gaze shifts toward the window. The car sits there, motionless, a potential lifeline. If you could get to it, maybe you could reach one of those checkpoints. But how? The thought of stepping outside, of facing whatever’s out there, sends a chill down your spine.

                    You realize your hands are shaking. Every instinct screams for you to act, to do something. You can’t stand here frozen forever.
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Barricade the doors and windows", nextChapterID: 9,
                                HPChange: 0, EPChange: -2), // Death Chapter
                ChapterDecision(decisionText: "Sneak around the house to plan a route to the car", nextChapterID: 1,
                                HPChange: 0, EPChange: -1)
            ],
            isFinalChapter: false
        ),

        // MARK: General: Death Chapter
        StoryContent(
            chapterID: 9,
            storyDay: 0, // This will be dynamically updated in StoryContentViewModel.
            chapterTitle: "Death",
            chapterImages: ["survive-death-image"],
            chapterText: """
                Your decision led to an untimely end. The world is harsh, and survival is not guaranteed.
                """,
            chapterDecisions: [],
            isFinalChapter: true
        ),
        
        // MARK: General: Survive Chapter
        StoryContent(
            chapterID: 1,
            storyDay: 0, // This will be dynamically updated in StoryContentViewModel.
            chapterTitle: "Survive",
            chapterImages: ["survive-ending-image"],
            chapterText: """
                Congratulations! You made it through the chaos and survived against all odds.
                This is the end of your journey.
                """,
            chapterDecisions: [],
            isFinalChapter: true
        )
    ]
}
