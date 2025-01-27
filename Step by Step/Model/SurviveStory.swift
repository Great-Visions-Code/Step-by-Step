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
        // MARK: DAY 1 - chapterIDs: 11-16
        
        // MARK: ChapterID: 11 - DAY 1
        StoryContent(
            chapterID: 11,
            storyDay: 1,
            chapterTitle: "DAY 1",
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
        // MARK: ChapterID: 12 - EMERGENCY ALERT
        StoryContent(
            chapterID: 12,
            storyDay: 1,
            chapterTitle: "EMERGENCY ALERT",
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
        // MARK: ChapterID: 14 - Stay Low
        StoryContent(
            chapterID: 14,
            storyDay: 1,
            chapterTitle: "Stay Low",
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
        // MARK: ChapterID: 16 - Night
        StoryContent(
            chapterID: 16,
            storyDay: 1,
            chapterTitle: "Night",
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
                                HPChange: +1, EPChange: -2)
            ],
            isFinalChapter: false
        ),
        
        // MARK: DAY 2 - chapterIDs: 21-25

        // MARK: ChapterID: 21 - DAY 2
        StoryContent(
            chapterID: 21,
            storyDay: 2,
            chapterTitle: "DAY 2",
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
                                HPChange: 0, EPChange: -2), // Death Chapter
                ChapterDecision(decisionText: "Go the other way", nextChapterID: 22,
                                HPChange: 0, EPChange: -2)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 22 - Transportation
        StoryContent(
            chapterID: 22,
            storyDay: 2,
            chapterTitle: "Transportation",
            chapterImages: ["survive-22-bike-image"],
            chapterText: """
                    You crouch behind the doorway, gripping the broomstick tightly, your heart hammering in your chest. Outside, the group huddles in the yard, whispering urgently, their heads darting in every direction. They move with precision, their actions deliberate. They’ve done this before.

                    For a moment, you consider stepping out, joining them. Safety in numbers, right?

                    But the thought evaporates as quickly as it forms. Groups are loud, visible, easy to spot. In movies and TV shows, they’re always the first to be targeted—too many voices, too much movement, too many chances for mistakes. And with a group comes trust issues, conflict, and the danger of being dragged into their mistakes.

                    No. Alone is better. You can move quietly, quickly. There’s only you to worry about, no one to hold you back.

                    Your grip on the broomstick tightens as you step away from the door, retreating further into the house. A floorboard creaks beneath your weight, freezing you in place. Your breath catches, your pulse pounding in your ears. But the group outside doesn’t notice.

                    When you reach the back door, you ease it open, the rusted hinges groaning softly. The air outside is thick with the smell of damp earth and smoke. You glance back toward the group one last time, your stomach twisting with uncertainty, before slipping into the backyard. Whatever they’re planning, it’s not your problem.
                
                The morning is unnervingly quiet.

                    You tread carefully, each step deliberate. Your body aches from the strain of yesterday’s ordeal, but the need to find a way out keeps you moving.

                    The world around you bears the scars of destruction. Cars are abandoned at odd angles, some with their doors flung open, their interiors ransacked. Clothes, bags, and forgotten possessions lie scattered across lawns. You pass a broken stroller tipped over in the gutter, its contents spilled onto the street.

                    Far in the distance, a scream cuts through the silence. Sharp. Panicked. Then, nothing.

                    You see people, just shadows at first. A figure darts between houses, clutching something tightly. Another person crouches behind a car, their eyes wide with terror as they scan their surroundings. None of them seem to notice you—or perhaps they don’t care. Everyone is focused on their own survival.

                    You keep to the edges of the road, avoiding open spaces, every nerve on edge.
                
                    When you round the corner, something catches your eye.

                    A minivan sits parked at the curb, its driver’s side door ajar. Inside, you can see the keys dangling from the ignition. For a moment, hope surges through you.

                    You approach cautiously, your grip tightening on the broomstick as you scan the area. Nothing moves. No sounds. You climb into the driver’s seat, gripping the wheel as you twist the key.

                Nothing happens.

                    The engine doesn’t even sputter. You glance at the fuel gauge—empty. Your stomach sinks as frustration bubbles to the surface. You slam your hand against the steering wheel, letting out a shaky breath.

                    Further down the street, you try another car. And another. Each one is a dead end, the car is either damaged or empty of fuel.
                
                    Your legs ache as you move further along the road, your breath coming faster with every step. The thought of walking miles to find safety feels impossible. But you don’t have a choice.

                That’s when you see it.
                
                Across the street, chained to a fence, is a bicycle.

                    It looks functional. It’s the first thing you’ve seen today that feels like it might actually work.

                But then you notice it.

                    Not far from the bike, crouched low and unbothered by your presence, is an infected. Its hunched frame quivers as it tears into something—or someone. You can’t make out much, but the sounds are unmistakable: wet, tearing, grotesque.

                Your stomach churns as you take in the scene.

                    The bike is a gamble. If you can get to it, unchain it without making noise, you could have a way out—a faster way to cover ground, to find a military checkpoint. But if the creature notices you, there’s no guarantee you’ll make it out unscathed.

                    Your fingers tighten around the broomstick. You weigh the options carefully, your pulse pounding in your ears.
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Inspect the bicycle", nextChapterID: 9,
                                HPChange: 0, EPChange: -2), // Death Chapter
                ChapterDecision(decisionText: "Leave it and continue on foot", nextChapterID: 23,
                                HPChange: 0, EPChange: -2)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 23 - A Desperate Plea
        StoryContent(
            chapterID: 23,
            storyDay: 2,
            chapterTitle: "A Desperate Plea",
            chapterImages: ["survive-23-runAway-image"],
            chapterText: """
                    You walk briskly, your grip on the broomstick tighter than ever. Leaving the bike behind was a hard choice, but the risk wasn’t worth it. Each step feels heavier, your legs burning with every stride. The thought of reaching the military checkpoint keeps you moving.

                    The streets are quieter now, the distant screams fading into an eerie stillness. Shadows play tricks on your mind as you pass abandoned cars and shattered windows. Your stomach gnaws at you, a reminder that you haven’t eaten in over a day.

                    Your eyes dart to the sides of the road, scanning for anything useful—a weapon, food, even a scrap of fabric to patch your fraying nerves. That’s when it happens.
                
                A hand grabs your ankle, cold and sudden.

                    You stumble forward, your heart lurching as you let out a panicked yell. The broomstick falls from your grasp, clattering to the ground.

                    Your mind screams infected! as you scramble to your feet, kicking wildly. You twist around, ready to swing, only to see a pair of wide, terrified eyes staring back at you.

                “Wait! Please—don’t go!”

                    It’s a woman, her face pale and streaked with grime. She’s half-hidden beneath a car, her hands trembling as she reaches out to you.

                    “Help me,” she whispers, her voice breaking. “Please.”

                    You hesitate, your breath coming in short, shallow bursts. She’s human. Not infected. But as you step closer, you see why she can’t stand—her legs are mangled, twisted at unnatural angles. Blood stains her pants, dark and crusted in places, fresh in others.
                
                    “Please,” she says again, clutching a worn backpack to her chest. “I have supplies—food, water. I’ll give it to you. Just don’t leave me here. Please.”

                    Her voice cracks on the last word, and it hits you like a punch to the gut. You glance around, the oppressive silence pressing down on you. Every instinct tells you to keep moving, to leave her behind. She’s dead weight, another risk you can’t afford.

                But she’s alive.

                    You crouch down, your hands trembling as you help pull her out from under the car. She winces, biting back a scream as her legs drag against the pavement.

                    “I can’t walk,” she says, her voice barely above a whisper. “But you can carry me, right? Find something—a cart, a stretcher, anything.”

                    Her eyes are wide, desperate, and you feel the weight of her hope pressing down on you. You scan the area frantically, looking for anything that might help. A wheelbarrow. A flat piece of wood. Anything.
                
                In your rush, you fumble.

                    A bottle falls, clinking against the pavement. The sound feels impossibly loud, echoing in the stillness.

                You freeze.

                    A low growl cuts through the silence, sending a jolt of terror through you. Your eyes dart to the shadows at the edge of the street, where a figure emerges. Then another. And another.

                The infected are coming.

                    The woman grabs your arm, her grip weak but urgent. “Don’t leave me,” she pleads. “Please—I’ll do anything. Just don’t leave me here!”

                    Your heart pounds as you glance between her and the approaching infected. There’s no time to think, only time to act.
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Help the stranger", nextChapterID: 9,
                                HPChange: -1, EPChange: -2), // Death Chapter
                ChapterDecision(decisionText: "Run away alone", nextChapterID: 24,
                                HPChange: -1, EPChange: -2)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 24 - No Hope
        StoryContent(
            chapterID: 24,
            storyDay: 2,
            chapterTitle: "No Hope",
            chapterImages: ["survive-24-lootedStore-image"],
            chapterText: """
                    “I’m sorry,” you whisper, your voice trembling as you take a step back.
                
                    Her eyes widen, and she shakes her head. “No—no! Don’t leave me!”
                
                    But you’re already moving, your legs carrying you away from her cries. The infected swarm her, their snarls mixing with her screams as you run. You don’t look back. You can’t.
                
                    “I’m sorry,” you whisper again, barely loud enough for her to hear. Her eyes, wide with terror, will haunt you forever.

                    Your chest heaves, your breath ragged, and your throat feels like it’s closing in. You tell yourself it was the only way, the only choice that made sense. She was a goner. There was nothing you could have done.

                    But no matter how many times you repeat it, the guilt sits heavy in your chest.
                
                    A few blocks away, the adrenaline finally fades, leaving you drained. You stumble into the shadows between two abandoned cars and collapse, your back against the door of a sedan.

                    The world around you feels impossibly quiet, the distant moans of the infected barely audible now. Your hands shake as you clutch your knees, trying to steady your breathing. The weight of it all presses down on you—the chaos, the hopelessness, the decisions that don’t feel like decisions at all.

                    Tears sting your eyes, and you don’t bother to fight them.

                    “How is this happening?” you whisper to no one. “Where’s the rescue? How am I supposed to survive this?”

                    You pull out your phone, holding onto the faint hope that there’s some update, some sign of salvation. The screen lights up weakly.

                Battery: 1%.

                No signal. No messages. No hope.

                    You let out a bitter laugh, half a sob, and shove the phone back into your pocket. It won’t matter soon enough.
                
                    When the silence stretches too long, you force yourself to stand. The ache in your body feels sharper now, no longer masked by adrenaline. You glance at your hands and notice the scrapes and bruises. Must’ve happened when you stumbled trying to get away. The sight sends a fresh wave of shame through you, but you shove it down.

                You can’t stay here.

                    The road ahead feels endless, each step heavier than the last. When you finally come across a pharmacy, it feels like a mirage. The sign hangs crookedly, one of the front windows shattered. The door is slightly ajar, swaying in the faint breeze.

                    Your stomach growls loudly, a painful reminder of how long it’s been since you’ve eaten. Supplies. Food. Bandages. Anything.

                    You hesitate at the door, peering inside. It’s quiet. Too quiet. The shelves are half-empty, the faint smell of spilled medicine and disinfectant lingering in the air.

                    Your heart races as you grip your broomstick, weighing your options.
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Search the store thoroughly for supplies", nextChapterID: 9,
                                HPChange: +2, EPChange: -3), // Death Chapter
                ChapterDecision(decisionText: "Make a quick entry and grab essentials near the exit", nextChapterID: 25,
                                HPChange: +1, EPChange: -2)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 25 - Shelter
        StoryContent(
            chapterID: 25,
            storyDay: 2,
            chapterTitle: "Shelter",
            chapterImages: ["survive-25-church-image"],
            chapterText: """
                    You slip inside, staying near the door. Your eyes scan the shelves quickly, grabbing anything within reach—an unopened energy drink, a pack of bandages, a protein bar.
                
                    The whole process takes less than a minute, but it feels like an eternity. You back out slowly, your ears straining for any sound. The silence holds, and you exhale in relief as you step back into the open air.
                
                    The sun starts to dip lower on the horizon, casting long shadows across the street as twilight begins to settle in. The orange glow of the sky feels faintly comforting, but you know it won’t last. Darkness is coming, and with it, danger.

                    You clutch your supplies tightly, the edges of the bandage pack digging into your palm as you press forward. Every sound feels amplified in the quiet—your footsteps on the cracked pavement, the distant rustle of leaves, the faint creak of a swaying sign.

                    The back streets feel safer, offering cover from prying eyes or worse. You keep moving, your body running on instinct. As you pass a few houses, you try the doors, but each one is locked tight. You hesitate at one, your hand resting on the doorknob, debating whether to break the glass or move on. The thought of the noise it would make chills you. It’s not worth the risk.
                
                Then, you remember the church.

                    An old building with thick wooden doors, built like a fortress. You’ve passed by it countless times in what now feels like another life—when things were normal, safe. It’s only a few blocks away, but the thought of reaching it feels daunting. What if it’s overrun? What if others had the same idea and it’s not safe anymore?

                    The questions linger as you push forward, your legs growing heavier with each step.
                
                You keep going. Then, you notice it. 

                    A house with the front door ajar, its dark interior visible from where you stand. The sight makes you pause, your heart racing. You step closer, your broomstick raised, every nerve in your body screaming for caution.

                    The house looks untouched—no broken windows, no signs of struggle. Maybe the owners left early when everything started. Or maybe they’re already safe.

                    You stand at the edge of the doorway, peering inside. The furniture is still in place, a pair of shoes by the door, a coat hanging on the rack. It feels almost normal. Almost.

                    You glance down the road toward the church, the shadows growing longer by the second.

                    Your mind races. The house is here, now, and might offer a safe place to rest. But the church… the church was built to withstand time and trouble.
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Take shelter in the house", nextChapterID: 9,
                                HPChange: +1, EPChange: -2), // Death Chapter
                ChapterDecision(decisionText: "Continue to the church", nextChapterID: 31,
                                HPChange: +1, EPChange: -2)
            ],
            isFinalChapter: false
        ),
        
        // MARK: DAY 3 - chapterIDs: 31-34

        // MARK: ChapterID: 31 - DAY 3
        StoryContent(
            chapterID: 31,
            storyDay: 3,
            chapterTitle: "DAY 3",
            chapterImages: ["survive-31-insideChurch-image"],
            chapterText: """
                    You take one last look at the house behind you, its door ajar and its shadowy interior beckoning with uncertainty. But the thought of the church—the sturdy doors, the promise of security—pulls you forward. Your legs ache with every step, your body screaming for rest, but you keep moving.

                    The street ahead is quiet, save for the faint rustle of leaves and the occasional distant noise that makes your heart race. Each shadow feels like it’s watching, waiting.

                    When the church finally comes into view, its silhouette framed by the last light of the day, a wave of relief washes over you. The heavy wooden doors stand closed, their presence a symbol of hope—or a barrier to it.

                    You climb the steps and press your hand against the door, pushing with all your weight. Nothing.

                    Your knees buckle as you collapse against the door, tears streaming down your face. “Please,” you whisper hoarsely, your voice barely audible. “Please. Help me.”

                    For a moment, there’s only silence. Then, the sound of a bolt sliding back.

                    The door creaks open, and a hand reaches out, gripping your arm. “Hurry, come in,” a voice urges.

                    You’re pulled inside, the heavy door slamming shut behind you. The dim light inside reveals a handful of survivors, each keeping to themselves. Some lie curled on the floor, their faces pale and drawn. Others sit quietly, their eyes vacant, staring into the darkness.

                    The air is thick with the smell of sweat and fear. A cough breaks the silence, followed by the shuffle of someone shifting in their makeshift bedding.

                    You find an empty corner and collapse onto the floor, too exhausted to think. The cold stone beneath you feels like a reprieve, and before you can process anything, your eyes close.
                
                    You wake to the sound of hushed voices. The faint light of dawn filters through the high windows, casting long shadows across the room.

                    A group of survivors is gathered in the center of the room, their whispers sharp and urgent. You push yourself up, your body stiff and aching, and make your way over.

                    As you approach, the group glances at you briefly but offers no introductions. Their attention is focused on the conversation.

                    “They’re still evacuating people,” one man insists, his voice low but firm. “I heard it on the news before the power went out. Military checkpoints, evacuating to a safe zone. It’s not far—we can make it if we stick together.”

                    Another survivor shakes his head, his arms crossed tightly. “That was yesterday. You think those checkpoints are still standing? They’re probably overrun or abandoned. We stay here, fortify the place, and keep quiet. That’s how we survive.”

                    The group splits into murmurs, some nodding in agreement, others shaking their heads.

                    “We’ll run out of food,” a woman says sharply. “Staying here is a slow death. We have to try.”

                    “And going out there isn’t?” another snaps. “The streets are crawling with infected. You’d die before you got halfway to the checkpoint.”

                    The argument grows louder, tension thick in the air.

                    Finally, one man steps forward, his expression resolute. “I’m not staying here. I’d rather die trying than waste away hiding in this place. I’m heading for the checkpoint. Who’s coming with me?”

                    His words cut through the noise, and silence falls over the group. He looks around, his gaze landing on you.

                    “Well?” he asks, his voice steady. “What’s it going to be?”
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Stay with the group in the church:", nextChapterID: 9,
                                HPChange: +1, EPChange: 0), // Death Chapter
                ChapterDecision(decisionText: "Join the group heading for the military checkpoint", nextChapterID: 32,
                                HPChange: 0, EPChange: 0)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 32 - The Group
        StoryContent(
            chapterID: 32,
            storyDay: 3,
            chapterTitle: "The Group",
            chapterImages: ["survive-32-group-image"],
            chapterText: """
                    The decision to join the group weighs heavily on your mind as you stand in the dim light of the church. Around you, hushed whispers fill the air as those staying behind speak in quiet tones with loved ones, debating whether they’re making the right choice.

                    “I think it’s safer here,” one woman murmurs to her partner.
                    “And starve to death?” he replies, shaking his head.

                    In the end, only a handful of others decide to join. Their faces are a mix of determination and fear, mirroring your own.
                
                    As you prepare to leave, one of the group members—a man in his early 30s with a rough, no-nonsense demeanor—glances at the broomstick in your hands. He lets out a short laugh.

                    “You planning to watch my back with that?” he says, shaking his head. Before you can respond, he reaches into his pack and pulls out a crowbar. “Here, take this. You’ll need it.”

                    You take it, the cold steel heavier than you expected. It feels solid in your hands, a real weapon for the first time.

                    “Thanks,” you manage to say, your voice uncertain. He nods and turns back to the group.
                
                    The group moves out cautiously, the church doors closing behind you with a final, heavy thud.

                    The streets are quieter than you expected, the chaos of the previous days now replaced with an oppressive stillness. Each step is measured, deliberate, the group weaving through alleyways and side streets to avoid open areas.
                
                Then it happens.

                    An infected appears from nowhere, its guttural snarl breaking the silence. Before you can react, it lunges at you, its hands reaching for your throat.

                    You stumble backward, your heart pounding as you hit the ground. The crowbar slips from your grasp, clattering to the pavement.

                    This is it, you think, your breath caught in your chest.

                    But just as the infected lunges, a sharp crack echoes through the air. You flinch as the creature collapses, its skull caved in.

                    “Get up!” a voice snaps, and you look up to see the same man who gave you the crowbar standing over you, his weapon dripping with blood.

                    He holds out a hand, yanking you to your feet. “Keep your head on straight,” he says gruffly, already turning back to the group.

                    You nod, swallowing hard, and grip the crowbar tightly.
                
                    Time passes, and the group moves cautiously through the streets. The tension is palpable, every shadow a potential threat.

                    Suddenly, another snarl cuts through the air. This time, the infected targets someone else—a younger woman near the back of the group.

                    She screams, struggling as the creature grabs her arm. The rest of the group hesitates, frozen in fear.

                    Your heart pounds as you grip the crowbar, your knuckles white. Images flash through your mind—the man who saved you, the infected collapsing at his feet.

                This time, it’s your turn to decide.
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Step back and let someone else handle it", nextChapterID: 9,
                                HPChange: 0, EPChange: -2), // Death Chapter
                ChapterDecision(decisionText: "Help the group member and kill the infected", nextChapterID: 33,
                                HPChange: -1, EPChange: -4)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 33 - Checkpoint
        StoryContent(
            chapterID: 33,
            storyDay: 3,
            chapterTitle: "Checkpoint",
            chapterImages: ["survive-33-checkpoint-image"],
            chapterText: """
                    Your body moves before your mind can catch up. You raise the crowbar high and swing with all your strength.
                        
                    The first hit connects with the creature’s shoulder, knocking it off balance. It snarls, turning toward you, and you strike again—this time hitting its head.
                        
                    The sound is sickening, and the creature collapses in a heap.
                        
                    The woman stumbles back, her eyes wide. “Thank you,” she whispers, her voice shaking.
                        
                    Your hands tremble as you lower the crowbar, your heart racing. The group stares at you, a mix of surprise and respect in their eyes.
                
                    Your legs feel like they’re moving on autopilot, your grip on the crowbar tight, your knuckles white. The group trudges on, avoiding infected when they can and striking decisively when they must. The air grows heavier as the sun begins to dip below the horizon.
                
                    Rounding a corner onto a side street, you stop in your tracks. Ahead, more groups of survivors are converging, all moving toward a single destination.

                The checkpoint.

                    For a moment, relief washes over you. Soldiers stand behind a makeshift barricade, shouting instructions and gesturing for survivors to form lines. Behind them, military trucks are parked, their engines rumbling faintly. Some survivors are already loaded onto the trucks, their faces tired but hopeful.

                    “Order!” a soldier yells, his voice cutting through the noise. “We’ll check you one at a time! Stay calm and wait your turn!”

                    The chaos is palpable. Survivors shout and bump into each other as they try to find a place in line. Parents clutch their children tightly, their faces etched with desperation. In the back, others push forward, yelling to be taken first.
                
                    You and your group edge closer, trying to find some semblance of order. The tension in the air is suffocating.

                    “This needs to move faster,” someone mutters. “We can’t stay out here much longer. It’s too loud.”

                    You glance around nervously, your grip tightening on the crowbar. Every shout, every frantic movement feels like a beacon for the infected.
                
                    Then you hear it—raised voices from the next line over.

                    “No, I’m not bitten!” a man yells, his voice hoarse and desperate. “It’s a scratch! I got it jumping a fence!”

                    A soldier steps forward, his weapon raised. “Step back!” he commands, his tone sharp.

                    The crowd in that line begins to part, people stumbling over each other to get away from the man. Soldiers surround him, their guns trained on his chest.

                    “Please!” the man cries, his voice cracking. “I have to get to my family! Please don’t do this!”

                    For a moment, everything seems to freeze. Then, in a desperate bid for freedom, the man bolts, running toward one of the trucks.
                
                The shot rings out, deafening and final.

                    The man collapses, his body hitting the ground with a thud.

                Panic erupts.
                
                    The lines dissolve into chaos as survivors scream and push forward, trying to break through the barricades. Soldiers yell, trying to hold their ground, but the crowd is relentless.

                Another shot fires, then another.

                    “Fall back!” a commanding voice shouts. “All units, fall back! Evacuate immediately!”

                    The soldiers retreat, climbing into the trucks as the barricades collapse. The engines roar to life, and the trucks begin to pull away.

                    “Please, don’t leave us!” someone screams, their voice raw with despair.
                
                    You move forward, driven by the faint hope of finding safety. The crowd surges around you, the noise deafening, everything a blur.

                Then you see it.

                    At first, it’s just one. Then two. Then five. The infected are coming.

                    The gunfire has drawn them, their snarls growing louder as they close in. Chaos engulfs the checkpoint as survivors scatter, some trying to climb onto the moving trucks, others running in every direction.

                    Screams fill the air as the first of the infected reach the crowd. A woman falls, her cries cut short as she’s dragged down.

                    “Over here!” someone shouts, but the voice is lost in the din.

                    You turn, your eyes darting wildly. The infected are everywhere, and your group is nowhere to be seen.
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Try to find your group members", nextChapterID: 9,
                                HPChange: -1, EPChange: -4), // Death Chapter
                ChapterDecision(decisionText: "Flee to safety and don’t look back", nextChapterID: 34,
                                HPChange: -1, EPChange: -4)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 34 - The Van
        StoryContent(
            chapterID: 34,
            storyDay: 3,
            chapterTitle: "The Van",
            chapterImages: ["survive-34-van-image"],
            chapterText: """
                    Screams pierce the air as survivors scatter in every direction, shoving, stumbling, falling over one another in blind panic. The infected swarm the checkpoint, their snarls mixing with the sharp crack of gunfire and the desperate cries of the crowd.

                You don’t look back.

                    Your legs move on instinct, each step fueled by pure adrenaline. The weight of the crowbar in your hand feels heavier with every passing second, but you grip it tighter, unwilling to let go of the only thing that feels like protection.

                    The streets blur around you, abandoned cars and debris flashing past as you dart through the chaos. A woman runs to your left, clutching a child in her arms, her face pale with terror. Ahead, a man stumbles and falls, screaming as the infected close in. You can’t stop. You won’t stop.
                
                    Your chest burns, your breath ragged, but you push forward. The infected are everywhere now, their guttural growls growing louder as they close the distance.

                    A sharp turn leads you into an alleyway, the shadows swallowing you whole. You press yourself against the wall, your heart pounding as you try to catch your breath. The distant cries of survivors echo through the night, growing fainter with each step you take away from the checkpoint.

                But the infected are still close. Too close.
                
                    You glance back toward the alley’s mouth, your eyes catching the flicker of movement. A group of infected emerge, their jerky, unnatural motions sending a chill down your spine.

                    Panic grips you as you search for an escape. That’s when you see it—a work van parked at the curb, its sliding door slightly ajar.
                
                    You slam the van door shut, the sound echoing louder than you expected. Your hands shake as you twist the lock into place, your breath coming in short, shallow gasps.

                    The darkness inside feels suffocating, the air thick with the lingering smell of grease and something faintly metallic. You press your back against the cold metal wall, your chest heaving as you try to calm your racing heart.
                
                    Outside, the infected are close. Their guttural growls mix with the occasional shuffle of feet against the pavement. You can’t see them, but you can feel their presence, a suffocating weight pressing down on you from all sides.

                    You reach down, grabbing crumpled newspapers and stray magazines from the van’s floor, your movements frantic. You shove them against the windows, the paper crinkling under your trembling hands. It’s not much, but it’s all you can do.

                    The van rocks slightly as you shift, every noise amplified in the silence. Your body curls into itself, knees to your chest, the crowbar clutched tightly in your hands.
                
                And then it hits you.

                The enormity of it all.

                    The checkpoint, the chaos, the gunshots. The screams of people you couldn’t save. The infected closing in, relentless and unyielding.

                    You can still hear their cries—the survivor pleading for mercy, the desperation in his voice as he tried to reach the truck. The sharp crack of a gunshot. The silence that followed.
                
                    A sob escapes your throat before you can stop it. Your chest tightens, and the tears come, hot and fast, streaming down your face as you bury your head in your arms.

                    “What am I doing?” you whisper, your voice cracking.

                    Your mind races, every thought colliding into the next. How did it come to this? How did everything fall apart so quickly? You think about the faces you’ve seen, the ones you’ve lost, the ones you couldn’t save.

                    It feels hopeless. Everything around you is collapsing, the world crumbling into chaos. You’re just one person, alone in a city that feels like it’s trying to swallow you whole.
                
                    You tighten your grip on the crowbar, the cold steel biting into your palms. Your body trembles with exhaustion, your head pounding from the weight of it all.

                    “I don’t know what I’m doing,” you admit to the darkness. “I don’t know why I’m still going.”

                    The words hang in the air, raw and unfiltered. You don’t have an answer, not really. Survival feels like instinct now—just putting one foot in front of the other because stopping isn’t an option.

                But why?

                    You close your eyes, the faint sound of the infected outside a constant reminder of the danger. Maybe it’s hope, you think. Maybe it’s the faint, desperate hope that somewhere, somehow, there’s safety.

                    Or maybe it’s just fear. Fear of what happens if you stop.
                
                    Your breath comes in shallow gasps, and you press a trembling hand to your mouth, trying to stifle the sound. Time stretches endlessly as you sit in the suffocating silence.
                
                    You know you can’t stay like this forever. The van feels both like a sanctuary and a trap. 
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Move to find another shelter", nextChapterID: 9,
                                HPChange: 0, EPChange: -2), // Death Chapter
                ChapterDecision(decisionText: "Stay hidden", nextChapterID: 41,
                                HPChange: 0, EPChange: -2)
            ],
            isFinalChapter: false
        ),

        // MARK: DAY 4 - chapterIDs: 41-45
        
        // MARK: ChapterID: 41 - DAY 4
        StoryContent(
            chapterID: 41,
            storyDay: 4,
            chapterTitle: "DAY 4",
            chapterImages: [""],
            chapterText: """
                    You’re sitting at the dining table, your family around you. Plates are set with food you can’t quite make out, the smell warm and comforting. Your mom sits across from you, her hair pulled back the way it always was on weekends. Your dad leans against the counter, sipping coffee from his favorite mug.

                Everything feels… normal.

                    You look around, soaking it in. For the first time in days, it feels like you can breathe.

                    But then your mom leans forward, her eyes narrowing slightly. “Are you okay?” she asks.

                You blink, caught off guard.

                “Yeah, just hungry,” you say, forcing a laugh.

                    She studies you for a moment longer before leaning back in her chair. You turn your gaze to your dad, about to make a joke about his coffee obsession, but the words catch in your throat.

                He’s on the ground.
                
                    Your dad crawls toward you, his movements jerky and unnatural. His eyes—once warm and familiar—are clouded, lifeless.

                “Dad?” you whisper, your voice barely audible.

                    Your mom’s chair scrapes against the floor as she stands abruptly, her face twisted in panic. “RUN!” she screams. “RUN!”

                    You stumble backward, your heart racing, the room blurring around you. The table is gone. It’s just you and your dad—or what’s left of him—closing the distance.

                And then you feel it.

                A vibration.
                
                    Your eyes snap open, and the dream evaporates like smoke. The van comes into focus—the cramped, dark space pressing in on you. The smell of grease and old fabric fills your nose, grounding you in the harsh reality.

                    You sit up, your body trembling, and reach for your phone, still clutched tightly in your hand. The screen is black, the battery long since drained.

                But you felt it. You swear you felt it.

                    You press the power button, and to your surprise, the screen flickers to life. Your breath catches as an emergency alert fills the screen:
                
                Emergency Alert:
                “FINAL EVACUATION NOTICE: Seek immediate evacuation. Last rescue efforts departing.
                Active Evacuation Centers: High School Stadium, Main Park.
                Inactive Evacuation Centers: City Hall, DownTown Mall Center.
                Or head to the shoreline for military extraction. Time is critical.”
                
                    The glow of the screen is blinding in the dim light. You scan the words over and over, your mind racing. The evacuation centers. The shoreline. The last rescue efforts.

                And then the screen goes black again.

                    You stare at it, willing it to come back to life, but it doesn’t. The battery is gone. The moment of connection—of hope—is gone.
                
                    You lean back against the van wall, your chest heaving. The dream lingers in your mind, your mother’s voice still ringing in your ears. “Run,” she’d said.

                You know you have to move, but where?

                    The memory of the last checkpoint flashes in your mind. The gunshots. The chaos. The infected swarming.

                    Could this evacuation center be any different? What if it’s just another trap—a false hope that ends in disaster?

                    But what’s the alternative? Staying here? Going it alone? You’ve barely made it this far.
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Try to survive on your own", nextChapterID: 9,
                                HPChange: 0, EPChange: -2), // Death Chapter
                ChapterDecision(decisionText: "Follow the emergency alert to the stadium", nextChapterID: 42,
                                HPChange: 0, EPChange: -2)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 42 - The Fight for Survival
        StoryContent(
            chapterID: 42,
            storyDay: 4,
            chapterTitle: "The Fight for Survival",
            chapterImages: [""],
            chapterText: """
                The decision wasn’t easy.

                    You sat in the van for what felt like an eternity, staring at the black screen of your dead phone, the words of the alert echoing in your mind: “Seek immediate evacuation.”

                    The last checkpoint had been chaos, but what other choice did you have? The evacuation center at the high school stadium was your best shot, maybe your only shot. Staying here meant waiting to die—alone, out of options.

                    With a deep breath, you grabbed the crowbar, opened the van door, and stepped out into the world once more.
                
                    The streets are a graveyard of yesterday’s chaos. Cars sit abandoned, their doors hanging open. Clothes and suitcases are scattered across the pavement, the remnants of people who fled in haste. You step carefully, your eyes scanning every shadow, every flicker of movement.

                    You grip the crowbar tightly in your hand, its weight both comforting and daunting. Every step feels heavier than the last.
                
                    You move quickly, your eyes darting from shadow to shadow. The streets are silent, the kind of silence that makes every small sound feel like an explosion.

                    Ahead, the faint growl you’ve come to dread cuts through the stillness. You freeze, your heart hammering in your chest.

                    Two figures stumble into view. Their movements are jerky, unnatural. Their torn clothes and bloodstained skin tell you all you need to know.

                The infected.

                    They turn toward you, their dead eyes locking onto your every move. For a moment, panic roots you in place. Then, they lunge.
                
                    You swing the crowbar with all your strength, the metal colliding with the first one’s shoulder. The impact sends it stumbling back, but it doesn’t stop. The second one rushes you, its gnarled hands clawing at the air.

                    You twist out of the way, but you’re not fast enough. Its fingers graze your arm, the cold, deathly grip making your stomach lurch.

                    The first infected regains its footing and comes at you again. You swing wildly, the crowbar connecting with its chest. It doesn’t fall. They’re relentless, their snarls filling your ears as they close in.
                
                    You backpedal, your breaths coming in short, sharp gasps. The edge of your foot catches on something—a broken piece of curb or discarded debris—and you lose your balance.

                    You hit the ground hard, the impact knocking the air out of your lungs.

                    Before you can move, one of the infected is on you. Its weight presses down on your chest, its snapping jaws inches from your face.
                
                    You grip the crowbar with both hands, shoving it between you and the creature. Its teeth gnash against the metal, its breath hot and rancid. Your arms tremble as you push back with everything you have.

                    Out of the corner of your eye, you see the second infected crawling toward you, its fingers digging into the pavement as it drags itself closer.
                
                Panic surges through you.

                This is it.

                    You’re pinned, the crowbar your only lifeline. The second infected is almost on you, its guttural snarls growing louder with each passing second.

                    Your arms scream in protest, your muscles burning as you try to keep the first infected at bay. But you can’t hold on forever.
                
                Your mind races.

                    You could try to shove the creature off, scramble to your feet, and flee. But the second infected is so close—would you even make it?

                    Or you could fight. Give it everything you have and hope it’s enough.
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Push off and flee", nextChapterID: 9,
                                HPChange: -3, EPChange: -3), // Death Chapter
                ChapterDecision(decisionText: "Fight to the death", nextChapterID: 43,
                                HPChange: -5, EPChange: -5)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 43 - Rescue
        StoryContent(
            chapterID: 43,
            storyDay: 4,
            chapterTitle: "Rescue",
            chapterImages: [""],
            chapterText: """
                    You swing the crowbar again, your arms screaming in protest. The first infected stumbles, but it doesn’t fall. The second one lunges, and you barely manage to shove it back with the butt of your weapon.

                    Your strength is waning. Each movement feels slower, heavier, like wading through thick mud. The snarls of the infected drown out your pounding heartbeat. Your back presses against the cold pavement, and you know—this is it.

                    Your vision blurs, the world narrowing to the two creatures closing in. You grit your teeth, gripping the crowbar tighter. If this is the end, you won’t go down without a fight.

                    And then, out of nowhere, a deafening crack splits the air.

                    One of the infected jerks back violently, a gaping hole in its head. It collapses in a heap.

                    Before you can process what’s happening, another crack echoes, and the second infected drops.
                
                    You blink, gasping for air as the adrenaline courses through your veins. Your arms tremble, the crowbar slipping from your grip and clattering to the ground.

                “Hey, you’re okay,” a voice says, calm and steady.

                    You look up, your vision still swimming. Figures emerge from the shadows—a group of people, some dressed in military uniforms, others in civilian clothing. They move with purpose, their actions coordinated and efficient.
                
                    One of them kneels beside you, their gloved hand resting on your shoulder. “You’re safe now,” they say, their voice low and reassuring.

                    Another figure raises their rifle, scanning the area for more threats. A pair of motorcycles rev in the distance, the riders honking and shouting to draw infected away.

                    The group works like a machine. Spotters scan the area while others take defensive positions. A man with a scarred face waves to the others, motioning for them to move.

                    “Let’s get you up,” the person beside you says, pulling you to your feet. You stagger, your legs barely holding you. They catch you before you fall, their grip firm.
                
                    “Come on,” they urge, leading you forward. “We’re heading to the stadium. It’s safe there.”

                    Safe. The word feels foreign, almost meaningless after everything you’ve been through. But you don’t resist. You let them guide you, their presence a faint beacon in the suffocating darkness.
                
                    The high school stadium looms ahead, its massive structure a stark contrast to the ruins of the city. The entrances are fortified with rubble, barbed wire, and abandoned vehicles, forming an almost impenetrable barrier.

                    Guards in military uniforms patrol the perimeter, their weapons at the ready. A makeshift sign hangs above the entrance: “EVACUATION CENTER – CHECKPOINT”.

                    As you approach, one of the rescuers raises their hand, signaling the guards. They open a gap in the barricade, and you’re ushered inside.
                
                    You’re led to a side area where all newcomers are gathered. The air smells of antiseptic, and the harsh glare of floodlights illuminates the scene.

                    A figure in a hazmat suit approaches you, their mask obscuring their face. “Stand still,” they say, their voice muffled but authoritative.

                    They begin inspecting you, their hands methodical and precise. A flashlight shines into your eyes, making you wince. They lift your sleeves, checking your arms, then pull up your shirt slightly to inspect your torso.

                “He’s clear,” the person says, stepping back.
                
                    You’re still in a daze, your mind struggling to process everything. Another soldier steps forward, their tone less clinical. “We’re trying to help you. Are you injured? Have you seen anyone infected recently?”

                    Their questions hang in the air, but you hesitate. Memories of the last checkpoint flash in your mind—panic, gunfire, chaos. Can you trust them?
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Refuse to answer", nextChapterID: 9,
                                HPChange: 0, EPChange: -1), // Death Chapter
                ChapterDecision(decisionText: "Trust them", nextChapterID: 44,
                                HPChange: 0, EPChange: -1)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 44 - The Stadium
        StoryContent(
            chapterID: 44,
            storyDay: 4,
            chapterTitle: "The Stadium",
            chapterImages: [""],
            chapterText: """
                    The flashlight clicks off, and the person in the hazmat suit steps back.

                    “He’s clear,” they say to the soldier standing nearby.

                    You let out a breath you didn’t know you were holding, your shoulders sagging under the weight of exhaustion.

                    “Follow me,” the soldier says, their tone firm but not unkind. They place a hand on your shoulder, steering you toward a large opening in the barricade.
                
                    You pass through a makeshift tunnel of debris and fencing, the world around you narrowing into a single path. The hum of voices grows louder with each step, the muffled sound of life pushing back against the chaos outside.

                    The soldier guides you to a large doorway at the base of the stadium—a tunnel where football players used to run onto the field. The air feels heavier here, thick with the mingled scent of sweat, antiseptic, and desperation.

                    “Go ahead,” the soldier says, stepping aside to let you pass.

                    You hesitate for a moment before stepping forward, the dim light of the tunnel giving way to a blinding brightness.
                
                The scene before you is overwhelming.

                    The football field has been transformed into a sprawling emergency evacuation center. Rows of cots stretch across the grass, separated by makeshift dividers. Tents line the sidelines, each one marked with signs: “MEDICAL,” “SUPPLIES,” “WATER DISTRIBUTION.”

                    People are everywhere—sitting, lying down, shuffling from one station to the next. Some clutch backpacks or bags, holding onto what little they have left. Others stare blankly ahead, their faces etched with exhaustion and grief.

                    Children cry softly as their parents try to console them. A man paces near the edge of the field, his hands running through his hair in a frantic rhythm. A woman sits alone on a cot, holding a photo in her trembling hands.

                    The weight of it all presses down on you, your chest tightening as you take it in.
                
                    A soldier approaches, her voice calm but hurried. “Find an open cot and settle in. Food and water are being distributed at the tents near the scoreboard. We’ll leave first thing in the morning.”

                    She starts to turn away, but you call out, your voice barely above a whisper.

                “Evacuation?”

                    The soldier stops, her shoulders tensing. She glances back at you, her expression unreadable. “We’re doing the best we can,” she says softly. “Just… get some rest.”

                With that, she disappears into the crowd.
                
                    You stand there, the noise of the stadium swirling around you. The crowd moves like a slow tide, everyone caught in their own bubble of despair.

                    You feel the weight of the past days settling in—every step, every loss, every close call. But here, for the first time, there’s a flicker of something else. Not hope, exactly. Not yet. But a chance.
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Find a cot and rest", nextChapterID: 9,
                                HPChange: +2, EPChange: -1), // Death Chapter
                ChapterDecision(decisionText: "Wander around the stadium", nextChapterID: 45,
                                HPChange: 0, EPChange: -1)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 45 - The Final Plan
        StoryContent(
            chapterID: 45,
            storyDay: 4,
            chapterTitle: "The Final Plan",
            chapterImages: [""],
            chapterText: """
                    You move through the stadium, weaving between cots, tents, and clusters of survivors. The noise is a low hum—whispers, quiet sobs, the occasional bark of a soldier giving instructions.

                    Everywhere you look, there are signs of exhaustion and despair. A child clings to their mother, their face buried in her shoulder. An older man sits on a folding chair, staring blankly at the ground, his hands gripping a battered duffel bag.

                    A group of soldiers huddle near one of the tents, their voices hushed but urgent. You catch snippets of their conversation—words like “fallback,” “overrun,” and “final orders.”

                    The enormity of it all settles heavily on your chest. This isn’t just survival. It’s the last gasp of a city that’s already gone.
                
                    As you wander, you spot a familiar figure—the soldier who spoke to you earlier. She’s standing near the edge of the field, her gaze fixed on something in the distance.

                    You approach hesitantly, the words spilling out before you can stop them. “Why are we evacuating tomorrow morning? What’s happening?”

                    She turns to you, her face grim. Her eyes, dark and weary, hold a weight you can’t fully understand.

                    “We lost the city,” she says, her voice low. “The defenses didn’t hold. The infected are everywhere now, and there’s no way to push them back.”

                    You feel your stomach drop, the ground beneath you seeming less steady. “But… the evacuation?”

                    She exhales slowly, looking away. “Tomorrow morning is the last attempt. After that…” She hesitates, her jaw tightening. “After that, the city gets bombed. We can’t risk the infection spreading further. This is it.”

                    Her words hit you like a punch to the gut. Bombed. The entire city, wiped out in a last-ditch effort to contain the chaos.

                    She shifts her stance, her gaze softening slightly as she looks back at you. “Get some rest if you can. Or stay awake if you think it’ll keep you safe. Either way, be ready when morning comes.”

                    Her voice drops to a near whisper, filled with quiet urgency. “And don’t miss that truck tomorrow.”

                    With that, she turns and walks away, her figure blending into the crowd of survivors.
                
                    You stand there, the weight of her words pressing down on you. The city is lost. Tomorrow is the last chance.

                    You glance around the field, your body aching, your mind racing. You see a few open cots scattered among the others—an invitation to rest, to recover. But the hum of voices, the occasional cry of a child, and the memory of what happened at the last checkpoint make it impossible to shake the sense of unease.

                Can you really let your guard down, even here?
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Stay awake throughout the night", nextChapterID: 9,
                                HPChange: 0, EPChange: -2), // Death Chapter
                ChapterDecision(decisionText: "Find a cot to sleep", nextChapterID: 51,
                                HPChange: +2, EPChange: -1)
            ],
            isFinalChapter: false
        ),
        
        // MARK: DAY 5 - chapterIDs: 51-5

        // MARK: ChapterID: 51 - Day 5
        StoryContent(
            chapterID: 51,
            storyDay: 5,
            chapterTitle: "",
            chapterImages: [""],
            chapterText: """
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "", nextChapterID: 9,
                                HPChange: 0, EPChange: 0), // Death Chapter
                ChapterDecision(decisionText: "", nextChapterID: 52,
                                HPChange: 0, EPChange: 0)
            ],
            isFinalChapter: false
        ),
        
        // MARK: SPECIAL CHAPTERS
        
        // MARK: Death Chapter
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
        
        // MARK: Survive Chapter
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
