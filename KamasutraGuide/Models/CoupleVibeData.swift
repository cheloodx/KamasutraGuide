import Foundation
import SwiftUI

// MARK: - CoupleVibe Feature Data
class CoupleVibeData {
    
    // MARK: - 30 Day Challenges
    static let dailyChallenges: [DailyChallenge] = [
        DailyChallenge(id: 1, day: 1, title: "Scrie 3 lucruri pe care le apreciezi la partener", titleEn: "Write 3 things you appreciate about your partner", description: "Ia o hartie si scrie 3 lucruri specifice pe care le apreciezi la partenerul tau. Citeste-le cu voce tare.", descriptionEn: "Take a piece of paper and write 3 specific things you appreciate about your partner. Read them out loud.", category: .communication, icon: "\u{270D}\u{FE0F}", isCompleted: false),
        DailyChallenge(id: 2, day: 2, title: "Masaj de 10 minute", titleEn: "10-minute massage", description: "Ofera partenerului un masaj de 10 minute la umeri si spate. Concentreaza-te pe zonele de tensiune.", descriptionEn: "Give your partner a 10-minute shoulder and back massage. Focus on tension areas.", category: .physical, icon: "\u{1F486}", isCompleted: false),
        DailyChallenge(id: 3, day: 3, title: "Impartaseste o amintire frumoasa", titleEn: "Share a beautiful memory", description: "Spune partenerului care este cea mai frumoasa amintire pe care o aveti impreuna si de ce.", descriptionEn: "Tell your partner what your most beautiful memory together is and why.", category: .emotional, icon: "\u{1F4AD}", isCompleted: false),
        DailyChallenge(id: 4, day: 4, title: "Incercati o pozitie noua", titleEn: "Try a new position", description: "Alegeti impreuna o pozitie din aplicatie pe care nu ati incercat-o inca.", descriptionEn: "Choose together a position from the app that you haven't tried yet.", category: .adventure, icon: "\u{2B50}", isCompleted: false),
        DailyChallenge(id: 5, day: 5, title: "Desenati-va reciproc", titleEn: "Draw each other", description: "Faceti portretul partenerului in 5 minute. Nu conteaza talentul, ci distractia!", descriptionEn: "Draw your partner's portrait in 5 minutes. Talent doesn't matter, fun does!", category: .creative, icon: "\u{1F3A8}", isCompleted: false),
        DailyChallenge(id: 6, day: 6, title: "Spune-i partenerului ce te atrage cel mai mult", titleEn: "Tell your partner what attracts you most", description: "Fii specific - poate fi fizic, emotional sau intelectual.", descriptionEn: "Be specific - it can be physical, emotional or intellectual.", category: .communication, icon: "\u{1F48C}", isCompleted: false),
        DailyChallenge(id: 7, day: 7, title: "Dans lent impreuna", titleEn: "Slow dance together", description: "Puneti o melodie romantica si dansati impreuna in sufragerie timp de 5 minute.", descriptionEn: "Play a romantic song and dance together in the living room for 5 minutes.", category: .physical, icon: "\u{1F483}", isCompleted: false),
        DailyChallenge(id: 8, day: 8, title: "Scrie o scrisoare de dragoste", titleEn: "Write a love letter", description: "Scrie o scrisoare de dragoste de cel putin 10 randuri si ofer-o partenerului.", descriptionEn: "Write a love letter of at least 10 lines and give it to your partner.", category: .emotional, icon: "\u{1F48C}", isCompleted: false),
        DailyChallenge(id: 9, day: 9, title: "Gatiti impreuna ceva nou", titleEn: "Cook something new together", description: "Alegeti o reteta pe care nu ati mai facut-o si gatiti-o impreuna.", descriptionEn: "Choose a recipe you've never made and cook it together.", category: .adventure, icon: "\u{1F468}\u{200D}\u{1F373}", isCompleted: false),
        DailyChallenge(id: 10, day: 10, title: "Creati un playlist de cuplu", titleEn: "Create a couple playlist", description: "Fiecare alege 5 melodii care va reprezinta ca si cuplu.", descriptionEn: "Each of you picks 5 songs that represent you as a couple.", category: .creative, icon: "\u{1F3B5}", isCompleted: false),
        DailyChallenge(id: 11, day: 11, title: "20 de intrebari profunde", titleEn: "20 deep questions", description: "Puneti-va pe rand intrebari profunde despre vise, temeri si dorinte.", descriptionEn: "Take turns asking deep questions about dreams, fears and desires.", category: .communication, icon: "\u{2753}", isCompleted: false),
        DailyChallenge(id: 12, day: 12, title: "Baie sau dus impreuna", titleEn: "Bath or shower together", description: "Pregatiti o baie cu lumanari sau faceti un dus relaxant impreuna.", descriptionEn: "Prepare a bath with candles or take a relaxing shower together.", category: .physical, icon: "\u{1F6C1}", isCompleted: false),
        DailyChallenge(id: 13, day: 13, title: "Spune 5 complimente sincere", titleEn: "Give 5 sincere compliments", description: "De-a lungul zilei, ofera 5 complimente sincere si specifice partenerului.", descriptionEn: "Throughout the day, give 5 sincere and specific compliments to your partner.", category: .emotional, icon: "\u{1F31F}", isCompleted: false),
        DailyChallenge(id: 14, day: 14, title: "Explorati un loc nou", titleEn: "Explore a new place", description: "Vizitati impreuna un loc in care nu ati mai fost - un parc, un cartier, un muzeu.", descriptionEn: "Visit together a place you've never been - a park, a neighborhood, a museum.", category: .adventure, icon: "\u{1F5FA}\u{FE0F}", isCompleted: false),
        DailyChallenge(id: 15, day: 15, title: "Fotografie creativa de cuplu", titleEn: "Creative couple photography", description: "Faceti 10 fotografii creative impreuna. Experimentati cu unghiuri si pozitii.", descriptionEn: "Take 10 creative photos together. Experiment with angles and poses.", category: .creative, icon: "\u{1F4F8}", isCompleted: false),
        DailyChallenge(id: 16, day: 16, title: "Ascultati activ 15 minute", titleEn: "Active listening for 15 minutes", description: "Unul vorbeste 15 minute fara intrerupere, celalalt asculta cu atentie.", descriptionEn: "One speaks for 15 minutes uninterrupted, the other listens attentively.", category: .communication, icon: "\u{1F442}", isCompleted: false),
        DailyChallenge(id: 17, day: 17, title: "Masaj cu uleiuri esentiale", titleEn: "Essential oil massage", description: "Faceti un masaj complet cu uleiuri esentiale. Concentrati-va pe senzualitate.", descriptionEn: "Give a full massage with essential oils. Focus on sensuality.", category: .physical, icon: "\u{1F9F4}", isCompleted: false),
        DailyChallenge(id: 18, day: 18, title: "Impartasiti un vis de viitor", titleEn: "Share a future dream", description: "Vorbiti despre un vis pe care il aveti pentru viitorul vostru ca si cuplu.", descriptionEn: "Talk about a dream you have for your future as a couple.", category: .emotional, icon: "\u{1F320}", isCompleted: false),
        DailyChallenge(id: 19, day: 19, title: "Jucati un joc din aplicatie", titleEn: "Play a game from the app", description: "Alegeti si jucati unul din jocurile de cuplu din aplicatie.", descriptionEn: "Choose and play one of the couple games from the app.", category: .adventure, icon: "\u{1F3B2}", isCompleted: false),
        DailyChallenge(id: 20, day: 20, title: "Scrieti o poveste impreuna", titleEn: "Write a story together", description: "Scrieti o poveste scurta de dragoste alternand - fiecare scrie cate o propozitie.", descriptionEn: "Write a short love story alternating - each writes one sentence.", category: .creative, icon: "\u{1F4D6}", isCompleted: false),
        DailyChallenge(id: 21, day: 21, title: "Multumiri inainte de somn", titleEn: "Gratitude before sleep", description: "Inainte de culcare, spuneti-va 3 lucruri pentru care sunteti recunoscatori azi.", descriptionEn: "Before bed, tell each other 3 things you're grateful for today.", category: .communication, icon: "\u{1F64F}", isCompleted: false),
        DailyChallenge(id: 22, day: 22, title: "Yoga sau stretching in doi", titleEn: "Couples yoga or stretching", description: "Faceti 20 minute de yoga sau stretching impreuna.", descriptionEn: "Do 20 minutes of yoga or stretching together.", category: .physical, icon: "\u{1F9D8}", isCompleted: false),
        DailyChallenge(id: 23, day: 23, title: "Vizionati albumul foto", titleEn: "Look through your photo album", description: "Uitati-va impreuna la poze vechi si povestiti amintirile din spatele lor.", descriptionEn: "Look at old photos together and share the memories behind them.", category: .emotional, icon: "\u{1F5BC}\u{FE0F}", isCompleted: false),
        DailyChallenge(id: 24, day: 24, title: "Incercati 3 pozitii noi", titleEn: "Try 3 new positions", description: "Alegeti 3 pozitii din aplicatie si incercati-le pe toate in aceeasi seara.", descriptionEn: "Choose 3 positions from the app and try them all in the same evening.", category: .adventure, icon: "\u{1F31F}", isCompleted: false),
        DailyChallenge(id: 25, day: 25, title: "Capsula timpului", titleEn: "Time capsule", description: "Scrieti fiecare o scrisoare pentru voi peste 1 an. Puneti-le intr-un plic sigilat.", descriptionEn: "Each write a letter for yourselves in 1 year. Put them in a sealed envelope.", category: .creative, icon: "\u{1F4E6}", isCompleted: false),
        DailyChallenge(id: 26, day: 26, title: "Conversatie fara telefoane", titleEn: "Phone-free conversation", description: "Puneti telefoanele deoparte si vorbiti fata in fata timp de 30 de minute.", descriptionEn: "Put your phones away and talk face to face for 30 minutes.", category: .communication, icon: "\u{1F4F5}", isCompleted: false),
        DailyChallenge(id: 27, day: 27, title: "Seara de masaj tantric", titleEn: "Tantric massage evening", description: "Dedicati o seara intreaga masajului tantric cu respiratie sincronizata.", descriptionEn: "Dedicate an entire evening to tantric massage with synchronized breathing.", category: .physical, icon: "\u{1F549}\u{FE0F}", isCompleted: false),
        DailyChallenge(id: 28, day: 28, title: "Juraminte reafirmate", titleEn: "Reaffirmed vows", description: "Scrieti si cititi juraminte noi unul pentru celalalt.", descriptionEn: "Write and read new vows to each other.", category: .emotional, icon: "\u{1F490}", isCompleted: false),
        DailyChallenge(id: 29, day: 29, title: "Date Night special", titleEn: "Special Date Night", description: "Planificati cea mai frumoasa seara romantica cu tot ce ati invatat in 30 de zile.", descriptionEn: "Plan the most beautiful romantic evening with everything you learned in 30 days.", category: .adventure, icon: "\u{1F319}", isCompleted: false),
        DailyChallenge(id: 30, day: 30, title: "Reflectia celor 30 de zile", titleEn: "30-day reflection", description: "Discutati ce ati invatat, ce v-a placut cel mai mult si cum vreti sa continuati.", descriptionEn: "Discuss what you learned, what you liked most and how you want to continue.", category: .creative, icon: "\u{1F3C6}", isCompleted: false),
    ]
    
    // MARK: - Mood Recommendations
    static let moodRecommendations: [MoodRecommendation] = [
        MoodRecommendation(
            mood: .romantic,
            positions: ["missionary", "spooning", "lotus", "lazy-dog", "seated"],
            games: ["Adevar sau Provocare", "Citate Romantice"],
            playlist: "Seara Romantica",
            tip: "Aprindeti lumanari, puneti muzica lenta si concentrati-va pe contactul vizual si atingerile blande.",
            tipEn: "Light candles, play slow music and focus on eye contact and gentle touches."
        ),
        MoodRecommendation(
            mood: .passionate,
            positions: ["cowgirl", "doggy-style", "the-chair", "butterfly", "standing"],
            games: ["Zarurile Pasiunii", "Provocari de Cuplu"],
            playlist: "Pasiune Intensa",
            tip: "Lasati-va purtati de pasiune! Incercati ritmuri rapide si schimbati pozitiile frecvent.",
            tipEn: "Let passion carry you! Try fast rhythms and change positions frequently."
        ),
        MoodRecommendation(
            mood: .playful,
            positions: ["cowgirl", "reverse-cowgirl", "the-chair", "69"],
            games: ["Ce Ai Prefera?", "Zarurile Pasiunii", "Ruleta Pozitiilor"],
            playlist: "Dans Senzual",
            tip: "Transformati totul intr-un joc! Folositi zarurile pasiunii si provocati-va reciproc.",
            tipEn: "Turn everything into a game! Use the passion dice and challenge each other."
        ),
        MoodRecommendation(
            mood: .relaxed,
            positions: ["spooning", "lazy-dog", "lotus", "scissors", "missionary"],
            games: ["Cat de Bine Ma Cunosti?"],
            playlist: "Chill & Relax",
            tip: "Nu va grabiti. Concentrati-va pe respiratie, atingeri lente si conexiune emotionala.",
            tipEn: "Don't rush. Focus on breathing, slow touches and emotional connection."
        ),
        MoodRecommendation(
            mood: .adventurous,
            positions: ["standing", "wheelbarrow", "bridge", "amazon", "pretzel"],
            games: ["Provocari de Cuplu", "Ruleta Pozitiilor"],
            playlist: "Pasiune Intensa",
            tip: "Iesiti din zona de confort! Incercati pozitii noi si locuri neasteptate.",
            tipEn: "Get out of your comfort zone! Try new positions and unexpected places."
        ),
    ]
    
    // MARK: - Video Tutorials
    static let videoTutorials: [VideoTutorial] = [
        VideoTutorial(
            id: "sensual-massage", title: "Masaj Senzual Complet", titleEn: "Complete Sensual Massage",
            description: "Invata tehnici de masaj senzual pas cu pas pentru o experienta intima deosebita.",
            descriptionEn: "Learn sensual massage techniques step by step for an exceptional intimate experience.",
            duration: "25 min", category: .massage, icon: "\u{1F486}",
            steps: [
                TutorialStep(stepNumber: 1, title: "Pregatirea atmosferei", titleEn: "Setting the atmosphere", description: "Aprindeti lumanari parfumate, puneti muzica ambientala si pregatiti uleiurile. Temperatura camerei sa fie placuta.", descriptionEn: "Light scented candles, play ambient music and prepare the oils. Room temperature should be pleasant.", icon: "\u{1F56F}", duration: "3 min"),
                TutorialStep(stepNumber: 2, title: "Incalzirea mainilor", titleEn: "Warming up hands", description: "Frecati palmele rapid pentru a le incalzi. Turnati putina ulei in palme si intindeti uniform.", descriptionEn: "Rub your palms quickly to warm them. Pour a little oil in your palms and spread evenly.", icon: "\u{1F91B}", duration: "2 min"),
                TutorialStep(stepNumber: 3, title: "Umeri si gat", titleEn: "Shoulders and neck", description: "Incepeti cu miscari largi pe umeri, apoi concentrati-va pe zonele de tensiune. Folositi degetele mari in miscari circulare.", descriptionEn: "Start with wide strokes on shoulders, then focus on tension areas. Use thumbs in circular motions.", icon: "\u{1F4AA}", duration: "5 min"),
                TutorialStep(stepNumber: 4, title: "Spatele complet", titleEn: "Full back", description: "Lucrati de la baza spatelui in sus cu miscari lungi. Alternati intre presiune usoara si medie.", descriptionEn: "Work from the lower back upward with long strokes. Alternate between light and medium pressure.", icon: "\u{1F9D8}", duration: "8 min"),
                TutorialStep(stepNumber: 5, title: "Bratele si mainile", titleEn: "Arms and hands", description: "Masati fiecare brat de la umar la degete. Acordati atentie speciala palmelor.", descriptionEn: "Massage each arm from shoulder to fingers. Pay special attention to palms.", icon: "\u{270B}", duration: "4 min"),
                TutorialStep(stepNumber: 6, title: "Final senzual", titleEn: "Sensual finish", description: "Terminati cu atingeri foarte usoare pe intreg corpul, ca o mangaiere. Lasati partenerul sa se relaxeze.", descriptionEn: "Finish with very light touches across the entire body, like a caress. Let your partner relax.", icon: "\u{2764}\u{FE0F}", duration: "3 min"),
            ],
            color1: "FF6348", color2: "EE5A24"
        ),
        VideoTutorial(
            id: "communication-101", title: "Comunicare in Cuplu", titleEn: "Couple Communication",
            description: "Tehnici esentiale de comunicare pentru o relatie sanatoasa si o viata intima mai buna.",
            descriptionEn: "Essential communication techniques for a healthy relationship and better intimate life.",
            duration: "20 min", category: .communication, icon: "\u{1F4AC}",
            steps: [
                TutorialStep(stepNumber: 1, title: "Ascultarea activa", titleEn: "Active listening", description: "Invata sa asculti cu adevarat. Priveste in ochi, nu intrerupe, reformuleaza ce a spus partenerul.", descriptionEn: "Learn to truly listen. Look in the eyes, don't interrupt, rephrase what your partner said.", icon: "\u{1F442}", duration: "4 min"),
                TutorialStep(stepNumber: 2, title: "Exprimarea dorintelor", titleEn: "Expressing desires", description: "Foloseste propozitii cu 'eu simt' in loc de 'tu faci'. Fii specific despre ce iti doresti.", descriptionEn: "Use 'I feel' sentences instead of 'you do'. Be specific about what you want.", icon: "\u{1F5E3}", duration: "4 min"),
                TutorialStep(stepNumber: 3, title: "Feedbackul pozitiv", titleEn: "Positive feedback", description: "Spune ce ti-a placut in loc de ce nu ti-a placut. Incurajeaza experimentarea.", descriptionEn: "Say what you liked instead of what you didn't. Encourage experimentation.", icon: "\u{1F44D}", duration: "3 min"),
                TutorialStep(stepNumber: 4, title: "Limbajul corpului", titleEn: "Body language", description: "Invata sa citesti si sa folosesti limbajul corpului. Atingerile, privirea si postura comunica mult.", descriptionEn: "Learn to read and use body language. Touch, gaze and posture communicate a lot.", icon: "\u{1F9D1}\u{200D}\u{1F91D}\u{200D}\u{1F9D1}", duration: "4 min"),
                TutorialStep(stepNumber: 5, title: "Stabilirea limitelor", titleEn: "Setting boundaries", description: "Discutati deschis despre limite si confort. Stabiliti un cuvant de siguranta.", descriptionEn: "Discuss openly about limits and comfort. Establish a safe word.", icon: "\u{1F6E1}", duration: "5 min"),
            ],
            color1: "4FC3F7", color2: "0288D1"
        ),
        VideoTutorial(
            id: "tantric-breathing", title: "Respiratia Tantrica", titleEn: "Tantric Breathing",
            description: "Exercitii de respiratie tantrica pentru o conexiune mai profunda si o experienta intima intensificata.",
            descriptionEn: "Tantric breathing exercises for deeper connection and intensified intimate experience.",
            duration: "15 min", category: .intimacy, icon: "\u{1F549}",
            steps: [
                TutorialStep(stepNumber: 1, title: "Pozitia de start", titleEn: "Starting position", description: "Asezati-va fata in fata in pozitia lotus sau pe scaune. Tineti-va de maini.", descriptionEn: "Sit face to face in lotus position or on chairs. Hold hands.", icon: "\u{1F9D8}", duration: "2 min"),
                TutorialStep(stepNumber: 2, title: "Respiratia sincronizata", titleEn: "Synchronized breathing", description: "Inspirati impreuna pe nas 4 secunde, tineti 4 secunde, expirati pe gura 4 secunde.", descriptionEn: "Inhale together through the nose for 4 seconds, hold 4 seconds, exhale through mouth 4 seconds.", icon: "\u{1F4A8}", duration: "3 min"),
                TutorialStep(stepNumber: 3, title: "Respiratia alternata", titleEn: "Alternating breathing", description: "Unul inspira cand celalalt expira. Simtiti fluxul de energie intre voi.", descriptionEn: "One inhales when the other exhales. Feel the energy flow between you.", icon: "\u{1F300}", duration: "3 min"),
                TutorialStep(stepNumber: 4, title: "Contactul vizual", titleEn: "Eye contact", description: "Continuati respiratia mentinand contact vizual constant. Nu vorbiti, doar simtiti.", descriptionEn: "Continue breathing while maintaining constant eye contact. Don't speak, just feel.", icon: "\u{1F441}", duration: "3 min"),
                TutorialStep(stepNumber: 5, title: "Conectarea energiei", titleEn: "Connecting energy", description: "Imaginati-va o lumina calda care circula intre voi prin respiratie. Simtiti unitatea.", descriptionEn: "Imagine a warm light circulating between you through breath. Feel the unity.", icon: "\u{2728}", duration: "4 min"),
            ],
            color1: "A55EEA", color2: "8854D0"
        ),
        VideoTutorial(
            id: "self-care-couples", title: "Self-Care pentru Cupluri", titleEn: "Self-Care for Couples",
            description: "Ritualuri de ingrijire pe care le puteti face impreuna pentru a va reconecta.",
            descriptionEn: "Self-care rituals you can do together to reconnect.",
            duration: "30 min", category: .wellness, icon: "\u{1F9F4}",
            steps: [
                TutorialStep(stepNumber: 1, title: "Baie relaxanta", titleEn: "Relaxing bath", description: "Pregatiti o baie cu saruri, uleiuri esentiale si lumanari. Intrati impreuna.", descriptionEn: "Prepare a bath with salts, essential oils and candles. Get in together.", icon: "\u{1F6C0}", duration: "10 min"),
                TutorialStep(stepNumber: 2, title: "Masti faciale", titleEn: "Face masks", description: "Aplicati reciproc masti faciale. Este un moment amuzant si relaxant.", descriptionEn: "Apply face masks to each other. It's a fun and relaxing moment.", icon: "\u{1F9D6}", duration: "5 min"),
                TutorialStep(stepNumber: 3, title: "Masaj de picioare", titleEn: "Foot massage", description: "Masati reciproc picioarele cu o crema hidratanta. Concentrati-va pe talpi.", descriptionEn: "Massage each other's feet with moisturizing cream. Focus on the soles.", icon: "\u{1F9B6}", duration: "5 min"),
                TutorialStep(stepNumber: 4, title: "Ingrijirea parului", titleEn: "Hair care", description: "Periati si masati scalpul partenerului. Este extrem de relaxant.", descriptionEn: "Brush and massage your partner's scalp. It's extremely relaxing.", icon: "\u{1F487}", duration: "5 min"),
                TutorialStep(stepNumber: 5, title: "Meditatie ghidata", titleEn: "Guided meditation", description: "Terminati cu 5 minute de meditatie in liniste, tinandu-va de maini.", descriptionEn: "End with 5 minutes of quiet meditation, holding hands.", icon: "\u{1F54A}", duration: "5 min"),
            ],
            color1: "66BB6A", color2: "43A047"
        ),
        VideoTutorial(
            id: "foreplay-guide", title: "Ghidul Preludiului", titleEn: "Foreplay Guide",
            description: "Tehnici de preludiu care transforma intimitarea intr-o experienta memorabila.",
            descriptionEn: "Foreplay techniques that transform intimacy into a memorable experience.",
            duration: "20 min", category: .techniques, icon: "\u{1F525}",
            steps: [
                TutorialStep(stepNumber: 1, title: "Crearea anticiparii", titleEn: "Building anticipation", description: "Trimiteti mesaje provocatoare pe parcursul zilei. Creati tensiune inainte de seara.", descriptionEn: "Send provocative messages throughout the day. Build tension before the evening.", icon: "\u{1F4F1}", duration: "Pe parcursul zilei"),
                TutorialStep(stepNumber: 2, title: "Atingeri progresive", titleEn: "Progressive touches", description: "Incepeti cu atingeri usoare pe brate si gat. Progreseaza treptat spre zone mai senzuale.", descriptionEn: "Start with light touches on arms and neck. Gradually progress to more sensual areas.", icon: "\u{270B}", duration: "5 min"),
                TutorialStep(stepNumber: 3, title: "Sarutari variate", titleEn: "Varied kisses", description: "Explorati diferite tipuri de sarutari - usoare, pasionale, pe gat, pe lobul urechii.", descriptionEn: "Explore different types of kisses - light, passionate, on the neck, on the earlobe.", icon: "\u{1F48B}", duration: "5 min"),
                TutorialStep(stepNumber: 4, title: "Stimularea senzoriala", titleEn: "Sensory stimulation", description: "Folositi diferite texturi - pene, matase, gheata. Alternati senzatii pentru surpriza.", descriptionEn: "Use different textures - feathers, silk, ice. Alternate sensations for surprise.", icon: "\u{1F9CA}", duration: "5 min"),
                TutorialStep(stepNumber: 5, title: "Comunicarea dorintelor", titleEn: "Communicating desires", description: "Ghidati partenerul verbal sau cu miscari. Spuneti exact ce va place.", descriptionEn: "Guide your partner verbally or with movements. Say exactly what you like.", icon: "\u{1F5E3}", duration: "5 min"),
            ],
            color1: "FF6B8A", color2: "C44569"
        ),
        VideoTutorial(
            id: "kegel-exercises", title: "Exercitii Kegel pentru Cupluri", titleEn: "Kegel Exercises for Couples",
            description: "Exercitii Kegel pe care le puteti face impreuna pentru beneficii in viata intima.",
            descriptionEn: "Kegel exercises you can do together for benefits in intimate life.",
            duration: "10 min", category: .wellness, icon: "\u{1F4AA}",
            steps: [
                TutorialStep(stepNumber: 1, title: "Identificarea muschilor", titleEn: "Identifying muscles", description: "Incercati sa opriti fluxul de urina pentru a identifica muschii Kegel. Nu faceti asta regulat.", descriptionEn: "Try to stop the flow of urine to identify Kegel muscles. Don't do this regularly.", icon: "\u{1F50D}", duration: "1 min"),
                TutorialStep(stepNumber: 2, title: "Contractii rapide", titleEn: "Quick contractions", description: "Contractati si relaxati rapid muschii de 10 ori. Repetati de 3 ori cu pauza de 10 secunde.", descriptionEn: "Contract and relax muscles quickly 10 times. Repeat 3 times with 10-second break.", icon: "\u{26A1}", duration: "2 min"),
                TutorialStep(stepNumber: 3, title: "Contractii lungi", titleEn: "Long contractions", description: "Tineti contractia 5 secunde, relaxati 5 secunde. Repetati de 10 ori.", descriptionEn: "Hold contraction 5 seconds, relax 5 seconds. Repeat 10 times.", icon: "\u{23F1}", duration: "2 min"),
                TutorialStep(stepNumber: 4, title: "Exercitiul lift", titleEn: "Elevator exercise", description: "Contractati progresiv in 5 nivele, ca si cum urcati cu liftul. Apoi relaxati treptat.", descriptionEn: "Contract progressively in 5 levels, as if going up in an elevator. Then gradually relax.", icon: "\u{1F6D7}", duration: "3 min"),
                TutorialStep(stepNumber: 5, title: "Practica impreuna", titleEn: "Practice together", description: "Faceti exercitiile impreuna zilnic. In 4-6 saptamani veti simti diferenta in intimitate.", descriptionEn: "Do the exercises together daily. In 4-6 weeks you'll feel the difference in intimacy.", icon: "\u{1F46B}", duration: "2 min"),
            ],
            color1: "FFB74D", color2: "FF8F00"
        ),
    ]
    
    // MARK: - Love Language Recommendations
    static func recommendationsForLanguage(_ language: LoveLanguage) -> LoveLanguageResult {
        switch language {
        case .wordsOfAffirmation:
            return LoveLanguageResult(
                primaryLanguage: language,
                secondaryLanguage: .qualityTime,
                scores: [:],
                recommendedPositions: ["missionary", "lotus", "spooning", "seated"],
                recommendedActivities: ["Scrieti-va scrisori de dragoste", "Complimentati-va zilnic", "Cititi citate romantice impreuna", "Spuneti 'Te iubesc' in moduri creative"],
                recommendedActivitiesEn: ["Write love letters to each other", "Compliment each other daily", "Read romantic quotes together", "Say 'I love you' in creative ways"]
            )
        case .physicalTouch:
            return LoveLanguageResult(
                primaryLanguage: language,
                secondaryLanguage: .wordsOfAffirmation,
                scores: [:],
                recommendedPositions: ["lotus", "spooning", "missionary", "lazy-dog"],
                recommendedActivities: ["Masaj zilnic de 10 minute", "Tineti-va de mana in public", "Imbratisari lungi de 30 secunde", "Dormiti imbratisati"],
                recommendedActivitiesEn: ["Daily 10-minute massage", "Hold hands in public", "Long 30-second hugs", "Sleep cuddling"]
            )
        case .qualityTime:
            return LoveLanguageResult(
                primaryLanguage: language,
                secondaryLanguage: .physicalTouch,
                scores: [:],
                recommendedPositions: ["lotus", "seated", "missionary", "spooning"],
                recommendedActivities: ["Date night saptamanal", "Cina fara telefoane", "Plimbari lungi impreuna", "Jocuri de cuplu din aplicatie"],
                recommendedActivitiesEn: ["Weekly date night", "Phone-free dinner", "Long walks together", "Couple games from the app"]
            )
        case .receivingGifts:
            return LoveLanguageResult(
                primaryLanguage: language,
                secondaryLanguage: .actsOfService,
                scores: [:],
                recommendedPositions: ["cowgirl", "butterfly", "the-chair", "missionary"],
                recommendedActivities: ["Surprize mici dar dese", "Cadouri simbolice saptamanal", "Creati amintiri (capsula timpului)", "Cumparati jucarii din Toy Shop"],
                recommendedActivitiesEn: ["Small but frequent surprises", "Weekly symbolic gifts", "Create memories (time capsule)", "Buy toys from the Toy Shop"]
            )
        case .actsOfService:
            return LoveLanguageResult(
                primaryLanguage: language,
                secondaryLanguage: .receivingGifts,
                scores: [:],
                recommendedPositions: ["missionary", "spooning", "cowgirl", "lazy-dog"],
                recommendedActivities: ["Pregatiti micul dejun in pat", "Faceti masaj fara sa vi se ceara", "Preluati sarcinile partenerului", "Organizati o seara romantica surpriza"],
                recommendedActivitiesEn: ["Prepare breakfast in bed", "Give a massage without being asked", "Take over your partner's chores", "Organize a surprise romantic evening"]
            )
        }
    }
}
