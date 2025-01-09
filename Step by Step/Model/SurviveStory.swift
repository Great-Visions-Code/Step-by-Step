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
        // MARK: ChapterID: 11 - The Awakening
        StoryContent(
            chapterID: 11,
            storyDay: 1,
            chapterTitle: "The Awakening",
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
                ChapterDecision(decisionText: "Grab your phone or turn on the TV to seek answers", nextChapterID: 12,
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
                ChapterDecision(decisionText: "Make a run for the car", nextChapterID: 13,
                                HPChange: 0, EPChange: -2)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 13 - Contact
        StoryContent(
            chapterID: 13,
            storyDay: 1,
            chapterTitle: "Contact",
            chapterImages: ["survive-13-runToCar-image"],
            chapterText: """
                    The sirens wail outside, relentless and deafening, as you press your back against the wall, your breath coming in shallow gasps. Every creak of the floor beneath your feet feels like a gunshot in the stillness of the house. You inch toward the living room window, peeling back the blinds just enough to see.

                    Your car sits in the driveway, a lifeline glinting faintly in the smoky morning light. The street beyond it is pure chaos—people screaming, running in every direction, their faces masks of terror. Figures stumble after them, their movements wrong. Twisted. Predatory.

                    Your throat tightens as you let the blinds fall back into place. You glance toward the garage, wondering if there’s something useful there, but the thought of staying inside any longer sends a wave of panic through your chest. No, you can’t wait. You have to move now.

                    With trembling hands, you unlock the door, the deadbolt sliding free with a metallic click that sounds far too loud. You press your ear to the wood, straining to hear beyond the sirens. Footsteps. Shouts. And something else—low, guttural, almost like growling.

                    You swallow hard, gripping the handle. There’s no time to think, only time to act.

                    The door creaks open, and the world outside crashes into you. The sirens are so loud they feel like they’re pressing against your skull. The air is thick with smoke and the unpleasant stench of burning plastic.

                You bolt.

                    Your feet hit the pavement, your heartbeat pounding in your ears. The driveway feels impossibly long as you sprint toward the car, your eyes darting left and right. A man stumbles into the street ahead of you, his face pale and streaked with blood. He doesn’t even seem to notice you as he careens toward the chaos further down the block.

                Your car is so close now, just a few more steps—

                A figure steps into your path.

                    It’s wrong. Its skin is grayish, its movements jerky, its head twitching as if it’s struggling to hold itself upright. Its eyes lock onto yours, hollow and lifeless, but filled with a hunger that freezes you in place.

                    Your stomach twists as it lurches toward you, its mouth opening in a guttural snarl. You stumble backward, your hands trembling as you weigh your options. You can’t let it stop you. You can’t—
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "FIGHT!", nextChapterID: 9,
                                HPChange: -2, EPChange: -3), // Death Chapter
                ChapterDecision(decisionText: "Push and run", nextChapterID: 14,
                                HPChange: -1, EPChange: -3)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 14 - Drive
        StoryContent(
            chapterID: 14,
            storyDay: 1,
            chapterTitle: "Drive",
            chapterImages: ["survive-14-hidingBehindCar-image"],
            chapterText: """
                    The figure stumbles toward you, its gait jerky and unsteady, but its intent chillingly clear. Your breath catches, and panic seizes your chest like a vice. You can’t fight it—not head-on. You have to move, have to get past it.

                    Summoning every ounce of courage, you lunge forward, your foot connecting with its shin. The impact isn’t much, but it’s enough. The figure stumbles back, its arms flailing for balance as a guttural snarl escapes its throat.

                    You don’t wait to see if it recovers. You dart to the side, your legs pumping as you round the car, your breaths ragged and desperate. The air feels thick, suffocating, and every sound—every scream, every siren, every distant crash—presses into your skull like a hammer.

                    Your body moves on instinct, pure survival taking over as you crouch low behind the car. The metal feels cool against your hands, grounding you for a fleeting moment. Your heart pounds so hard it feels like it might burst.

                Then, the scream.

                    It cuts through the chaos like a knife, raw and piercing. You peek around the edge of the car just in time to see a woman burst out of a nearby house, her eyes wide with terror. She freezes when she sees the figure.

                    “Oh my God!” she screams, backing away, her hands trembling as she fumbles for her door.

                    The figure snaps its head toward her, its movements unnaturally fast. The woman’s scream rises in pitch as it lurches after her, closing the distance in seconds. She manages to slip inside her house, slamming the door shut, but the figure doesn’t stop.

                    You watch in horror as it throws itself against the door, again and again, each impact sending splinters flying. The woman’s screams from inside rise to a crescendo, desperate and guttural, until the door gives way.

                She doesn’t stand a chance.

                    You crouch lower, pressing your hand over your mouth to muffle your shallow, panicked breaths. Tears sting your eyes as you hear the screams inside, followed by a terrible silence that seems to stretch forever.

                    Your mind races, your body trembling uncontrollably. You don’t understand what’s happening. You don’t even know what you just saw. All you know is that you’re alive, and that you need to stay that way.

                    Using the moment of distraction, you force yourself to move. Your legs feel like jelly as you crawl around the car, your eyes darting to every shadow, every flicker of motion. When you reach the driver’s side, you lunge for the door, wrenching it open and throwing yourself inside.

                    The sound of the door slamming shut feels deafening, but you don’t care. Your fingers fumble for the lock, pressing the button repeatedly until you hear the satisfying click.

                    You sit there, trembling, staring at the steering wheel as tears spill down your cheeks. You can barely breathe. Your chest feels tight, like a rubber band stretched to its limit. Your mind is a blur of images—the stumbling figure, the woman’s screams, the splintered door.

                    You don’t know what’s happening. You don’t know why. You just know that the world outside has turned into something unrecognizable, something terrifying.

                    For a moment, you let your head fall against the steering wheel, your sobs mixing with the sound of sirens and distant chaos. You have to move. You know you have to move. But your body feels paralyzed, your thoughts a tangled mess.
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Check your phone for information and gather your thoughts", nextChapterID: 9,
                                HPChange: 0, EPChange: -1), // Death Chapter
                ChapterDecision(decisionText: "Put the car in drive and get out of there", nextChapterID: 15,
                                HPChange: 0, EPChange: -1)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 15 - What Happened?
        StoryContent(
            chapterID: 15,
            storyDay: 1,
            chapterTitle: "What Happened?",
            chapterImages: ["survive-15-carCrash-image"],
            chapterText: """
                    Your hands shake as you fumble with the keys, shoving them into the ignition. The engine roars to life, and for a fleeting moment, the sound drowns out the chaos outside. Your foot slams on the gas pedal, and the car lurches forward, tires screeching against the pavement.

                    The neighborhood blurs past as you grip the wheel tightly, weaving through the street. Abandoned cars sit at awkward angles, some with doors flung wide open. Smoke rises in the distance, and faint screams punctuate the wail of the sirens.

                    You hit a parked car with a sickening thud, the impact jolting you in your seat. You curse, your knuckles whitening as you force the car forward, the tires squealing in protest. Your eyes dart to the sky where a formation of military jets roars overhead, their sleek silhouettes cutting through the smoky haze.

                    A helicopter follows, its blades slicing the air with a deafening hum. Below, you spot a convoy of military vehicles—trucks and tanks—abandoned in the middle of the main road, their hulking forms blocking the way forward.

                    You veer sharply to the left, the tires skidding as you take a side street. For a moment, the road feels eerily quiet, the chaos fading into a pocket of stillness. Then, as you slow to navigate a cluster of crashed cars, a blur of motion appears at the corner of your vision.

                Bang.

                    The car rocks as someone slams their fists against the driver’s side window. Your heart leaps into your throat as a man appears, his face wild with desperation.

                    “Let me in! Please!” he yells, his voice raw and hoarse. “You can’t leave me out here!”

                    You freeze, your hands locked on the wheel. The man tugs at the door handle, shaking it violently. It holds, but the sound of his frantic yanking sends a surge of panic through your chest.

                    “Please, I’ll do anything! Don’t leave me!” His voice cracks, but his grip tightens, his eyes wide with fear.

                    Your stomach twists, but you can’t move. The sirens seem distant now, the man’s voice filling the air around you.

                    Then, his demeanor changes. His face hardens, and his shouts turn into snarls. “Open the door!” he screams, slamming his fists against the window. “Let me in, damn it!”

                    The glass cracks under his fists, a spiderweb of fractures spreading across the surface. The sound jolts you into action.

                    You slam your foot on the gas pedal, the car lurching forward. The man doesn’t let go. You feel the car jerk as he’s dragged along the side, his screams turning into a guttural yell of rage.

                    You don’t look. You can’t. Your focus locks on the road ahead, your vision narrowing as adrenaline takes over. The car barrels forward, swerving to avoid another cluster of abandoned vehicles.

                But you’re not looking.

                    The front bumper collides with a twisted light pole, and the car spins out of control. The world tilts violently as the car flips, rolling down a ditch. Glass shatters, and the sound of screeching metal fills your ears.

                Then, silence.
                
                    When your eyes flutter open, everything is hazy. Your head throbs, and the taste of blood lingers on your lips. The car is upside down, the roof crushed inward, shards of glass glinting in the dim light.

                    It takes a moment to realize the light is coming from the setting sun. The sky is painted in hues of deep orange and crimson, the day slipping into night. The sirens are faint now, distant echoes of chaos.

                    You try to move, but every muscle protests. Your fingers fumble at the seatbelt, and with a sharp click, it releases, dropping you onto the car’s roof. The air inside is stifling, tinged with the unpleasant scent of gasoline and smoke.

                    You can’t stay here. Your breath comes in shallow gasps as the reality of your situation sinks in.
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Yell for help", nextChapterID: 9,
                                HPChange: 0, EPChange: -1), // Death Chapter
                ChapterDecision(decisionText: "Try to break out a window and crawl out", nextChapterID: 16,
                                HPChange: -3, EPChange: -2)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 16 - Evening
        StoryContent(
            chapterID: 16,
            storyDay: 1,
            chapterTitle: "Evening",
            chapterImages: ["survive-16-shelter-image"],
            chapterText: """
                The silence is almost worse than the noise.

                    You push against the shattered frame of the back window, shards of glass biting into your palms as you force it open just enough to crawl through. Every movement sends a fresh wave of pain through your body—your ribs ache, and your head throbs with every heartbeat.

                    Sliding out of the car, you collapse onto the damp grass at the bottom of the ditch. For a moment, you lie there, breathing hard, staring up at the bruised sky. The sun is slipping away, dragging the last threads of light with it. Shadows stretch long and jagged, swallowing the world in creeping darkness.

                    The air feels still. Too still. No sirens, no screams. Just the distant hum of the wind, carrying faint traces of smoke.

                    You push yourself to your feet, every joint protesting as you climb out of the ditch. Your legs feel like lead as you stumble forward, moving on sheer instinct. The car is useless now, and without it, the five miles back to your house feel like an eternity.
                
                The neighborhood is a ghost town.

                    The streetlights flicker weakly, casting uneven pools of light on the pavement. Broken glass crunches underfoot as you tread cautiously, every sound amplified in the suffocating silence. Houses stand dark and hollow, their doors hanging open like gaping mouths.

                    A bicycle lies abandoned in the middle of the street, its handlebars twisted. A child’s backpack sits nearby, its contents scattered—books, crayons, a single shoe. You swallow hard, forcing yourself to look away.

                    The deeper you move into the neighborhood, the more the destruction becomes apparent. Burnt-out cars, shattered windows, the faint smell of something unpleasant and metallic lingering in the air. Every so often, you spot movement in the distance—a shadow flitting between houses, a figure standing too still for too long.

                    You freeze each time, your breath caught in your throat, waiting, watching. They don’t come closer. Not yet.
                
                A house comes into view unexpectedly.

                    It’s small and unassuming, set back from the street with overgrown hedges lining the yard. The windows are dark, the front door ajar, but not wide enough to suggest someone’s been through recently.

                    Your eyes scan the perimeter, and that’s when you see it—a bathroom window on the side, slightly open. Just enough to squeeze through.

                    You hesitate. The house looks quiet, abandoned even, but the thought of stepping inside sends a chill down your spine. What if someone—or something—is already there? What if the moment you step inside, the safety you crave turns into a trap?

                    You glance down the street. The shadows feel closer now, the darkness thicker. Your legs ache, your body screaming for rest, but the road ahead feels endless.
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Keep moving through the neighborhood to find rescue", nextChapterID: 9,
                                HPChange: 0, EPChange: -2), // Death Chapter
                ChapterDecision(decisionText: "Break into the house and rest", nextChapterID: 21,
                                HPChange: +2, EPChange: -2)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 21 - A New Day
        StoryContent(
            chapterID: 21,
            storyDay: 2,
            chapterTitle: "A New Day",
            chapterImages: ["survive-21-survivors-image"],
            chapterText: """
                    The first thing you feel is warmth. The sun’s rays stream through the broken blinds, golden and soft, painting streaks of light across the room. For a moment, it feels foreign, almost comforting. You blink awake, your head pounding, your body stiff from an unnatural sleep.

                    The ache in your back is unbearable. You realize you spent the night hunched against the wall, sitting upright, clutching a broomstick like your life depended on it. And maybe it did.

                    You glance around the room, the events of the day before slowly crashing back into your mind. The overturned car. The screams. The endless, oppressive chaos. You’re not even sure how you made it here.

                    The house is quiet, unnaturally so. It doesn’t feel like the kind of quiet you’d find in a peaceful home on a lazy morning. It’s the kind of quiet that feels like the world is holding its breath.

                    You flex your fingers, wincing as you realize how tightly you must have gripped the broomstick all night. You don’t let go, though. It’s your only weapon, crude as it is.

                    Your stomach growls, the sound startling in the stillness. You press your hand against it, trying to ignore the gnawing hunger that’s been growing since yesterday. There’s no food here—at least, not that you’ve found. But finding food means leaving, and leaving means…

                    You don’t let yourself finish the thought. Instead, you grab your phone, pressing the power button with a shaky hand. The screen flickers to life, casting a dim light.

                Battery: 2%.

                    You stare at the number, a sinking feeling in your chest. It feels like a lifeline, fragile and fleeting. You scroll through your notifications, but there’s nothing new—no updates, no texts, no hope. You lock the screen quickly, trying to save what little battery remains.

                    Rising to your feet is harder than it should be. Every muscle in your body protests, screaming from the tension of yesterday’s adrenaline. You shuffle to the nearest window, careful to stay low, and peel back the curtain just enough to see outside.

                The street is eerily still.

                    Cars sit abandoned where they were left, some with doors flung open, others with shattered windshields. The chaos of yesterday has left scars—burnt-out husks of vehicles, overturned trash bins, and the occasional splash of dark stains on the pavement that you try not to think about.

                    But it’s the silence that gets to you. There are no sirens now, no screams, no distant growls. Just the faint rustling of leaves in the breeze and the occasional creak of a house settling.

                    You scan the neighborhood, your eyes darting to every shadow. Then, movement.

                    A group of people emerges from behind a house across the street.

                    There are four of them, hunched low, moving quickly but cautiously. They stay close together, their eyes darting around as if they’re expecting something to jump out at them at any moment.

                Your heart skips a beat. Survivors.

                    For a moment, hope flares in your chest. You’re not alone. Maybe they know what’s going on. Maybe they have supplies. Maybe they can help.

                    But then doubt creeps in, faster than you’d like to admit.

                What if they’re dangerous?

                    The way they move is deliberate, practiced. These aren’t amateurs stumbling through a crisis—they know what they’re doing. And that could be good. Or it could be very, very bad.

                    Your grip tightens on the broomstick, the rough wood biting into your palms. You could try to reach them, call out, hope for the best. Or you could turn the other way, avoid them entirely. Stay hidden.

                    Your eyes drift back to the group as they pause at the edge of a yard, huddling together to discuss something you can’t hear. One of them glances around, their gaze sweeping dangerously close to your hiding spot.

                    Your pulse quickens. Whatever you decide, you need to do it now.
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Try to join up with the group", nextChapterID: 9,
                                HPChange: 0, EPChange: 0), // Death Chapter
                ChapterDecision(decisionText: "Go the other way", nextChapterID: 1,
                                HPChange: 0, EPChange: 0)
            ],
            isFinalChapter: false
        ),

        // MARK: General: Death Chapter
        StoryContent(
            chapterID: 9,
            storyDay: 0, // This will be dynamically updated in StoryContentViewModel.
            chapterTitle: "Death",
            chapterImages: ["survive-1-death-image"],
            chapterText: """
                Your journey ends here—for now.

                    Survival is brutal. Every decision you make shapes your fate, and this time, the path you chose led to an untimely end. The world is harsh, the stakes high, and the outcome final.

                    But this is not the end of your story. Each failure is a lesson, a step closer to mastering the challenges ahead. Every attempt brings new knowledge, new strategies, and a stronger resolve.

                    You have the chance to begin again, to take a new path, and make different choices. Tap the Home icon in the top left corner and select “Start New Story” to start a new attempt.

                    Remember, surviving also means stepping up—literally. Take more steps in the real world to gain the energy you’ll need to progress through the story. Each step brings you closer to your goals, both in-game and in life.

                    Will you make the right decisions this time? Will this be the attempt where you finally survive?

                    The challenge awaits. The choice is yours.                
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
