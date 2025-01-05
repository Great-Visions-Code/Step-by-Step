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
        // MARK: Day 1: Chapter 1 - The Beginning
        StoryContent(
            chapterID: 11,
            storyDay: 1,
            chapterTitle: "The Beginning",
            chapterImages: ["survive-day1-beginning-bedroomView-image"],
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
                ChapterDecision(decisionText: "Open the front door to see if this is real", nextChapterID: 9, HPChange: 0, EPChange: 0),
                ChapterDecision(decisionText: "Grab your phone or turn on the TV to seek comfort or answers", nextChapterID: 1, HPChange: 0, EPChange: 0)
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
