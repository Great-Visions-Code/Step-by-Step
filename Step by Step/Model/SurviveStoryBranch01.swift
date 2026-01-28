//
//  SurviveStoryBranch01.swift
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
struct SurviveStoryBranch01 {
    /// An array of `StoryContent` objects representing the chapters in the "Survive" story.
    static let chapters: [StoryContent] = [
        
        // MARK: DAY 1
        // chapterIDs: 10101-10601
        
        // MARK: ChapterID: 10101 - DAY 1
        StoryContent(
            chapterID: 10101,
            storyDay: 1,
            chapterTitle: "DAY 1",
            chapterImages: ["survive-11-bedroom-image"],
            chapterText:
                """
                You come awake mid-fall.

                The whole building shudders with a deep, metallic boom from somewhere outside, rattling your windows and picture frames. Your body reacts before your brain does. You flail out of bed, catch nothing but air, and hit the floor hard on your shoulder.

                For a second you just lie there, cheek pressed to the cool wood, ears ringing. The only sound is your fan whirring in the corner.

                Then it hits you: sirens.

                Not one, but layers of them — police, fire, something lower and harsher that you don’t recognize. They rise and fall outside, overlapping like a single, continuous scream.

                You stay low on instinct, heart pounding. The bedroom is a dim gray box; blackout curtains seal most of the light. You fumble for your phone on the nightstand, fingers knocking over a glass before closing around it.

                The screen punches a rectangle of light into the room.

                6:02 A.M.
                Battery: 81%

                Your notification bar is stacked — missed calls, texts, emergency alerts. Your brain focuses on the name at the top.

                MOM (3 missed calls).
                One voicemail. Two texts.

                You don’t hit play yet. You just stare, because for some reason it feels like whatever is in that voicemail is worse than not knowing.

                Another siren screams past outside, closer this time. Somewhere in the building, something heavy slams—a door? A body? You can’t tell.

                You push yourself up, staying on your knees, and grab the remote from the nightstand. The TV across from your bed flickers on, bathing the room in cold blue.

                Every channel you flip to looks wrong.

                One station is running looping footage of streets in some other city — crowds surging, police lines folding. Another shows a hospital corridor, abandoned gurneys lined up like they were dropped mid-shift. One anchor sits alone at a desk, eyes puffy, talking fast over a red “BREAKING” banner.

                You land on a local channel.

                “…repeat, authorities are advising all residents to remain indoors and avoid physical contact with anyone displaying symptoms. Persons affected show extreme aggression and—”

                The feed cuts for a moment, jumps to a shaky clip from a phone. Someone is screaming in a parking lot, trying to push a man away as he snaps at them, teeth bared. There’s blood already on the asphalt.

                A crawl at the bottom of the screen rolls past:

                …no response to pain… possible neuro-viral component… initial outbreak still under investigation. Early evidence suggests a containment breach at a CDC-affiliated research facility outside of—

                They say your town’s name.

                Your stomach drops.

                You mute the TV without meaning to, thumb just slamming the button. The silence makes the sirens outside feel even louder, like they’ve crawled into your apartment.

                You finally tap the voicemail from your mom.

                Her voice bursts into your ear, too loud, too close.

                “Hey, mijo, it’s me. I… I don’t know what’s going on. Your father—” She sucks in a breath. In the background you hear other voices, traffic, something slamming. “We went to the store and this man, he just… he tried to grab your dad, like he was trying to bite him. Your father pushed him off, we got away, it was crazy—he’s got a scratch on his arm and he keeps saying he's fine, but he doesn’t look good.”

                Your mouth goes dry.

                “We’re going to the checkpoint they talked about on the news, over on the edge of town. They said to go there, that the military is there. Please, please stay inside, okay? Lock the doors. Call me when you get this. I love you. Just—just stay safe.”

                The message ends with a rustle and a half-cut curse from your dad in the background.

                You stare at the wall.

                Checkpoint. Scratch. “Doesn’t look good.”

                Your thumb hovers over the call-back button. The signal bars on your phone flicker between three and one. You don’t hit dial yet. You’re not sure what scares you more: them not picking up, or them picking up and sounding worse.

                A fresh emergency alert slides down over the missed calls.

                EMERGENCY ALERT
                All residents: If close, go to evacuation checkpoints, otherwise, shelter in place. Avoid contact with potentially infected individuals. Do not travel unless directed by authorities. Await further instructions.

                A heavy thump echoes from somewhere above or below you — another apartment on one of the other floors. Then a muffled shout. Then nothing.

                Your apartment suddenly feels very small.

                You’re on the third floor. One hallway outside your door, one stairwell at either end. Front door opens into the central corridor; sliding glass doors in the living room open onto your narrow balcony overlooking the street and parking lot.

                If the building is bad, you have maybe three exits: hallway, balcony, or some desperate climb through somebody else’s fire escape. None of that feels real yet. It’s just geometry in your head.

                You realize you’re still in a T-shirt and underwear, bare feet on the cold floor, listening to the sirens and your own breathing.

                You need to see something. Anything. You need more than shaky news footage and your mom’s terrified voice.

                Your eyes flick toward the closed bedroom door. Through it: the short hall, the front door, the peephole, the stairwell beyond.

                Then you think of the living room and the balcony. From there, you could look down without stepping into the hallway at all, get a view of the street, the parking lot, the world outside, while your door is still locked.

                You can’t do both at once. Every second you spend hesitating is another second that something could change.

                You inhale, steadying yourself, phone still warm in your hand and sirens clawing at the glass.

                You have to decide how to face this first moment.

                """,
            chapterDecisions: [
                ChapterDecision(
                    decisionText: "Stay inside and move carefully to the living room, keeping low, to peek out from the balcony and windows before you even think about opening your door.",
                    nextChapterID: 10201,
                    HPChange: 0,
                    EPChange: 0),
                ChapterDecision(
                    decisionText: "Throw on clothes, grab your keys, and rush straight to the front door to look through the peephole and maybe crack it open to see what’s happening in the hallway.",
                    nextChapterID: 9, // Death Chapter
                    HPChange: 0,
                    EPChange: 0)
            ],
            isFinalChapter: false
        ),
        
        // MARK: ChapterID: 10201 - THROUGH THE GLASS
        StoryContent(
            chapterID: 10201,
            storyDay: 1,
            chapterTitle: "THROUGH THE GLASS",
            chapterImages: ["survive-12-tvBroadcast-image"],
            chapterText:
                """
                You slide along the wall, keeping low, every board creak suddenly too loud.

                The living room is a gray, ghosted shape ahead — couch, coffee table, TV, the sliding glass door framed by blackout curtains that don’t quite reach the floor. The sirens are louder here, the sound bleeding in through thin walls and old windows.

                You reach the edge of the curtain and pause, listening.

                Muffled shouts filter up from outside. A car horn blares and gets cut off mid-note. There’s a low, constant roar you can’t quite place—like distant ocean surf, if the ocean screamed.

                You hook two fingers into the curtain and drag it back a few inches.

                Light slashes into the room.

                Your balcony is narrow: concrete slab, dented metal railing, a folding chair, the pot of dead herbs you always mean to replace. Beyond it, the parking lot spreads like a shallow bowl between your building and the next row of apartments. Past that, a strip of trees, the small road, then more quiet streets and houses. To the north, over the rooftops, you can just barely see the ridge where the CDC-related research facility sits — usually just a distant set of buildings you ignore on your commute.

                Not today.

                A column of smoke is rising from that direction, fat and dark against the morning sky.

                You thumb the balcony lock, heart kicking up, and slide the glass door open an inch.

                The world slams into you.

                Sirens wail at full volume. Somewhere nearby, a woman yells a name over and over. A dog barks nonstop. In the distance, the pop of gunfire cracks the air — one shot, then a messy burst of several more.

                Warm air presses in, carrying the smell of exhaust and… something else. Metal. Burnt meat. Under it all, the faint, sticky sweetness of spilled soda from the parking lot below, like the normal world is still trying to leak through.

                You open the door wider and step out.

                From the third floor, you finally see what’s actually happening.

                The parking lot is chaos frozen mid-motion. Three cars have crashed near the exit, as if they all tried to leave at once and chose the same tiny gap. One is nose-first into another’s driver door. The third is pushed sideways against the concrete divider, back wheels still spinning in the air.

                Your car is right there in the middle of it — your little hatchback. Its rear quarter panel completely crumpled, taillight smashed to glittering red dust.

                So that’s what threw you out of bed. The impact must’ve rattled the whole building.

                One of the crashed cars is still running, engine revving pathetically as the driver tries to back out. The wheels just spin against the other bumper. There’s nowhere for them to go; the exit lane is blocked solid.

                People are moving between buildings like panicked animals — heads down, hunched, making short, desperate dashes from doorway to doorway. A man in pajama pants sprints from your building’s front door to the one across the lot, clutching a backpack, slipping on something slick. He slams into the far wall and just stays there, breathing hard, peeking around the corner.

                Up and down the row, curtains twitch. Faces hover in windows for a second and then vanish.

                Above all of it, the sky is busy.

                A helicopter thunders overhead, low enough that the wash of its rotors brushes your face in hot bursts. A second one follows, this one painted with a red cross, banking toward the highway that cuts past town. High above them, two jet fighters streak toward the bay, their engines a rising howl that vibrates in your chest.

                You’re still taking that in when the first gunshot rings out closer.

                It snaps from somewhere behind your building — an alley or the side street. Then another shot. Then three in quick succession.

                The sound is wrong here. Gunfire in movies is clean, distant, almost fake. This is sharp and heavy and present, echoing between the buildings. You flinch, instinctively ducking, fingers tightening on the balcony rail.

                On the small road beyond the trees, a sedan jumps the curb, hits a tree at an angle, and comes to a dead stop. The driver’s door flies open. Someone stumbles out, trips, tries to stand.

                Something else is with them.

                For a heartbeat, you think it’s just another person trying to help. Then you see the way it moves — too fast, too direct, hands grabbing, mouth latching onto the driver’s shoulder. They disappear together behind the tree, but the sound carries: a strangled scream, cut off by a wet, tearing noise.

                You jerk backward, almost tripping over the threshold.

                Your balcony suddenly feels like standing on a stage.

                On the third floor opposite yours, across the lot, a woman is pressed to her own sliding glass door, hands flat on the glass, eyes wide. Behind her, two kids huddle on the couch watching the TV over her shoulder.

                She meets your gaze across the gap.

                For a second, the two of you are just… there. Strangers in matching cages.

                Then another burst of gunfire cracks the air, closer, too close. Down near the alley where your building’s dumpster is. People are shouting words you can’t make out. Something heavy slams into a metal gate.

                Your body moves before your brain decides. You spin, yank the sliding door shut, and haul the lock down hard.

                The sirens dull to a muffled howl again. Your heartbeat doesn’t.

                You stand there, staring at the pale reflection of your own face in the glass, chest rising and falling fast.

                “What am I supposed to do?” you whisper to no one.

                Your phone buzzes.

                You look down. No new call.

                The signal bars are weak.

                You turn Wi-Fi on and off, like that will fix anything. The apartment’s router icon shows as connected, but whatever network is left is barely hanging on. Every time you try to call your mom back, the screen flashes Call Failed and dumps you back to your contacts.

                You open your social apps instead, more habit than plan.

                For a moment, it looks normal: memes, food pics, somebody’s “good morning” post.

                Then the timeline catches up in jagged bursts.

                Shaky videos fill the screen — people live-streaming in their cars, yelling over the sound of sirens: “They’re not human, they’re not—” stream reconnecting. A clip of a guy banging on a locked store door, screaming to be let in while someone inside sobs. A thread from someone claiming it’s all a false flag to grab guns. Another insists it’s radiation. Someone else says demons.

                A local community page is worse: dozens of posts in all caps, a few with photos from just a few streets over. One shows the grocery store you go to, its front doors flung open, carts everywhere. Something moving in the shadows inside.

                Pinned to the top is a reposted notice from the local emergency channel:

                SHELTER IN PLACE IF POSSIBLE. BARRICADE DOORS. AVOID CONTACT WITH ANYONE DISPLAYING SIGNS OF AGGRESSION OR CONFUSION.
                EVACUATION CENTERS ESTABLISHED AT DESIGNATED CHECKPOINTS.
                TRAVEL ONLY IF YOUR LOCATION IS COMPROMISED OR IF YOU ARE WITHIN WALKING DISTANCE OF A CHECKPOINT.

                Under that, someone has tagged the map.

                Your town looks small and fragile on the screen, a web of gray streets between the hills and the bay. The research facility sits to the north, thirty minutes away by car in normal life. Between you and the water lies the high school with its football stadium — one of the designated emergency checkpoints, according to the map. Farther beyond that, hugging the bay, another icon marks a larger evacuation site, a staging area for boats, if the comments are right.

                By car, the stadium is maybe fifteen minutes from your apartment.

                By foot…

                You glance back at the parking lot through the glass.

                Your car is still pinned between the wrecks, blocked in completely. Even if you could get to it, you’re not sure it would start. Even if it did, the exit is clogged with twisted metal, and the main road beyond is filling fast - horns, stopped traffic, angry people trying to go three directions at once.

                On your feed, a video from someone across town auto-plays. They’re filming out their window as cars pile up near an intersection, drivers leaning out to scream at each other. Something darts between the vehicles. The camera jerks as the person filming gasps. You swipe away before you have to see how that ends.

                Your phone pings one last time, a delayed text finally catching up.

                Mom: We’re almost to the checkpoint. It’s crazy. Please don’t drive. They said the roads are blocked. If you come, come on foot only. Love you.

                Your throat tightens.

                You look around your apartment like you’re seeing it for the first time. One bedroom, small kitchen, old couch, sagging bookshelf. Front door with a cheap deadbolt. Thin walls shared with people you barely know.

                You could stay. Lock the door. Barricade it with the dresser. Fill the bathtub. Ration food and hope the worst passes you by.

                Or you could leave. Pack up what you can carry and try to reach the high school stadium on foot, cutting through side streets, staying low, moving fast. The thought makes your stomach flip. It also makes the world feel less like it’s closing in.

                Your eyes land on your backpack by the couch, half-zipped from last weekend. There’s a water bottle in it, maybe some granola bars, a phone charger. You could add more — first aid kit from under the sink, kitchen knife, spare clothes, anything that will fit.

                The sirens keep wailing. Somewhere outside, someone starts to sob, a raw, ugly sound that cuts through the walls.

                You take a slow breath. Whatever you choose, it’s going to define everything that comes next.
                """,
            chapterDecisions: [
                ChapterDecision(
                    decisionText: "Stay in the apartment and commit to sheltering in place: lock and barricade the door, fill whatever containers you can with water, and prepare to ride this out alone.",
                    nextChapterID: 9, // Death Chapter
                    HPChange: 0,
                    EPChange: 0),
                ChapterDecision(
                    decisionText: "Start packing your backpack with food, water, basic first aid, and an improvised weapon so you can attempt to reach the high school stadium evacuation checkpoint on foot.",
                    nextChapterID: 10301,
                    HPChange: 0,
                    EPChange: 0)
            ],
            isFinalChapter: false
        ),
        
        // MARK: ChapterID: 10301 - STAIRWELL
        StoryContent(
            chapterID: 10301,
            storyDay: 1,
            chapterTitle: "STAIRWELL",
            chapterImages: ["survive-13-runToCar-image"],
            chapterText:
                """
                You move fast once you decide.

                You check the backpack - half-full water bottle, bag of chips, two granola bars, and phone charger. You add a roll of paper towels you cram down the side. From the kitchen you yank open drawers — flashlight, lighter, a cheap first-aid kit you always forget you own. Your hand hovers over the knives for a beat before you grab the heaviest one with a solid handle and slide it into the side pocket of the backpack.

                On the way out, you snatch the old broom from behind the fridge, breaking the plastic head off against the counter edge with a crack. Now you’ve got a bare wooden handle — not much, but it’s longer than your arm.

                Your hands are shaking.

                You glance once at the dead TV, the unmade bed, the open closet. It all feels like a hotel room now, somewhere you stayed, not somewhere you live.

                You lock your phone, stuff it in your pocket, and head for the front door.

                The hallway sounds leak through before you even touch the knob — feet pounding on stairs, someone yelling, a baby crying two doors over. You swallow, fingers tight around the broom handle.

                You unlock the deadbolt and ease the door open.

                The building’s corridor is a tunnel of noise. Doors stand open; people you’ve never spoken to in two years of living here are suddenly jammed into the same narrow space — dragging suitcases, clutching backpacks, juggling kids. Someone’s dog trembles under one arm, nails scrabbling against the owner’s chest.

                The air smells like sweat, cheap cologne, and the faint tang of smoke from outside.

                “Hey!” A neighbor from down the hall — Carlos, you think, the guy who always parks a little crooked — spots you. He’s got a backpack on, car keys between his fingers like brass knuckles. “You heading out?”

                You nod because you don’t know what else to do. “I… my parents. They’re going to the high school. The stadium. I’m trying to get there.”

                He jerks his chin toward the stairwell. “Same. They said they’ve got military there, right? Evacuation site. I’m not waiting up here to see what happens.”

                There’s fear in his eyes, but under it, something else: momentum.

                You fall in behind him, broom handle in one hand, the other gripping the railing as you step into the stairwell.

                The stairwell is a concrete well of echoing footsteps and rising panic. People crowd downward, muttering, breathing hard. You pass a couple from the second floor arguing in hushed, frantic Spanish about whether this is “like 2020 but worse” and if they should leave. Someone on the fourth floor is banging on a door, shouting for a name that no one answers.

                You remember 2020: empty shelves, months of isolation, watching numbers climb on a screen. You remember promising yourself that, if it ever happened again, you wouldn’t just sit and wait for the world to decide your fate.

                Whatever this is, it feels bigger. Meaner.

                You do not want to wait alone in a dark apartment while the world outside tears itself apart.

                You keep going down.

                By the time you hit the second floor landing, the noise from outside is clearer — sirens, a helicopter somewhere above, a distant, weird chorus of shouts that don’t sound like normal arguments, more like… pleading.

                “Come on,” Carlos mutters as you push toward the ground floor. “If we get to the cars before everybody—”

                You both know that’s a lie. You saw the pileup from the balcony. But maybe he hasn’t, and you don’t have it in you to be the one to say it.

                On the ground floor landing, the front door looms ahead: narrow glass panels, a metal bar across the middle. Sunlight glares through, flashing off something shiny just beyond it.

                Carlos speeds up.

                As he reaches for the bar, the glass panels shudder, and the door slams inward as a body hits it from the outside.

                A body hits him so hard it lifts him backward off his feet.

                The two of them slam into you like a wave, and suddenly all three of you are tumbling. Your shoulder smashes into the concrete wall. You feel your forearm scrape along the rough edge of a step—hot, sharp fire across your skin. The broom handle clatters away.

                You hit the landing on your back, breath ripped from your lungs.

                For a second you can’t move.

                The thing on top of Carlos is all motion and sound — wet snarls, teeth snapping. You see a flash of its face and your stomach twists. It was a person, but now its eyes are unfocused and wild, pupils blown wide, skin a sticky patchwork of blood and bruises. There’s a jagged bite mark on its hand, flesh ragged and dark around the edges like it’s already rotting.

                Carlos is screaming. High, panicked, animal.

                The infected man, because what else can you call him now? — shoves at Carlos’s forearms, trying to get to his neck, his face, anything soft. Carlos throws his head back, yelling for help that isn’t coming.

                You try to push yourself up and pain flares in your arm where it scraped. When you look down, the skin is torn and bleeding in a thin, stinging line. Concrete burn. You know that. You know that.

                But you also know your dad has a “scratch,” and your mom said he “doesn’t look good.”

                The infected man snaps his head toward you for half a second, nostrils flaring like he can smell your blood. His jaw works, teeth red.

                You freeze.

                For just a heartbeat, the whole world narrows to the stairwell: dim light, your own ragged breathing, Carlos’s choked screams, the wet rasp of that thing’s breath.

                Then it lunges again — not at you, but back down toward Carlos, who’d tried to scoot away.

                You move.

                You slam your shoulder into the struggling heap, shoving the infected man sideways with everything you’ve got. Your scraped arm explodes in pain as it scrapes the concrete again. The three of you spill apart — infected one way, you and Carlos the other.

                The man hits the base of the stairs, skull thudding against metal. He barely reacts.

                He’s on his hands and knees almost instantly, movements jerky, like a puppet whose strings are being yanked too hard.

                You catch a single, awful detail as he lifts his head: part of his cheek is torn open, showing teeth through the side of his face. He doesn’t seem to notice.

                Carlos scrambles to his feet, slipping on the landing. You’re right behind him, palm pressed to your bleeding forearm, vision tunneling.

                “Run!” you shout, voice cracking.

                Carlos turns to bolt for the door.

                He doesn’t make it.

                The infected man launches with a horrible, animal sound, slamming into Carlos’s back and driving him to the floor. Before you can move, before you can even think, the man’s mouth is at Carlos’s throat.

                The bite is fast and savage. There’s a wet crunch, a spray of dark red across the wall, and Carlos’s scream cuts off like someone hit mute.

                You stand frozen, heart hammering against your ribs so hard it hurts. The stairwell tilts around you.

                For a moment, the world seems to slow. Your mind splits in two: one part screaming to turn and run now, the other whispering that you can’t just leave him. That five minutes ago he was a guy complaining about parking and now he’s dying on the floor at your feet.

                The infected man tears another chunk from Carlos’s neck, the sound a wet rip you’ll never forget. Carlos’s legs twitch, then fall still.

                The man’s head lifts slightly, blood slicking his mouth, and you feel his gaze drag back to you.

                You realize you’re still empty-handed.

                The broom handle lies a few steps above you on the stairs. The heavy kitchen knife is zipped into the side pocket of your backpack, which is still on your shoulders. You could grab either — if you move closer. If you get within reach.

                Your scraped arm throbs in time with your heartbeat.

                You are three floors and one courtyard away from any chance of escaping. And you are one decision away from whether you make it that far at all.    
                """,
            chapterDecisions: [
                ChapterDecision(
                    decisionText: "Stand your ground: grab the broom handle or the knife and fight the infected man, trying to drive him back or finish him before he turns on you next.",
                    nextChapterID: 9, // Death Chapter
                    HPChange: 0,
                    EPChange: 0),
                ChapterDecision(
                    decisionText: "Turn and run while he’s still occupied with Carlos’s body, bolting out of the building and onto the street to put as much distance between you and this stairwell as possible.",
                    nextChapterID: 10401,
                    HPChange: 0,
                    EPChange: 0)
            ],
            isFinalChapter: false
        ),
        
        // MARK: ChapterID: 10401 - SIDE STREETS
        StoryContent(
            chapterID: 10401,
            storyDay: 1,
            chapterTitle: "SIDE STREETS",
            chapterImages: ["survive-14-hidingBehindCar-image"],
            chapterText:
                """
                You hit the push bar on the front door and stagger out into daylight.

                The air slaps you in the face—too bright, too loud, too hot. Sirens bounce between buildings. A nearby car alarm shrieks without rhythm. Somewhere behind you, in the stairwell, there’s a wet sound you refuse to name.

                You don’t look back.

                Your feet pound across the cracked concrete toward the parking lot. Your scraped forearm stings, a thin line of blood already drying on the skin. You keep telling yourself it was the concrete, it was the wall, it wasn’t him. You know exactly how that scratch happened, but your brain keeps circling back to your mom’s voicemail: “He’s got a scratch on his arm and he says it’s nothing, but he doesn’t look good.”

                Not the same, you think. Not the same. Not the same.

                The parking lot is worse up close.

                The three-car pileup at the exit is a twisted knot of metal and glass. One car’s front end is crumpled like paper. Another’s airbags hang half-deflated, smeared with blood where someone’s face must have hit them. Your own car is wedged between them, rear panel crushed, front bumper kissing a concrete divider.

                There’s no way you’re driving out of here. Even if the engine turned over, there’s nowhere to go.

                A cluster of neighbors is already out here, weaving between cars. Two are fighting over the same backseat space in an SUV while the driver shouts at both of them to hurry up. A woman tosses a suitcase into the trunk and screams when it bounces back out, zipper breaking and clothes spilling onto the asphalt.

                “Move, move, MOVE!” someone yells.

                The SUV lurches forward before the trunk is fully closed. One of the arguing passengers clings to the half-shut door, feet scrambling for purchase, half in, half out. Another guy grabs the roof rack, hanging on with one hand, a duffel bag dragging behind him.

                You find yourself rooted to the spot as the SUV fishtails toward the exit.

                Instead of slowing at the blocked lane, the driver jerks the wheel hard and guns it over the curb, bouncing into the street. The hanging man nearly loses his grip. You hear him scream something you don’t catch.

                For one crazy second, you think they made it.

                Then a sedan barrels through the intersection from the cross street, horn blaring. There’s no time, no room, no anything.

                The impact is a sideways hammer blow — metal smashing metal with a sickening crunch. The SUV spins, one wheel lifting off the ground. The guy on the roof goes flying, his body tumbling across the pavement like a rag doll. The sound of shattering glass rolls down the block.

                You flinch so hard your backpack digs into your shoulders. Your stomach turns over.

                This isn’t a disaster movie. This is your street.

                Someone shoves past you from behind, muttering an apology you barely hear. People are pouring out of the building now, streaming around the wrecked cars like water finding a new path. There’s no plan, no order — just motion. Running, stumbling, clutching whatever they managed to grab.

                You move because they move.

                Your legs pick a direction and your brain follows a second later. You jog with the crowd down the side of the lot, past the smashed cars, past a crying kid being dragged by the hand. Someone shouts, “High school! Go to the high school!” and others echo it, like if they repeat it enough it will become a guarantee.

                The main road ahead is a mess, cars jammed in both directions, some angled on the sidewalk, others dead in the middle of the lane. People weave between them, yelling, pounding on hoods. A delivery truck has jackknifed across half the street, hazard lights blinking like it’s just another breakdown.

                Instinct kicks in. You don’t want any part of that.

                You veer off with a smaller group that peels away from the jam, cutting between two houses toward a narrower street. Trees line the sidewalks here, their leaves casting broken patterns of shade on the ground. Sprinklers still tick-tick-tick in a front yard, spraying water over an abandoned kid’s bike.

                “Stay off the main roads,” someone ahead says, a man in a denim jacket and baseball cap. “They’re saying it’s gridlock. People getting dragged out of cars. Side streets are safer.”

                Safer feels like a lie, but less exposed sounds right.

                You adjust your grip on the backpack straps and follow.

                The neighborhood looks almost normal in flashes. Lawns. Garden gnomes. Mailboxes. But there are cracks in the picture — literal ones in the pavement, and figurative ones everywhere else. A front door stands wide open, TV blaring news inside to an empty living room. A stroller lies on its side by a driveway, one wheel still spinning. A smear of something dark streaks across a white picket fence at knee height.

                You try not to think about what left it.

                Every few blocks, you hear something that makes everyone stop breathing at once — distant screaming, a gunshot, a shriek that might be an animal or might not. Each time, the group ducks behind parked cars or squeezes behind hedges, trying to become part of the scenery.

                You press your back to a rough brick wall at one point, your scraped arm whining in protest. You count your breaths. In, out. In, out. Your phone feels like a stone in your pocket.

                “Keep moving,” the man in the cap whispers when the noises fade. “We’ve got to keep moving.”

                The sun crawls higher. Time smears. Every house you pass looks like it could be yours if you squint. Same siding, same porch light, different lives evaporated into thin air.

                You don’t have a clear heading, not really. You know the stadium is roughly southeast — ten, maybe twelve blocks in that direction if you cut through the right streets. But you keep following the cap guy and the others because they look like they know where they’re going, and right now “not alone” feels like the bare minimum.

                By the time you hit what you think is the fifth or sixth block from home, the group has swelled to maybe a dozen people. A woman in scrubs. A teenager with headphones still around his neck. An older man in slippers and a bathrobe, clutching a leash with no dog at the end of it.

                You’re catching your breath behind a tall hedge, peeking toward a slightly wider cross street, when you hear raised voices.

                Another cluster of people is there, ten, maybe fifteen — huddled near a cul-de-sac entrance. Some are sitting on the curb, some pacing. A couple of them carry duffel bags with military patches. One woman has a walkie-talkie clipped to her belt.

                The man in the cap calls out, “You all heading to the high school?”

                A few heads turn.

                A woman with a messy bun and a neon running jacket shakes her head. “Not anymore. It’s done.”

                The words hit you like a slap.

                “What do you mean, ‘done’?” someone from your group asks.

                “They never opened it,” another guy says, stepping forward. He’s got a bandanna tied around his arm, not like a wound, more like a makeshift team badge. “Or they did and it went bad. I’ve got family on the other side of town — said people showed up and there was no real setup, just chaos. They’re shutting it down. They’re not evacuating from there. They’re redirecting everyone to the big site by the bay, down by the water.”

                “Not the CDC place?” the man in the cap says, voice tight.

                The guy with the bandanna shakes his head. “No, opposite direction, away from that mess. Out past the industrial park, near the shoreline. They’ve got checkpoints, real military presence. It’s a longer walk, but that’s where the trucks are going. That’s where they’re moving people out. Stadium’s a mess.”

                You pull your phone out with numb fingers.

                No new alerts. No new texts from your family.

                You open the map app again. The blue dot of you pulses on a grid of familiar streets that feels like a game board now. The high school stadium is still marked as an evacuation checkpoint, a little red triangle sitting not that far away, relatively speaking.

                But now, near the bay, another symbol blinks — the larger evacuation center by the bay, near the shoreline you used to drive past without thinking about it.
                
                Your thumb hovers over the screen.

                “If the stadium’s shut down,” the messy-bun woman says, “they’re not going to keep sending people there. They’ll redirect. Your folks, if they got there and it was bad — they’d move them to the main site. Or the military would take them. That’s what they’re saying on the scanner.”

                “Or they’re trapped there and we’re walking away from them,” someone mutters.

                You don’t realize you said it until a few heads turn toward you.

                The guy with the bandanna softens his tone. “Look, man, nobody knows anything for sure. But if you’re trying to get out, the bay is where they’re actually loading people. Trucks, boats, maybe even helicopters if we’re lucky. The high school?” He shakes his head. “Best case, it’s closed. Worst case, it’s overrun.”

                Your chest tightens.

                Your mom said they were going to the stadium. That was… what, an hour ago? Less? Time is a blur. If they got there and it was chaos, maybe they were pushed toward the other site. Maybe they got in a truck. Maybe they’re already halfway to the bay.

                Or maybe they’re still there, waiting.

                If you go to the stadium and it’s bad, empty, closed, or crawling with infected — you’ll have to backtrack or detour again to reach the bay. Every extra block is more time out in this exposed, broken world.

                But if you skip it and go straight with this group to the bay, trusting the rumor, you might be walking away from the last place your family actually is.

                You check your phone one more time. Still nothing. The little red triangle at the stadium stubbornly glows. So does the icon by the bay.

                Around you, the group is shifting, the air filled with quiet arguments and frayed nerves.

                “Strength in numbers,” the man in the cap says, looking at you. “We’re going with them. Safety in a bigger group, yeah?”

                Your scraped arm throbs in the rising heat. You can feel the weight of the backpack on your shoulders, the knife in the side pocket bumping against your hip. The sky hums faintly with distant helicopter blades.

                Every path you can take feels like a gamble. Every minute you stand here feels like a minute lost.

                You have to decide what kind of risk you’re willing to live with.
                """,
            chapterDecisions: [
                ChapterDecision(
                    decisionText: "Stay with the larger group and head toward the main evacuation center by the bay near the water, trusting that if the stadium failed, your family would be redirected there too.",
                    nextChapterID: 9,// Death Chapter
                    HPChange: 0,
                    EPChange: 0),
                ChapterDecision(
                    decisionText: "Break off on your own (or with anyone else who’ll follow) and cut toward the high school stadium first to see for yourself what happened there before deciding your next move.",
                    nextChapterID: 10501,
                    HPChange: 0,
                    EPChange: 0)
            ],
            isFinalChapter: false
        ),
        
        // MARK: ChapterID: 10501 - ORANGE LIGHT
        StoryContent(
            chapterID: 10501,
            storyDay: 1,
            chapterTitle: "ORANGE LIGHT",
            chapterImages: ["survive-15-carCrash-image"],
            chapterText:
                """
                You can feel the moment the group realizes you’re serious.

                The others keep talking, arguing, whispering, trying to convince themselves they’re choosing the “smart” route but you step back from the circle, adjust your backpack straps, and point at the bright stadium marker on your phone like it’s a promise you can still hold.

                “I’m not skipping it,” you say, voice low. “Not if my family is going there.”

                Someone mutters that you’re crazy. Someone else calls you brave like it’s the same thing.

                A guy near the edge of the crowd shifts his weight and follows your movement with his eyes. He’s around your age, maybe a little younger, dark hair, lean build, a hoodie tied around his waist. He’s been quiet the whole time, the kind of quiet that feels like he’s listening for more than just people.

                “I’ll go,” he says.

                A few heads turn.

                He lifts his hands like he’s not looking for permission. “My sister texted me earlier. She said she was heading to the stadium with my parents. Then nothing. I’m not… I’m not walking away from that without seeing it.”

                He looks at you. “Nicolas.”

                You nod. “I’m—” you almost say your name, then stop. Names feel like a luxury right now, like something you could lose. But he offered his first. “Yeah. Okay. Let’s go.”

                Behind you, the larger group starts moving again — toward the bay, toward whatever feels safest when safety doesn’t exist. Their footsteps fade down the street. For a moment you’re alone with Nicolas and the sound of distant sirens.

                And your own heartbeat.

                You start walking.

                Not on the main road. Never the main road.

                You cut behind houses first, slipping through side gates and along fences, using trees and hedges like cover. Sometimes you move fast, sometimes you freeze for minutes at a time, crouched behind a parked car, listening for footsteps that don’t sound human, watching shadows slide across windows.

                It doesn’t feel like escaping. It feels like sneaking through a world that’s already decided you don’t belong in it anymore.

                As the day drags on, the chaos changes shape.

                Earlier, the town was loud — sirens, helicopters, shouting, engines. Now the sky is emptier. No helicopters thumping overhead. No low-flying medical choppers. Just a distant roar of jet fighters somewhere beyond the rooftops, way out toward the bay.

                The silence between sounds is the worst part.

                Because it leaves room for other things.

                A scream, far away, that rises and falls and then stops abruptly. A single gunshot, then nothing. A dog barking once—twice—and then going quiet like someone grabbed its throat.

                You and Nicolas stay low and keep moving.

                Your forearm throbs where the concrete took skin off. The blood has dried, leaving a tight, stinging line. You’ve tried not to look at it too much, but you catch Nicolas staring at it every time you pause.

                “I’m fine,” you say the first time, a little too sharp.

                He looks away quickly. “Yeah. Yeah, I know. Just… everything is—”

                “I know,” you cut in, softer. “It’s from a fall. Not a bite.”

                He nods, but the fear stays in his eyes.

                A few streets later, you see why.

                You spot them before they spot you: a tougher-looking group moving down a wider side street toward the bay. They’re not running like everyone else. They’re walking with purpose, spread out, scanning corners. They have weapons— real ones. A shotgun carried like the guy knows how to use it. A pistol tucked into a waistband. A baseball bat wrapped in tape. One man has a hunting rifle slung over his shoulder like this is what he’s been waiting for his whole life.

                You and Nicolas duck behind a minivan with a cracked windshield, peering through the gap between the hood and the curb.

                “They look… organized,” Nicolas whispers.

                “Yeah,” you murmur. “Let's hang tight.”

                A smaller group appears from the opposite direction — three people, stumbling, hands up, desperate. A woman is crying. One guy is supporting another who’s limping hard, his sleeve dark with something wet.

                They meet in the middle of the street.

                You can’t hear every word, but you catch enough.

                “—need help—”

                “Is he infected?!”

                “No—no, it’s just a scratch!” the crying woman says. “He fell—he fell when we were running—please—”

                The armed group fans out instantly, weapons rising.

                The limping man tries to speak, but it comes out as a rough, wet cough.

                “Back up,” someone orders.

                “We’re not one of them!” the woman pleads. “We’re not—”

                A voice from the back, quieter than the rest, cuts through like a blade. You can’t see the speaker clearly, but the others look toward him the way people look toward someone whose opinion matters.

                “We take no chances,” the quiet voice says. Calm. Too calm for this situation.

                Your stomach drops.

                “No—wait—” the woman starts, and then—

                Three shots, sharp and precise.

                The limping man collapses first. Then the one holding him. Then the woman, like her strings have been cut.

                Silence floods back into the street, thick and unreal.

                One of the armed men flinches at the echo. “Move,” he snaps. “Noise will pull them in.”

                They step over the bodies like they’re stepping over trash and keep walking toward the bay, scanning corners, already forgetting what they did.

                You and Nicolas don’t move.

                You can’t. Your legs feel locked.

                Nicolas’s eyes slide to your forearm again, and this time you don’t even get angry. You just give him a look that says you know. He swallows hard and nods once, like he’s accepting a rule of this new world.

                Don’t bleed. Don’t look weak. Don’t trust everyone.

                A distant scream rises somewhere behind you, answering the gunshots like the city itself is reacting.

                “That’s… that’s people too,” Nicolas whispers. “Not just them.”

                “Yeah,” you say. Your voice sounds flat, like it belongs to someone else. “People are part of it now.”

                You move.

                You don’t run — running makes noise, running makes you visible but you walk faster, weaving between houses, cutting through backyards and side alleys until the street with the bodies is gone behind you.

                Time slides again.

                The sun starts to sag. Shadows stretch long across lawns that are too neatly trimmed for the end of the world. The sky turns a bruised orange… not just from sunset, but from distant fires burning across town. It makes the clouds look dirty. It makes everything look like it’s under a warning light.

                You’re only halfway to the stadium.

                It should’ve been quicker. But every time you hear voices, you hide. Every time you see movement, you detour. Every time the town goes quiet, you stop and listen until your nerves stop screaming.

                Step by step.

                That’s the only way you can do it.

                At one point, Nicolas stops dead in the middle of a side street and stares ahead like he’s seeing a ghost.

                “I know this area,” he says, voice suddenly tight.

                You follow his gaze.

                A few blocks down, the silhouette of a church rises above the houses — dark windows, no lights, a heavy front entrance set back from the street. A place that used to mean potlucks and baptisms and quiet Sundays. Now it looks like a shape that might hold anything.

                “My family…” Nicolas swallows. “We used to go there. Sundays. My mom — she’ll go there if she’s scared. That’s… that’s where she’d take our family first.”

                Hope flickers on his face. Real hope. It’s almost painful to see.

                But you think of the church’s size. Too many rooms. Too many hallways. Too many blind corners. Too many places for something to wait.

                And you think of the stadium.

                Your mom’s voice. The checkpoint. Your dad’s scratch. The time you’re losing with every careful step.

                “We should keep moving,” you say, trying to sound calm. “If the stadium’s still up, it’s the best place to find information. And if it isn’t… we still need somewhere small to hold up for the night. A house. A shed. Something with one entrance.”

                Nicolas shakes his head slowly. “I don’t know why, but… something’s telling me to go there. Like I’m gonna regret it if I don’t. Even if they’re not there… at least I’ll know.”

                You reach a crossroad.

                Straight ahead, the neighborhood slopes toward the stadium direction — more open streets, fewer trees, more exposure but also progress.

                Left, a narrower road curves toward the church, its dark shape waiting like a mouth.

                The sky deepens into orange and gray. Somewhere far away, a burst of gunfire rattles, followed by distant screams. The town is losing daylight, and you can feel the night coming like a weight.

                If you go with Nicolas, you might find his family, and if you do, you gain an ally group, warmth, more hands, more eyes. But it pulls you away from the stadium, away from your own family, away from your primary goal.

                If you leave him, you push forward toward the stadium alone, faster, cleaner. But you might be abandoning the first person you’ve met who doesn’t feel like a threat.

                And you already know what it feels like to run and leave someone behind.

                Nicolas’s eyes search your face. “I’m going,” he says quietly. "You don't have to come, but I'm going."

                The wind shifts. Smoke rides it. Your scraped arm stings under the cooling air.

                Night is almost here.    
                """,
            chapterDecisions: [
                ChapterDecision(
                    decisionText: "Go with Nicolas to the church, risking the unknown layout in exchange for the chance to find his family—and not face the night alone.",
                    nextChapterID: 10601,
                    HPChange: 0,
                    EPChange: 0),
                ChapterDecision(
                    decisionText: "Separate from Nicolas and push straight toward the stadium alone, prioritizing your family and the checkpoint before it’s too late.",
                    nextChapterID: 9, // Death Chapter
                    HPChange: 0,
                    EPChange: 0)
            ],
            isFinalChapter: false
        ),
        
        // MARK: ChapterID: 10601 - SANCTUARY
        StoryContent(
            chapterID: 10601,
            storyDay: 1,
            chapterTitle: "SANCTUARY",
            chapterImages: ["survive-16-shelter-image"],
            chapterText:
                """
                “You took a chance coming with me,” you whisper as you crouch behind the parked sedan, the church looming ahead like a dark ship run aground. “And you stayed. Despite…”

                His eyes flick to your forearm. The scrape is ugly in the low light, a thin line of dried blood and raw skin that keeps announcing itself every time you move.

                You hold his gaze anyway. 
                
                “The least I can do is help you check. First sign of trouble — we leave. No questions.”

                “Deal?” you say.

                “Deal.”

                You inch forward through the neighborhood as the last of the sun drains out of the sky. You move with purpose now, less wandering, more targeting. The church sits back from the road, squat and heavy, its stained-glass windows dark except for a faint, intermittent flicker that makes your skin crawl.

                Firelight.

                Or something pretending to be.

                Out front, a small cluster of figures stands in the courtyard near the steps. Too still. Too quiet. They huddle close, heads angled toward the doors like they’re listening for a sound only they can hear.

                “Those aren’t… normal,” you whisper.

                Nicolas doesn’t answer. He doesn’t need to.

                You and him sink behind the car again, breathing shallow. Your heart feels like it’s trying to rattle out of your ribs.

                “We came,” you murmur. “This doesn’t look right. We move on before they see us.”

                Nicolas stays frozen, staring. “Wait.”

                You follow his gaze.

                That faint flicker pulses again behind the stained glass. Not bright — more like a candle struggling in a room that doesn’t want light. Proof of life. Proof of someone inside.

                Nicolas swallows hard. “If my mom got here… if she made it this far… she’d go inside. She’d—”

                “I’m not saying we won’t,” you cut in, gentler than your tone deserves. “I’m saying we do it smart.”

                “How?” His voice is tight. “They’re right there.”

                You think fast, because the darkness is thickening and the street is emptying and every second you wait is another second the world gets worse.

                “I can draw them,” Nicolas says quietly. “You make a run for the doors. See if it’s even possible.”

                You stare at him like he just offered to light himself on fire.

                “Are you crazy?”

                He lifts a hand, not defensive, just… accepting. “If you want to switch, I’m all for it.”

                You hesitate. Deep breath. A long exhale that trembles at the end.

                “Fine,” you whisper. “I run. But if those doors don’t open, that’s it, we go. Okay?”

                His eyes shine in the dying light. “Yes. Deal.”

                “Deal,” you say again, because saying it twice makes it feel like a contract with the universe.

                You both split around the car, him to one end, you to the other. Nicolas looks back once.

                You nod. He nods.

                Then he creeps out into the open.

                For a heartbeat, nothing happens. The huddled figures remain fixed, swaying almost imperceptibly, like they’re balancing on some internal wire.

                Nicolas takes another step.

                And his hip clips the side mirror of an abandoned car.

                BEEP—BEEP—BEEP—BEEP.

                The alarm screams into the last light.

                Every head in the huddle snaps toward the sound at once.

                Not curious.

                Not confused.

                Immediate. Hungry.

                They move like they’ve been waiting for permission.

                They launch toward Nicolas in a jagged sprint.

                “Go!” he yells, already backing up, eyes wide. “Go—go!”

                You don’t think. You run.

                Your shoes slap pavement, louder than you want, but the alarm is louder. It swallows everything. You cut toward the church steps, hugging the shadow of the wall, lungs already burning like you’ve been sprinting for miles instead of seconds.

                Out of the corner of your eye, you see Nicolas bolt away, drawing the pack with him, peeling them off like a magnet.

                “I’ll circle around!” he shouts, voice cracking as he disappears between parked cars.

                You hit the church steps hard, nearly tripping, catching yourself on the cold stone.

                The doors are massive up close - dark wood, iron bands, handles worn smooth by hands that believed in safety.

                You grab the handle and pull.

                Nothing.

                You yank again, panic sparking.

                Still nothing.

                “Come on,” you hiss, bracing a foot against the step and hauling with your whole body. The doors don’t give even a fraction. They’re locked. Bolted. Or barred from the inside.
                
                You suddenly realize not all of them chased the alarm.

                A wet breath rasps behind you.

                Not Nicolas.

                You turn and one of them is already airborne, launching from the shadows like a spring.

                You barely get your arms up before the impact slams you back into the door. Pain flashes through your scraped forearm as it bangs the wood. The thing’s hands claw at your chest, its mouth working, teeth clicking, trying to find the soft part of you.

                You shove, but it’s heavy in that wrong way - dead weight powered by pure instinct.

                “Help!” you scream, voice tearing. “If there’s anyone inside — HELP!”

                The creature’s face is inches from yours. Its eyes are dull and fever-bright at the same time. Its breath reeks of copper and rot.

                Then—

                A violent spray bursts across your face.

                Cold. Pressurized.

                The attacker jerks back, choking, flailing as white foam and mist fill its mouth and eyes.

                A fire extinguisher.

                The thing stumbles, and you see the chance — just a sliver of space where you can breathe.

                “NOW!” someone shouts from behind the door.

                The heavy wood lurches inward.

                Hands hook your jacket and yank you through the gap.

                You spill onto the stone floor inside the church, rolling, gasping, wiping foam from your eyes. The door slams shut behind you with a deep, final thud.

                A bench scrapes. Wood grinds. Something heavy slams into place.

                They’re barricading it — fast, practiced.

                The first bang hits the door almost immediately.

                Then another.

                Then a flurry — fists, bodies, teeth, whatever they have.

                “Shhh,” a woman whispers sharply, as if quiet can keep the door solid. “No noise. No screaming. They’ll linger.”

                You scramble upright.

                Nicolas is dragged in a second later—someone yanks him by the hoodie like a lifeline. He hits the floor hard, chest heaving, eyes wild, but alive.

                You crawl to him. “Nicolas—”

                “I’m okay,” he gasps. “I’m okay—”

                The banging on the door continues for a few long seconds, then fades into wandering scratches and muffled moans as they drift, chasing the next sound.

                In the dim, you see faces. Maybe eight, maybe ten people. Different ages. Different lives. All the same look in their eyes: exhausted terror held together by thin thread.

                They guide you deeper into the church, away from the doors, into a side room where a small, carefully hidden fire burns inside a metal basin. The flame is tight, controlled. Someone is feeding it torn hymn pages a strip at a time, like they’re afraid of feeding it too much.

                The air smells like smoke and old wood and sweat.

                “Name?” an older man asks, voice careful.

                You hesitate - then give it. Something about being pulled out of a death-snap makes honesty spill out.

                “Nicolas,” Nicolas croaks. “And my mom, Marisol. My sister, Elena. They might’ve come here.”

                A woman in scrubs shakes her head, eyes apologetic. “No one by those names. We’ve been here since afternoon.”

                Nicolas’s face tightens like someone punched him without touching him.

                You swallow. “Anyone from the stadium? Anyone come from the checkpoint?”

                A few people exchange looks.

                “Not from there,” someone says. “But we heard it was active earlier. Medical tents. Soldiers.”

                “That was hours ago,” another voice mutters. “Everything changes by the hour.”

                Someone else leans forward, eyes wide with too much information. “It’s worse in the big cities. New York. L.A. Chicago.”

                You blink. “It’s spread that far?”

                A bitter laugh answers you. “It didn’t spread. It… happened. Like a match. Same night.”

                A man in the back, half-hidden in shadow, speaks like he’s repeating something he’s convinced himself is true. “Targeted. Coordinated. They’ve had facilities everywhere. Tonight was the night.”

                “Enough,” the older man snaps. “Ignore him. He thinks it’s aliens.”

                “It is,” the man insists, but someone hisses at him to shut up.

                A younger woman near the fire rubs her hands together for warmth. “All I know is… people are turning on people. Families. Friends. It’s not just the infected. It’s panic. It’s guns. It’s—” She trails off, eyes glossy. “It’s everything breaking at once.”

                Nicolas drags a hand down his face. You watch him try to hold himself together and fail in tiny way - his shoulders sinking, his breathing shallow, the way he keeps glancing at the stained-glass windows as if his family might appear there like a miracle.

                You pull your phone out, mostly out of habit.

                No signal.

                Battery: 58%.

                The emergency alerts that came like clockwork earlier have stopped. Nothing new for hours.

                Nicolas looks at you, voice thin. “So… what now?”

                The church feels safer than the street, but safety isn’t the same as progress. Your family is still out there, somewhere between the stadium, the bay, the unknown. Every minute you sit by this fire is another minute you aren’t closing the distance.

                But outside is darkness. Outside is risk. Outside is that door and what waits beyond it.

                You listen.

                It’s quiet now. Quiet in a way that makes you nervous. Like the town is holding its breath.

                The older man watches you weigh it. “Most of us are staying,” he says. “Waiting for military. Waiting for daylight. Waiting for… anything.”

                Nicolas’s eyes search your face.

                You feel your own exhaustion like a weight in your bones, but you also feel the pull of momentum because once you stop moving, fear has room to grow.

                And you’re starting to understand something simple and brutal:

                If you wait for help, you might be waiting forever.

                """,
            chapterDecisions: [
                ChapterDecision(
                    decisionText: "Leave the church with Nicolas and push toward the stadium under cover of night, moving faster while the streets are quieter—even if it means higher risk and less visibility. ",
                    nextChapterID: 9, // Death Chapter
                    HPChange: 0,
                    EPChange: 0),
                ChapterDecision(
                    decisionText: "Stay inside the church for the night to rest, let your nerves settle, and conserve strength—then move at first light, even if it costs you precious time. ",
                    nextChapterID: 20701,
                    HPChange: 0,
                    EPChange: 0)
            ],
            isFinalChapter: false
        ),
        
        // MARK: DAY 2
        // chapterIDs: 20701-2xx01

        // MARK: ChapterID: 20701 - DAY 2
        StoryContent(
            chapterID: 20701,
            storyDay: 2,
            chapterTitle: "DAY 2",
            chapterImages: ["survive-21-survivors-image"],
            chapterText:
                """
                Dawn doesn’t arrive like relief.

                It arrives like a slow reveal. Morning again. Somehow. 

                The church is cold in the early morning, the kind of cold that sinks into your joints and makes every movement feel loud. The little fire is down to a sullen glow inside the metal basin, smoke clinging to the air and your clothes. You can taste it on the back of your tongue.

                You realize you barely slept.

                Not really.

                You remember dozing in shallow drops, head tipped against the wall, your body jerking awake at every sound. Distant screams. The occasional heavy bang against the doors like something testing the wood. Whispers that cut off the moment you opened your eyes. Someone praying under their breath. Someone quietly sobbing in the dark with a child’s hair in their fist.

                Every time the church creaked, your muscles tensed like it was a footstep.

                Every time you heard the word scratch, your eyes drifted to your forearm.

                Concrete. Not teeth.

                You repeat it like a spell until it loses meaning.

                When the first gray light slides through the stained glass, it paints the floor in broken colors — reds and blues and sickly gold. In the daylight, you can finally see what last night hid.

                The pews aren’t just pushed around. They’ve been ripped free and stacked like barricades, splintered wood and torn hymnals shoved into gaps. There are dark smears on the stone near one side door. A trail that was wiped, badly. A handprint halfway up a pillar like someone tried to climb the wall to get away from something that didn’t care about walls. They didn't just hide here - they fought to keep it. 

                The damage isn’t just outside.

                It’s everywhere.

                You push yourself up, joints stiff, backpack strap biting your shoulder. Nicolas is already awake. He’s standing near the side room where the fire was, speaking low with a small cluster of survivors - people who look less like they’re waiting to die and more like they’re deciding how to stay alive.

                You cross the room slowly, keeping your steps soft out of habit even though the daylight makes everything feel less haunted.

                Less haunted. Not safe.

                The cluster shifts when you arrive.

                The first is a man in his late thirties or early forties, calm in a way that feels unnatural, like fear tried to grab him and he refused to let it. He has a rolled-up sleeve showing an old tattoo on his forearm, and he carries himself like someone who’s been the one to make decisions before.

                When his eyes flick to your scrape, you expect suspicion.

                Instead, you get something worse: calculation.

                Marcus doesn't need to announce himself - you can feel it in the way the others angle toward him when they speak.

                Next to him is a woman with a little boy pressed to her side. The kid can’t be more than six. He’s too quiet in the way kids get when they’re trying to be invisible. His cheeks are streaked with dried tears, and one of his shoelaces is missing. The woman’s hands won’t stop moving - straightening the child’s collar, rubbing his shoulders, checking his face like she’s afraid he’ll disappear if she blinks.

                She catches you looking and lifts her chin, defensive and exhausted.

                "Talia, breathe" Marcus utters. She seems panicked - held together by pure love and no sleep.

                On the edge of the group is a younger guy, maybe early twenties - hood up, face drawn, eyes always tracking the corners of the room like he expects the walls to move. He doesn’t speak unless someone speaks directly to him. He flinches at sudden sounds like his body learned a new reflex overnight.

                Nervous, quiet. The kind of person you’d normally overlook. The kind of person who might surprise you. "Owen," Marcus says, "eyes on the side door."

                And then there’s the older man you spoke to last night - the one who shushed you, who knew how to barricade fast. He’s here too, close enough to listen, far enough not to be pulled into the argument. His eyes keep going to the front doors like he’s memorized every crack in the wood.

                The debate is already in progress when you step in.

                “We can’t stay,” Marcus says, voice low but steady. “Not with what we have. Not with the noise. This place buys time, nothing else.”

                Talia shakes her head hard, clutching her kid closer. “Staying is safer. It has walls. Doors. We made it through the night.”

                “And what happens tomorrow?” Marcus asks. “Or the day after? What happens when the water runs out? When we’re down to crumbs? When someone gets sick? When they decide to test the doors again and we don’t get lucky?”

                Owen swallows. “They were banging last night. Like… like they knew we were in here.”

                The words land heavy.

                Talia’s voice rises, thin and sharp. “The stadium. The soldiers. If there’s one place we’ll be protected, it’s there. They have guns. Tents. Medics. My son—” She stops, breath hitching, and you see her bite back something that might’ve been a plea.

                A man behind her mutters, “Or we show up and it’s nothing. And we just walked into an open field with nowhere to hide.”

                Marcus nods toward the stained glass, toward the faint, distant smoke outside. “The bay is the best bet. Water. Open space. Boats. If evacuation is real, it ends there. If the stadium was real and it failed, they’ll redirect people there anyway.”

                Your hands curl into fists at your sides.

                “The stadium is the last place my parents said they were going,” you say, voice tight but controlled. “So that’s where I’m going.”

                Marcus studies you. “And if it’s shut down? Overrun? Empty?”

                “Then we pivot,” you cut in, surprising yourself with how certain you sound. “But we don’t skip it without confirming. Not when people we love might still be there. And it is technically closer.”

                Talia’s eyes flash toward you - hope and fear colliding. “So you’ll go? You’ll go to the stadium?”

                Nicolas looks at you, searching your face.

                You see it in him, the exhaustion, the fear, the raw need for the world to make sense again. But underneath it is something else.

                Momentum.

                The only thing keeping you both from turning into statues in a burning town.

                “We’re not staying,” Nicolas says quietly. “The answer isn’t hiding until we rot or get rescued.”

                Marcus exhales through his nose like he expected this. “Fine. Then here’s my line in the sand.” He points with two fingers, not aggressive - just final. “I’m taking whoever wants to come and heading for the bay. We move smart. We keep to side streets. We scavenge what we can. If we get separated, we don’t stop in the open to be heroes.”

                The older man near the edge finally speaks, voice softer than you expect. “You’ll split. That’s what always happens. People think they can make it alone until they can’t.”

                A new voice joins from behind, calm and worn.

                “I’ll go with you.”

                Heads turn.

                A priest steps forward from the shadows of a side aisle, collar visible now in daylight. He looks tired in a way that goes beyond lack of sleep - tired like he’s carried other people’s grief for years and last night just snapped the strap.

                “I’m Father Reyes,” he says quietly. “This is my church. These are my people.” His gaze flicks to the barricaded doors, the piled pews, the small trembling boy. “But he’s right.” He nods toward Marcus. “We don’t have enough to hold out. Not if this continues.”

                Talia’s mouth opens. “You’re leaving?”

                “I’m scouting,” Father Reyes corrects gently. “I’ll move with you as long as I can. Gather supplies. Information. And if… if I find a way to bring help back here, I will.”

                Marcus’s jaw tightens, but he nods once like he respects the choice even if he hates it.

                Father Reyes looks at you and Nicolas. “If you go to the stadium… and it still stands… tell them there are people here. Tell them we held through the night. Tell them—” He pauses, voice catching for a split second. “Tell them we’re still here.”

                Nicolas swallows. You can see him fighting to keep hope from turning into something fragile.

                Then he leans in toward you, low enough that it’s just for you.

                “So,” he murmurs. “Do we go alone… or do we go with them?”

                He doesn’t say it, but you hear it anyway:

                Safety in numbers. But numbers can slow you down. Numbers can turn into noise.

                Across the room, Talia adjusts her son on her hip and watches you like your answer decides whether she lives. Owen stares at the floor like he’s afraid of being chosen for anything. Marcus stands still, waiting, ready to move the second you commit.

                You feel the weight of the day ahead settle onto your shoulders like a second backpack.

                And for the first time since the sirens woke you, you understand something else:

                This isn’t just about where you go.

                It’s about who you become, and who you’re willing to carry with you.

                """,
            chapterDecisions: [
                ChapterDecision(
                    decisionText: "Break off with Nicolas and head for the stadium immediately - move faster, quieter, and more direct, but accept that you’re exposed and outnumbered if anything goes wrong.",
                    nextChapterID: 9, // Death Chapter
                    HPChange: 0,
                    EPChange: 0),
                ChapterDecision(
                    decisionText: "Travel with Marcus’s group at least for now - strength in numbers, shared scavenging, and a clearer plan toward the bay, even if it slows your push to the stadium.",
                    nextChapterID: 20801,
                    HPChange: 0,
                    EPChange: 0)
            ],
            isFinalChapter: false
        ),
        
        // MARK: ChapterID: 20801 - QUIET STREETS, SHARP CHOICES
        StoryContent(
            chapterID: 20801,
            storyDay: 2,
            chapterTitle: "QUIET STREETS, SHARP CHOICES",
            chapterImages: ["survive-22-bike-image"],
            chapterText:
                """
                You decide to fall in with Marcus’s group. Nicolas follows your call. There's a shared understanding that, for now, numbers mean survival. 
                
                "I will return with supplies and help," Father Reyes says to the handful of people that remain. 
                
                Everyone gathers by the doors to make their way out. 
                
                You adjust your pace to match theirs, instincts reshaping themselves around the rhythm of other footsteps, other breaths. It feels strange, unnatural, even - to let your movement be dictated by strangers, but the alternative is worse.

                Marcus takes point. Calm. Watchful. Already thinking three turns ahead. Talia stays close behind him, her son balanced on her hip like an extension of her own body. Owen drifts near the middle, quiet and alert, eyes constantly scanning rooftops and alleys. Father Reyes brings up the rear, murmuring reassurance when nerves fray, his presence oddly grounding in a world that no longer follows rules.

                You exchange a glance with Nicolas as the church fades behind you.
                
                Marcus is heading for the bay. You and Nicolas are going with him - for now. 

                This isn’t the fastest route to your families… or the stadium marker burning in your pocket. You both know that.

                But it’s a route.

                Strength in numbers. Shared eyes. Shared risk. A chance to scavenge instead of sprinting blindly from one desperate point to the next. If the bay really is where evacuation ends, following this group keeps options open — keeps you alive long enough to decide when to break off.

                For now, you walk together.

                And for the first time since the sirens woke you, it almost feels like a plan.
                
                Morning light shows what the dark was hiding.

                The town looks hollowed out, like someone scooped the life from it and left the shell behind. Cars sit abandoned at crooked angles, doors open, alarms long dead. Storefront windows are spiderwebbed or smashed outright. A delivery truck rests jackknifed across a side street, its tires shredded, its cargo spilled and trampled.

                The quiet is wrong.

                Not peaceful. Held.

                Every few minutes, something breaks it. A distant scream that cuts off too fast. A single gunshot far away, echoing between houses. Somewhere to the east, metal scrapes metal as a truck rolls driverless down a slight incline, bumping cars until it wedges and finally stops.

                Above it all, jet fighters roar past in pairs, low enough to rattle windows. You can’t tell if they’re protecting anyone, or just burning fuel to remind the world they’re still there.

                Talia keeps her son on her hip, his face buried in her shoulder. She murmurs to him constantly—nonsense, lullabies, promises she might not believe herself. Every time something moves at the edge of the street, her grip tightens.

                Owen flinches at the jets. He keeps his hood up, eyes darting, fingers worrying the strap of his backpack like it might anchor him to the ground.

                Marcus raises a fist, and the group freezes instantly.

                Ahead, an infected staggers into view from a side yard, clothes torn, one shoe missing. It sways, sniffing the air like it’s searching for a sound that hasn’t happened yet.

                No one speaks.

                You all wait.

                The thing drifts past the intersection and disappears behind a fence, its movements jerky and wrong.

                Marcus lowers his hand. The group exhales together.

                “That’s why distance matters,” he murmurs, not looking at anyone in particular. “Up close, that knife of yours?” He nods at your side. “You’ll land a hit. It won’t care.”

                Father Reyes glances down at the blade, then at a length of broken fence leaning against a curb. “Spears kept people alive for a very long time,” he says softly. “Distance buys time. Time buys choice.”

                Nicolas scans the street, jaw set. “There’s a hardware place two blocks over. Or—” He points farther ahead. “Gas station on the corner. Smaller. Faster.”

                Marcus shakes his head. “Or the pharmacy on Main. Bigger risk, bigger reward.”

                Your stomach twists.

                You reach into your pack without thinking. Crumbs. An empty plastic bottle. You realize when your mouth feels dry that you’ve been rationing water without meaning to, and that you’re out.

                Around you, others check their own supplies. No one says it, but the math is obvious. Day 2 is already asking for payment.

                The town feels different in daylight. Less frantic. More dangerous. The infected don’t rush blindly anymore - they linger. They stand in doorways. They drift toward sounds. They wait.

                And humans?

                You remember the shots last night. The way the armed group didn’t hesitate.

                The group presses on, careful, methodical. You step around broken glass, past a playground where swings creak in the breeze with no one to stop them. A banner hangs from a lamppost — GO EAGLES! — half-burned, flapping like a warning.

                For a while, it feels good.

                Not safe. But possible.

                Like if you keep moving, keep watching each other’s backs, maybe you can stay ahead of whatever this is.

                Marcus slows near an intersection where routes split. To the left: a small gas station tucked between houses, windows intact but dark. To the right: the wider road leading toward Main Street - where a pharmacy and grocery sit behind shattered glass and abandoned cars.

                More supplies could mean more noise. More eyes. More risk.

                Less risk means less margin for error later.

                Marcus looks to you and Nicolas. “This is where decisions start to cost,” he says. “We choose small and quiet… or we choose options and open ground.”

                Nicolas meets your eyes. “We’ll need water before we can even think about the stadium. And something with reach.” He glances at the broken fence again. “I don’t like betting everything on a knife.”

                Talia swallows. Her son whimpers softly. “I can’t do loud,” she whispers. “Not with him.”

                Owen says nothing, but his foot angles toward the smaller street like his body already voted.

                You feel it in your legs, in your thirst, in the way your scraped arm aches when the wind hits it.

                Day 2 reminds you that you weren't prepared.

                These are decisions that echo.

                """,
            chapterDecisions: [
                ChapterDecision(
                    decisionText: "Check the small gas station or a nearby house—quieter, faster, lower risk, but limited supplies and no guarantees.",
                    nextChapterID: 9, // Death Chapter
                    HPChange: 0,
                    EPChange: 0),
                ChapterDecision(
                    decisionText: "Push toward the pharmacy/grocery on the main road—more supplies, better tools, but higher visibility, noise, and human danger",
                    nextChapterID: 20901,
                    HPChange: 0,
                    EPChange: 0)
            ],
            isFinalChapter: false
        ),
        
        // MARK: ChapterID: 20901 - THE COST OF NOISE
        StoryContent(
            chapterID: 20901,
            storyDay: 2,
            chapterTitle: "THE COST OF NOISE",
            chapterImages: ["survive-23-runAway-image"],
            chapterText:
                """
                The vote isn’t loud.

                It doesn’t need to be.

                Talia speaks first, voice tight. “Gas station. Smaller. Faster. My son—” She doesn’t finish the sentence. She doesn’t have to.

                Owen nods, barely lifting his eyes. “Gas station,” he echoes. Quiet. Automatic.

                Father Reyes clears his throat. “The grocery store,” he says gently. “And the pharmacy inside it. If I’m going back to the church, that’s where the supplies are. I can’t return empty-handed.”

                Marcus doesn’t hesitate. “Same. Bigger risk, better return.”

                The air tightens.

                Nicolas looks at you, searching. “You know I’m with you,” he says simply.

                The decision settles on your shoulders like a weight you didn’t ask for. You picture dry mouths. Empty hands. The people still waiting behind barricades.

                “Grocery store,” you say.

                Talia exhales sharply and turns away, jaw clenched. Owen swallows and falls in line anyway. Marcus nods once, already moving.

                By the time you reach the edge of the parking lot, the sun is high and mean. Smoke hangs low, thinning visibility into a gray veil that makes distance hard to judge. Heat shimmers off broken glass.

                The lot looks like a panicked thought made solid.

                Cars are abandoned at wild angles, some nose-first over curbs, others smashed into each other like they tried to become one. Doors hang open. Trunks gape. Headlights and hazards glow weakly through smoke, casting orange halos that make everything look like it’s burning even when it’s not.

                Shopping carts lie scattered and overturned, some bent like they were used as shields. Blood smears streak across asphalt, across door frames, across windshields where hands pressed and slid. Torn clothes snag on side mirrors. A child’s shoe sits alone near a median.

                It’s quiet.

                Not empty.

                Just… waiting.

                “There’s no way we get through that quietly,” Owen whispers.

                Marcus studies the lot, eyes calculating paths between wrecks. “We have to try. If this looks like this, the gas station’s already picked clean. This place is big. There has to be something left.”

                Father Reyes nods, resolve set. “Not just for us. For the people waiting. I can’t go back with nothing.”

                Talia’s voice breaks. “This is exactly why I didn’t want to come.”

                “We’re almost there,” Father Reyes says. “Slow. Careful.”

                You move.

                Every step is deliberate. You place your feet where rubber meets asphalt, where shadows hide glass. You stay low, pass signals hand to hand. The silence feels fragile, like it might crack if you breathe wrong.

                Crunch.

                Someone steps on glass.

                Marcus spins. “Shhh, watch your footing,” he hisses.

                Talia snaps back under her breath, fear sharpening her words. “This is too much risk.”

                You keep moving.

                Paths close unexpectedly, forcing you to crawl over hoods slick with grime. Inside some cars, bodies slump against windows, faces frozen mid-plea, hands clawed into useless fists. You realize they probably thought the same thing you did.

                We’re safe in here.

                Safety never came.

                You’re almost across when Owen slips.

                His foot skids on oil or coolant. He stumbles forward into a metal cart.

                It tips.

                Rattles.

                Clatters.

                The sound explodes in the quiet.

                “Shit,” Marcus breathes.

                Then you hear it.

                Movement.

                Not one place - everywhere.

                Doors slam open. Heads snap up. Hands punch through glass. Figures spill from between cars, from beneath trucks, from the far edges of the lot like the ground itself is giving birth to them.

                “RUN!” Marcus shouts. “TO THE STORE!”

                The group surges forward.

                “Block the front!” Marcus yells to Nicolas. “Use the carts!”

                “Go!” you shout back. “Help him!”

                You turn to Owen. He’s scrambling, panic stealing coordination. You grab his arm and haul him upright.

                “Come on — move!” you shout.

                They’re close now. Too close. Arms reach. Glass shatters. A windshield caves inward with a wet crack as something forces itself through.

                You take one step to run—

                —and something clamps around your ankle.

                Cold fingers. Weak. Desperate.

                Your heart slams into your throat.

                You look down.

                It’s not one of them.

                It’s a man.

                Human. Filthy. Sunken-eyed. His face is streaked with soot and tears, lips cracked and bleeding. He’s wedged between two cars, pinned, legs trapped beneath a collapsed cart rack.

                “Please,” he rasps. “I’m not infected. I’m not bitten.” His grip tightens. “I was hiding. I got stuck. Please, don’t leave me.”

                Behind him, the parking lot comes alive.

                Glass bursts outward. Bodies spill free. The distance closes with terrifying speed.

                Marcus is already shouting from ahead. Talia screams your name. Nicolas turns back, eyes wide.

                The man’s fingers dig into your leg.

                “Please,” he says again. “I’ve been here all night.”

                You feel the pull in your chest - sharp and unbearable.

                This moment will follow you.

                No matter what you choose.

                """,
            chapterDecisions: [
                ChapterDecision(
                    decisionText: "Try to free the trapped man",
                    nextChapterID: 21001,
                    HPChange: 0,
                    EPChange: 0), // Death Chapter
                ChapterDecision(
                    decisionText: "Break free and run for the store",
                    nextChapterID: 9,
                    HPChange: 0,
                    EPChange: 0)
            ],
            isFinalChapter: false
        ),
        
        // MARK: ChapterID: 21001 - No Hope
        StoryContent(
            chapterID: 21001,
            storyDay: 2,
            chapterTitle: "No Hope",
            chapterImages: ["survive-24-lootedStore-image"],
            chapterText:
                """

                """,
            chapterDecisions: [
                ChapterDecision(
                    decisionText: "Search the store thoroughly for supplies",
                    nextChapterID: 9,
                    HPChange: 0,
                    EPChange: 0), // Death Chapter
                ChapterDecision(
                    decisionText: "Make a quick entry and grab essentials near the exit",
                    nextChapterID: 25,
                    HPChange: 0,
                    EPChange: 0)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 21101 - Shelter
        StoryContent(
            chapterID: 21101,
            storyDay: 2,
            chapterTitle: "Shelter",
            chapterImages: ["survive-25-church-image"],
            chapterText:
                """

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
            chapterImages: ["survive-41-familyDinner-image"],
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
            chapterImages: ["survive-42-zombieAttack-image"],
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
            chapterImages: ["survive-43-stadium-image"],
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
            chapterImages: ["survive-44-insideStadium-image"],
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
            chapterImages: ["survive-45-thePlan-image"],
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
            chapterTitle: "Day 5",
            chapterImages: ["survive-51-infectedInStadium-image"],
            chapterText: """
                You wake to a scream.

                    Your eyes snap open. For a second, you don’t remember where you are. The ceiling above you is unfamiliar, the air thick with the stale scent of sweat, fear, and unwashed bodies.

                    Then, another scream—raw, desperate. A gunshot follows.

                    Your heart pounds as reality crashes back in. The stadium. The evacuation center. The last trucks out.

                Chaos.
                
                    You sit up too fast, your vision swimming. People are running. Some pushing toward the exits, others scrambling over cots, knocking over supplies. Someone trips, gets trampled. A woman sobs uncontrollably in the corner, clutching a child who won’t stop screaming.

                Then you see it.

                    Near the center of the stadium, a body convulses on the ground. Blood pools around it. The limbs twitch violently before going unnaturally still. For a breathless moment, there’s silence.

                Then it moves again.
                
                    The soldier’s words slam into you like a punch to the gut:
                
                    “We lost the city.”
                    “Don’t miss the trucks.”

                This is it. The breach.

                    A gunshot rings out, but it’s already too late. The infected stirs, its body snapping unnaturally as it pushes itself up. Its eyes are empty, lifeless. But it sees movement. It lunges.

                The nearest survivor doesn’t stand a chance.

                    Screams erupt from every direction. The panic spreads like wildfire.

                More gunfire. More screams. More chaos.

                You don’t stop to think. You run.
                
                    Your legs are unsteady, your mind clouded with adrenaline. Everything is a blur. Your breath is ragged, muscles screaming as you push forward.

                    You stumble past overturned cots, past the injured who are too weak to escape. The infected are already among them.

                    A man reaches for you, his grip like iron around your wrist. You nearly scream, but his face is human—panicked, desperate. “Please, help me! Don’t leave me!” he begs, his voice cracking. “The trucks! We have to get to the trucks!”
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Help the man to his feet", nextChapterID: 9,
                                HPChange: 0, EPChange: -2), // Death Chapter
                ChapterDecision(decisionText: "Pull away and keep running", nextChapterID: 52,
                                HPChange: 0, EPChange: -2)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 52 - The Trucks
        StoryContent(
            chapterID: 52,
            storyDay: 5,
            chapterTitle: "The Trucks",
            chapterImages: ["survive-52-truck-image"],
            chapterText: """
                    “Please! Don’t leave me!” the man pleads, his grip tightening as if he can anchor himself to you, to survival.

                For a split second, you hesitate.

                But the screams behind you grow louder.

                The chaos closes in.

                    Your chest tightens, your pulse hammering against your ribs. You can’t stop.

                    With a sharp yank, you rip your arm free. The man staggers back, eyes wide with fear and betrayal.

                You don’t look back.

                    You force yourself forward, pushing through the madness, ignoring his voice as it fades into the chaos behind you.

                Because if you stop now, you die too.
                
                    Ahead, you see the military, rifles raised, trying to maintain control. They’re shouting for order, but no one is listening.

                The first truck is already pulling away.
                
                    You push harder, dodging bodies, ducking as another gunshot cracks the air.

                    You see the last truck. The bed is packed with survivors, the soldiers waving frantically for people to hurry.

                    Someone shoves past you, nearly knocking you down. You barely regain your footing. The infected are closing in—people being tackled, torn apart, their screams drowned in the madness.

                    A soldier near the truck fires into the crowd, trying to hold back the tide. “Move! MOVE!”

                You run for it.

                The truck begins to roll forward.
                
                Your heart leaps to your throat.

                The metal railing is just out of reach.

                You jump.

                    Your fingers grip the cold steel. For a terrifying second, your feet dangle off the ground. Someone grabs your arm—pulls hard.

                    You crash into the bed of the truck, bodies pressing against you. Someone yells, another cries in relief.

                    The last thing you see before the truck speeds away is the stadium collapsing into chaos—the infected spreading, the soldiers falling back.

                    The screams stay with you as the city rushes past.
                
                    The truck barrels through the city, swerving violently as it speeds down ruined streets.

                    Bodies press against you from all sides, survivors clutching each other, gripping onto whatever they can to stay steady. The floor rattles beneath you, every bump in the road sending people lurching into one another. Someone near you is sobbing. Another whispers a prayer under their breath.

                You force yourself to sit upright, to focus.

                Outside the truck, the city is collapsing.
                
                    Flashes of chaos blur past—buildings in flames, shattered windows, abandoned cars.

                    You see people running. Not just survivors, but stragglers who didn’t make the trucks. Some wave desperately, screaming for help as the convoy passes them by.

                Others are not so lucky.

                    A man in a torn jacket stumbles into the street, arms outstretched, eyes wild with desperation. He waves frantically at the convoy, his mouth forming silent pleas over the roar of the engines.

                Then—an infected slams into him from behind.

                    His screams cut through the air, raw and gut-wrenching, before they are swallowed by the surrounding chaos.

                Your stomach tightens.

                Do you say something?

                    The truck is still moving. You could shout, tell them to stop, to help the others—

                But stopping means risking everything.

                    Survivors still on the ground scramble for safety, some pounding against the sides of the truck, begging for a chance to climb aboard.
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Yell for the truck to stop", nextChapterID: 9,
                                HPChange: 0, EPChange: -1), // Death Chapter
                ChapterDecision(decisionText: "Remain silent", nextChapterID: 53,
                                HPChange: 0, EPChange: 0)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 53 - The Crash
        StoryContent(
            chapterID: 53,
            storyDay: 5,
            chapterTitle: "The Crash",
            chapterImages: ["survive-53-crash-image"],
            chapterText: """
                    You clench your jaw, your throat tight, but you stay silent.

                    You tell yourself there’s nothing you can do. That stopping won’t save them. That it will only get more people killed.

                But the guilt settles in your chest like a stone.

                    More survivors pound on the truck, their desperate voices barely audible over the wind. You force yourself to look away.

                    The soldier in the truck bed slams his fist against the side panel, shouting over the wind.

                “Hold on!”

                    The truck jerks hard to the left, barely missing a wrecked police car in the middle of the road. A woman yelps as she loses her grip and nearly falls out. Hands grab at her, pulling her back just in time.

                Then, you hear it—the sound of impact.

                    The truck collides with something. The tires screech, the whole vehicle tilts dangerously to the side.

                Someone screams.

                Then everything flips.
                
                The world spins violently.

                    Metal screeches, bodies slam into each other. Your shoulder smashes against the floor, pain shooting through your body as the truck rolls.

                    You can’t breathe—you don’t know which way is up, which way is down.

                A final, violent crash shakes through the air.

                Then, silence.
                
                    You open your eyes. Your body feels heavy, aching all over. Your ears ring.

                    For a moment, all you can do is lie there, trying to breathe.

                    The truck is on its side, smoke rising from the engine. The groans of injured survivors fill the air. Someone coughs violently, another moans in pain.

                    You press your hands against the cool metal beneath you and push yourself up, shaky and weak.

                    Your arms are scraped and bruised, but nothing feels broken. You got lucky.
                
                Then, voices.

                “Move! We have to move!”

                    You turn your head, vision still spinning. Soldiers are already pulling survivors out of the wreckage, shouting for people to get up.

                    “Get to the docks!” one soldier bellows. “That’s our last chance!”

                Your pulse spikes. The docks. The final boats.

                There’s no time to think. No time to process.

                You scramble out of the overturned truck.

                The city is still burning around you.

                    Ahead, the road slopes downward, leading toward the distant docks.

                    Somewhere beyond the smoke and chaos, your only hope of escape is waiting.

                The soldier grabs your arm, pushing you forward.

                “RUN!”
                
                Your legs burn as you run.

                    The soldier’s voice echoes behind you—“Get to the docks!”—but it’s already fading, drowned out by the chaos around you.

                The city is crumbling.

                    Buildings, once towering and strong, now stand as skeletal remains, flames licking at their broken frames. Cars clog the roads—some overturned, some still smoldering from earlier battles. Gunfire cracks in the distance. The scent of smoke and decay clings to the air.

                Ahead, you see people running.

                    Some are sprinting alone, weaving through debris, desperate to reach the docks before it’s too late. Others have banded together, sticking close, yelling for one another as they dodge obstacles.

                The final boats are the only way out.

                You have seconds to decide.
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Stick with a group", nextChapterID: 9,
                                HPChange: +1, EPChange: -2), // Death Chapter
                ChapterDecision(decisionText: "Go alone", nextChapterID: 54,
                                HPChange: -1, EPChange: -3)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 54 - Run
        StoryContent(
            chapterID: 54,
            storyDay: 5,
            chapterTitle: "Run",
            chapterImages: ["survive-54-runningToDocks-image"],
            chapterText: """
                    You break away from the nearest group, your mind made up. Alone is faster.

                    Survivors shout at each other as you pass—some yelling names, others barking orders.

                Gunshots.

                    A man ahead of you stumbles, clutching his side. His partner grabs him, trying to pull him forward. They don’t see the infected closing in.

                You do.

                But you don’t stop.

                You can’t.
                
                    Your heart slams against your ribs as you push forward, dodging overturned cars and leaping over fallen debris. The road slopes downward, guiding you toward the docks.

                    A piercing scream shreds through the air behind you.

                You don’t look back.

                Just run.
                
                    The street ahead narrows, leading into a tunnel beneath an overpass.

                    The dim light inside sends a chill through you. It’s a gamble—a shortcut that could get you to the docks faster, or a death trap.

                You hear footsteps closing in.

                Survivors.

                Infected.

                Something.
                
                You dart inside.

                    The air is stale and cold, thick with the scent of damp concrete and rust. Water drips from cracked pipes, echoing through the passage.

                    Shadows stretch across the walls, your own breath ragged in your ears.

                Then, you hear it.

                A low growl.

                Your steps halt.

                Eyes adjust to the dim light.

                    There—at the far end of the tunnel—a figure shambles into view.

                Then another.

                Then two more.

                Your stomach drops.

                The exit is just beyond them.

                You tighten your grip on the crowbar.

                You have seconds to react.
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Go back out the way you came", nextChapterID: 9,
                                HPChange: 0, EPChange: -2), // Death Chapter
                ChapterDecision(decisionText: "Fight and push through", nextChapterID: 55,
                                HPChange: -1, EPChange: -3)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 55 - The Docks
        StoryContent(
            chapterID: 55,
            storyDay: 5,
            chapterTitle: "The Docks",
            chapterImages: ["survive-55-dock-image"],
            chapterText: """
                    You grip the crowbar tighter, every muscle in your body screaming at you to move.

                    The tunnel exit is just beyond the infected, but they’re blocking the way. Their bodies twitch unnaturally, their heads tilting as if listening, sensing.

                    Your breath comes in short gasps. No way around them.

                No way but through.
                    
                You step forward. No hesitation.

                    The first infected turns its head sharply, eyes locking onto you. It snarls, lunging forward.

                Swing.

                    Your crowbar connects with its skull, the impact jarring your arms. It collapses, but the others react instantly.

                The second charges.

                    You barely have time to react before it slams into you. The air rushes from your lungs as you crash into the tunnel wall.

                Panic flares. Hands grasp at you, clawing, pulling.

                    You shove back, swinging wildly. Another sickening crack. Another body drops.

                The last one is close—too close.

                    You stab forward, driving the crowbar into its chest, forcing it back. It thrashes, teeth snapping inches from your face. With every ounce of strength, you push it away and bring the crowbar down onto its head.

                Silence.

                    You’re panting, your arms trembling. Your hands sting from gripping the crowbar too hard.

                You look up—the exit is clear.

                You run.
                
                    The air changes instantly as you burst out of the tunnel. The city behind you roars with chaos, but ahead—the docks.

                    A vast stretch of open concrete leads to the water, where military boats are waiting—

                No.

                They’re not waiting.

                They’re leaving.
                
                    Soldiers on the final boats wave people forward, yelling at the last stragglers to jump into the water if they want to live.

                You hear a familiar voice behind you:

                “Go! Don’t stop!”

                You don’t need to be told twice.

                    You sprint toward the docks, your legs burning, your body exhausted—but this is it.

                    Everything you’ve been through, every decision you’ve made, every moment of terror, loss, survival.

                It all comes down to this.
                    
                Then—chaos.

                You hear them before you see them.

                The infected have reached the docks.

                    A wave of them, spilling onto the pavement, racing toward you and the last survivors.

                    People are screaming, tripping, falling. Some are pulled down instantly. Others fight—some succeed, others don’t.

                The last boat is pulling away.

                Your last chance.

                You have seconds to act.
                """,
            chapterDecisions: [
                ChapterDecision(decisionText: "Try to reach the docks another way", nextChapterID: 9,
                                HPChange: 0, EPChange: -2), // Death Chapter
                ChapterDecision(decisionText: "Jump into the water", nextChapterID: 56,
                                HPChange: 0, EPChange: -1)
            ],
            isFinalChapter: false
        ),
        // MARK: ChapterID: 56 - The End?
        StoryContent(
            chapterID: 56,
            storyDay: 5,
            chapterTitle: "The End?",
            chapterImages: ["survive-56-cityBombing-image"],
            chapterText: """
                You don’t think. You run straight for the edge.

                    The cold spray of the ocean hits your face as you near the end of the dock.

                Behind you, you hear screams.

                The infected are here.

                You jump.

                    For a split second, you feel weightless. The city, the fire, the chaos—all of it vanishes.

                Then, the plunge.

                    The water is like ice, shocking the breath from your lungs. You thrash wildly, your body screaming in exhaustion.

                    Above you, shapes tumble into the water—infected, survivors.

                The infected don’t swim.

                They sink.

                But some survivors don’t surface.

                You force yourself to move. To keep going.
                
                    Your arms ache, your chest burns, but you push through the waves. The last boat is just ahead.

                    A soldier leans over the railing, hand outstretched.

                “Come on!”

                You reach.

                Fingertips brush—

                They grab you, pulling you aboard.

                    You collapse onto the deck, soaking, shaking, gasping.

                You’re alive.
                
                    You lay on the cold metal deck of the boat, chest heaving, body trembling. Your soaked clothes cling to your skin, every muscle in your body screaming in exhaustion.

                You made it.

                You’re alive.
                
                    The ocean sways beneath you, the waves rocking the boat as it speeds further away from the city. Around you, survivors collapse in exhaustion, some sobbing, others whispering prayers or simply staring blankly at the horizon.

                    A soldier moves through the group, checking on everyone. He kneels beside you, his voice muffled, distant.

                “You hurt? Bitten?”

                    You shake your head, barely able to process the words.

                    “Good.” He stands, looking over the railing. His jaw tightens. “We’re out of time.”

                You force yourself to sit up.

                That’s when you see it.
                
                The city.

                Your home.

                Or what’s left of it.

                    The skyline is smothered in thick black smoke, fires raging across rooftops. The docks are completely overrun—tiny figures still running, still fighting, still trying to escape.

                They won’t.

                They can’t.

                Because they didn’t make it.

                Just like the soldiers said.

                The city is lost.
                    
                A sound rumbles in the distance.

                Then another.

                Jet engines.

                    You turn toward the sky, and there—**streaking through the clouds—**are the fighter jets.

                You feel it before you see it.

                A deep, powerful boom shakes the sky.

                A blinding flash erupts over the city.

                Then another.

                Then dozens.
                
                    The first shockwave slams into the boat, knocking you sideways. You grab onto the railing, heart hammering, as the city is swallowed in fire.

                    The skyline erupts into a storm of light and destruction. Buildings crumble in on themselves, entire streets vanishing beneath the force of the blasts.

                    The fire spreads like a living thing, devouring everything.

                The infected. The survivors. Everything.

                Gone.
                
                No one speaks.

                    The only sounds are the roar of the fire and the endless crash of waves against the boat.

                You feel the heat on your face, even from here.

                    The city you fought so hard to escape is being erased.

                And all you can do is watch.
                
                    You stand at the railing, gripping the cold metal so tight your knuckles ache.

                    You watch as the final explosions consume what’s left of the skyline.

                    The last remaining buildings collapse, sending thick mushroom clouds of dust and fire billowing into the air.

                The fires burn, but there’s nothing left to save.

                The jets disappear into the sky.

                The bombs stop falling.

                The world goes quiet.
                
                A single voice breaks the silence.

                “What now?”

                No one answers.

                Because no one knows.

                The city is gone.

                The world is different now.

                And this is only the beginning.
                """,
            chapterDecisions: [],
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
            chapterImages: ["survive-1-ending-image"],
            chapterText: """
                Congratulations! You made it through the chaos and survived against all odds.
                This is the end of your journey.
                """,
            chapterDecisions: [],
            isFinalChapter: true
        )
    ]
}
