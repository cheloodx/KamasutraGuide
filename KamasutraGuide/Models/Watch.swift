import Foundation
import SwiftUI

// MARK: - Game Data
struct GameData {
    
    // MARK: - Available Games (18 total)
    static let allGames: [CoupleGame] = [
        CoupleGame(id: "truth-or-dare", name: "Adevar sau Provocare", nameEn: "Truth or Dare", icon: "flame.fill", description: "Jocul clasic de cuplu cu intrebari intime si provocari indraznete.", descriptionEn: "Classic couple game with intimate questions and bold dares.", color1: "FF6B8A", color2: "C44569", minPlayers: 2),
        CoupleGame(id: "would-you-rather", name: "Ce Ai Prefera", nameEn: "Would You Rather", icon: "arrow.left.arrow.right", description: "Alege intre doua scenarii romantice sau picante.", descriptionEn: "Choose between two romantic or spicy scenarios.", color1: "A55EEA", color2: "8854D0", minPlayers: 2),
        CoupleGame(id: "dice-game", name: "Zarurile Pasiunii", nameEn: "Passion Dice", icon: "dice.fill", description: "Arunca zarurile si descopera actiuni romantice aleatorii.", descriptionEn: "Roll the dice and discover random romantic actions.", color1: "FF6348", color2: "EE5A24", minPlayers: 2),
        CoupleGame(id: "quiz", name: "Cat de Bine Ma Cunosti?", nameEn: "How Well Do You Know Me?", icon: "questionmark.circle.fill", description: "Testeaza cat de bine va cunoasteti partenerul.", descriptionEn: "Test how well you know your partner.", color1: "4FC3F7", color2: "0288D1", minPlayers: 2),
        CoupleGame(id: "challenges", name: "Provocari de Cuplu", nameEn: "Couple Challenges", icon: "star.fill", description: "Provocari zilnice pentru a mentine flacara aprinsa.", descriptionEn: "Daily challenges to keep the flame alive.", color1: "FFB74D", color2: "FF8F00", minPlayers: 2),
        CoupleGame(id: "position-roulette", name: "Ruleta Pozitiilor", nameEn: "Position Roulette", icon: "arrow.triangle.2.circlepath", description: "Lasa soarta sa aleaga pozitia urmatoare pentru voi!", descriptionEn: "Let fate choose the next position for you!", color1: "FC5C7D", color2: "6A82FB", minPlayers: 2),
        CoupleGame(id: "spin-the-bottle", name: "Invarte Sticla", nameEn: "Spin the Bottle", icon: "arrow.2.circlepath.circle.fill", description: "Invarte sticla virtuala si executa provocarea pe care o primesti!", descriptionEn: "Spin the virtual bottle and perform the challenge you receive!", color1: "E91E63", color2: "AD1457", minPlayers: 2),
        CoupleGame(id: "strip-poker", name: "Strip Poker", nameEn: "Strip Poker", icon: "suit.spade.fill", description: "Jocul de carti clasic cu mize seducatoare.", descriptionEn: "The classic card game with seductive stakes.", color1: "F44336", color2: "B71C1C", minPlayers: 2),
        CoupleGame(id: "body-painting", name: "Pictura pe Corp", nameEn: "Body Painting", icon: "paintbrush.fill", description: "Desenati pe corpul partenerului cu degetele sau pensule.", descriptionEn: "Draw on your partner's body with fingers or brushes.", color1: "9C27B0", color2: "6A1B9A", minPlayers: 2),
        CoupleGame(id: "blindfold-game", name: "Legat la Ochi", nameEn: "Blindfold Game", icon: "eye.slash.fill", description: "Cu ochii legati, ghiceste atingerea sau obiectul.", descriptionEn: "Blindfolded, guess the touch or object.", color1: "607D8B", color2: "37474F", minPlayers: 2),
        CoupleGame(id: "countdown", name: "Numaratoarea Inversa", nameEn: "The Countdown", icon: "timer", description: "Provocari cu timp limitat, din ce in ce mai intense!", descriptionEn: "Time-limited challenges, getting more intense!", color1: "FF5722", color2: "BF360C", minPlayers: 2),
        CoupleGame(id: "love-bingo", name: "Bingo Romantic", nameEn: "Love Bingo", icon: "square.grid.3x3.fill", description: "Completati cartonul de bingo cu activitati romantice.", descriptionEn: "Complete the bingo card with romantic activities.", color1: "E91E63", color2: "880E4F", minPlayers: 2),
        CoupleGame(id: "fantasy-cards", name: "Carti cu Fantezii", nameEn: "Fantasy Cards", icon: "rectangle.stack.fill", description: "Trageti o carte si indepliniti fantezia descrisa.", descriptionEn: "Draw a card and fulfill the described fantasy.", color1: "673AB7", color2: "311B92", minPlayers: 2),
        CoupleGame(id: "hot-and-cold", name: "Cald si Rece", nameEn: "Hot & Cold", icon: "thermometer.medium", description: "Ghideaza partenerul spre zona preferata cu indicii.", descriptionEn: "Guide your partner to the preferred spot with hints.", color1: "FF9800", color2: "E65100", minPlayers: 2),
        CoupleGame(id: "mystery-box", name: "Cutia Misterioasa", nameEn: "Mystery Box", icon: "shippingbox.fill", description: "Scoate un bilet misterios cu o provocare surpriza.", descriptionEn: "Pull a mystery ticket with a surprise challenge.", color1: "795548", color2: "3E2723", minPlayers: 2),
        CoupleGame(id: "massage-roulette", name: "Ruleta Masajului", nameEn: "Massage Roulette", icon: "hands.sparkles.fill", description: "Zona corpului + tehnica de masaj aleatorie.", descriptionEn: "Random body zone + massage technique combination.", color1: "00BCD4", color2: "006064", minPlayers: 2),
        CoupleGame(id: "love-story", name: "Povestea Noastra", nameEn: "Our Love Story", icon: "book.fill", description: "Completati povestea de dragoste impreuna, rand pe rand.", descriptionEn: "Complete the love story together, line by line.", color1: "EC407A", color2: "AD1457", minPlayers: 2),
        CoupleGame(id: "tempo", name: "Tempo", nameEn: "Tempo", icon: "metronome.fill", description: "Provocari cu timp limitat, tot mai intense pe masura ce avansati.", descriptionEn: "Timed challenges that get more intense as you progress.", color1: "FF6D00", color2: "DD2C00", minPlayers: 2),
    ]
    
    // MARK: - Truth or Dare Cards
    static let truthCards: [TruthOrDareCard] = [
        TruthOrDareCard(type: .truth, text: "Care a fost cel mai romantic moment al nostru impreuna?", textEn: "What was our most romantic moment together?", intensity: 1),
        TruthOrDareCard(type: .truth, text: "Ce iti place cel mai mult la mine fizic?", textEn: "What do you like most about me physically?", intensity: 2),
        TruthOrDareCard(type: .truth, text: "Care este fantazia ta secreta?", textEn: "What is your secret fantasy?", intensity: 3),
        TruthOrDareCard(type: .truth, text: "Unde ai vrea sa facem dragoste cel mai mult?", textEn: "Where would you most like to make love?", intensity: 4),
        TruthOrDareCard(type: .truth, text: "Ce pozitie iti place cel mai mult si de ce?", textEn: "What position do you like most and why?", intensity: 4),
        TruthOrDareCard(type: .truth, text: "Care este cea mai indrazneata dorinta pe care nu mi-ai spus-o?", textEn: "What is the boldest desire you haven't told me?", intensity: 5),
        TruthOrDareCard(type: .truth, text: "Cand te-ai simtit cel mai atras de mine?", textEn: "When did you feel most attracted to me?", intensity: 2),
        TruthOrDareCard(type: .truth, text: "Ce as putea face diferit in dormitor?", textEn: "What could I do differently in the bedroom?", intensity: 4),
        TruthOrDareCard(type: .truth, text: "Care a fost prima ta impresie despre mine?", textEn: "What was your first impression of me?", intensity: 1),
        TruthOrDareCard(type: .truth, text: "Daca ai putea planifica o seara romantica perfecta, cum ar fi?", textEn: "If you could plan a perfect romantic evening, what would it be like?", intensity: 2),
        TruthOrDareCard(type: .truth, text: "Ce te excita cel mai mult?", textEn: "What excites you the most?", intensity: 4),
        TruthOrDareCard(type: .truth, text: "Care este zona ta erogena preferata?", textEn: "What is your favorite erogenous zone?", intensity: 3),
        TruthOrDareCard(type: .truth, text: "Ai incercat vreodata ceva in pat de care ti-a fost rusine sa vorbesti?", textEn: "Have you ever tried something in bed you were embarrassed to talk about?", intensity: 5),
        TruthOrDareCard(type: .truth, text: "Ce compliment iti face cea mai mare placere?", textEn: "What compliment gives you the most pleasure?", intensity: 1),
        TruthOrDareCard(type: .truth, text: "Daca am fi singuri pe o insula, ce am face prima data?", textEn: "If we were alone on an island, what would we do first?", intensity: 3),
        TruthOrDareCard(type: .truth, text: "Ce tip de atingere te relaxeaza cel mai mult?", textEn: "What type of touch relaxes you the most?", intensity: 2),
        TruthOrDareCard(type: .truth, text: "Ai vrea sa incercam ceva nou in dormitor? Ce anume?", textEn: "Would you like to try something new in the bedroom? What exactly?", intensity: 4),
        TruthOrDareCard(type: .truth, text: "Care este amintirea ta favorita despre noi?", textEn: "What is your favorite memory of us?", intensity: 1),
        TruthOrDareCard(type: .truth, text: "Ce iti trece prin minte cand ma vezi dezbracat/a?", textEn: "What goes through your mind when you see me undressed?", intensity: 3),
        TruthOrDareCard(type: .truth, text: "Unde este cel mai indraznet loc in care ai vrea sa fim intimi?", textEn: "What is the boldest place where you would want us to be intimate?", intensity: 5),
    ]
    
    static let dareCards: [TruthOrDareCard] = [
        TruthOrDareCard(type: .dare, text: "Saruta-ti partenerul timp de 30 de secunde fara sa te opresti.", textEn: "Kiss your partner for 30 seconds without stopping.", intensity: 1),
        TruthOrDareCard(type: .dare, text: "Fa-i partenerului un masaj de 2 minute la umeri.", textEn: "Give your partner a 2-minute shoulder massage.", intensity: 1),
        TruthOrDareCard(type: .dare, text: "Sopteste ceva seducator la urechea partenerului.", textEn: "Whisper something seductive in your partner's ear.", intensity: 2),
        TruthOrDareCard(type: .dare, text: "Danseaza provocator pentru partenerul tau timp de 1 minut.", textEn: "Dance provocatively for your partner for 1 minute.", intensity: 3),
        TruthOrDareCard(type: .dare, text: "Scoate o piesa vestimentara la alegerea partenerului.", textEn: "Remove a clothing item of your partner's choice.", intensity: 3),
        TruthOrDareCard(type: .dare, text: "Fa-i partenerului un masaj senzual pe picioare.", textEn: "Give your partner a sensual foot massage.", intensity: 2),
        TruthOrDareCard(type: .dare, text: "Imita scena romantica preferata dintr-un film.", textEn: "Reenact your favorite romantic movie scene.", intensity: 2),
        TruthOrDareCard(type: .dare, text: "Mananca ceva de pe corpul partenerului.", textEn: "Eat something off your partner's body.", intensity: 4),
        TruthOrDareCard(type: .dare, text: "Leaga-ti partenerul la ochi si saruta-l in 5 locuri diferite.", textEn: "Blindfold your partner and kiss them in 5 different places.", intensity: 4),
        TruthOrDareCard(type: .dare, text: "Pozeaza seducator pentru partenerul tau.", textEn: "Pose seductively for your partner.", intensity: 3),
        TruthOrDareCard(type: .dare, text: "Fa-i partenerului un strip-tease de 1 minut.", textEn: "Give your partner a 1-minute striptease.", intensity: 5),
        TruthOrDareCard(type: .dare, text: "Tine-ti partenerul in brate si cara-l prin camera.", textEn: "Hold your partner in your arms and carry them across the room.", intensity: 2),
        TruthOrDareCard(type: .dare, text: "Spune-i partenerului 5 lucruri pe care le iubesti la el/ea.", textEn: "Tell your partner 5 things you love about them.", intensity: 1),
        TruthOrDareCard(type: .dare, text: "Saruta fiecare deget al partenerului tau.", textEn: "Kiss each of your partner's fingers.", intensity: 2),
        TruthOrDareCard(type: .dare, text: "Fa o declaratie de dragoste improvizata.", textEn: "Make an improvised love declaration.", intensity: 1),
        TruthOrDareCard(type: .dare, text: "Masaj cu cuburi de gheata pe spatele partenerului.", textEn: "Ice cube massage on your partner's back.", intensity: 4),
        TruthOrDareCard(type: .dare, text: "Atingeti-va doar cu varful degetelor timp de 1 minut.", textEn: "Touch each other only with fingertips for 1 minute.", intensity: 3),
        TruthOrDareCard(type: .dare, text: "Reproduce sunetul cel mai seducator pe care il poti face.", textEn: "Make the most seductive sound you can.", intensity: 3),
        TruthOrDareCard(type: .dare, text: "Alege o pozitie din aplicatie si demonstreaz-o.", textEn: "Choose a position from the app and demonstrate it.", intensity: 5),
        TruthOrDareCard(type: .dare, text: "Fa-i partenerului cel mai lung sarut de pe gat.", textEn: "Give your partner the longest neck kiss.", intensity: 4),
    ]
    
    // MARK: - Would You Rather
    static let wouldYouRather: [WouldYouRatherCard] = [
        WouldYouRatherCard(optionA: "O seara romantica la restaurant", optionAEn: "A romantic dinner at a restaurant", optionB: "O seara intima acasa cu lumanari", optionBEn: "An intimate evening at home with candles", category: "Romantic", categoryEn: "Romantic"),
        WouldYouRatherCard(optionA: "Un masaj de o ora", optionAEn: "A one-hour massage", optionB: "O baie fierbinte impreuna", optionBEn: "A hot bath together", category: "Relaxare", categoryEn: "Relaxation"),
        WouldYouRatherCard(optionA: "Sex spontan intr-un loc neobisnuit", optionAEn: "Spontaneous sex in an unusual place", optionB: "O noapte lunga si planificata in dormitor", optionBEn: "A long, planned night in the bedroom", category: "Aventura", categoryEn: "Adventure"),
        WouldYouRatherCard(optionA: "Sa fiti legati la ochi", optionAEn: "To be blindfolded", optionB: "Sa fiti legati de pat", optionBEn: "To be tied to the bed", category: "Indraznet", categoryEn: "Bold"),
        WouldYouRatherCard(optionA: "Dimineata lenta in pat", optionAEn: "Slow morning in bed", optionB: "Seara tarzie cu vin si muzica", optionBEn: "Late evening with wine and music", category: "Timp", categoryEn: "Time"),
        WouldYouRatherCard(optionA: "Un weekend la munte, doar voi doi", optionAEn: "A mountain weekend, just the two of you", optionB: "Un weekend la mare, doar voi doi", optionBEn: "A beach weekend, just the two of you", category: "Destinatie", categoryEn: "Destination"),
        WouldYouRatherCard(optionA: "Sa primesti un masaj senzual", optionAEn: "To receive a sensual massage", optionB: "Sa oferi un masaj senzual", optionBEn: "To give a sensual massage", category: "Atingere", categoryEn: "Touch"),
        WouldYouRatherCard(optionA: "Sa experimentati role-play", optionAEn: "To experiment with role-play", optionB: "Sa experimentati jucarii noi", optionBEn: "To experiment with new toys", category: "Indraznet", categoryEn: "Bold"),
        WouldYouRatherCard(optionA: "Sa va spuneti fanteziile", optionAEn: "To share your fantasies", optionB: "Sa le puneti in practica fara sa vorbiti", optionBEn: "To act them out without talking", category: "Comunicare", categoryEn: "Communication"),
        WouldYouRatherCard(optionA: "Lumina aprinsa", optionAEn: "Lights on", optionB: "Intuneric total", optionBEn: "Total darkness", category: "Atmosfera", categoryEn: "Atmosphere"),
        WouldYouRatherCard(optionA: "Muzica romantica in fundal", optionAEn: "Romantic music in the background", optionB: "Liniste completa", optionBEn: "Complete silence", category: "Atmosfera", categoryEn: "Atmosphere"),
        WouldYouRatherCard(optionA: "Sa incercati 3 pozitii noi intr-o seara", optionAEn: "To try 3 new positions in one evening", optionB: "Sa perfectionati pozitia voastra preferata", optionBEn: "To perfect your favorite position", category: "Explorare", categoryEn: "Exploration"),
        WouldYouRatherCard(optionA: "Mic dejun in pat dupa o noapte de pasiune", optionAEn: "Breakfast in bed after a night of passion", optionB: "Cina romantica inainte de o noapte de pasiune", optionBEn: "Romantic dinner before a night of passion", category: "Romantic", categoryEn: "Romantic"),
        WouldYouRatherCard(optionA: "Sa scrieti scrisori de dragoste", optionAEn: "To write love letters", optionB: "Sa va trimiteti mesaje provocatoare", optionBEn: "To send each other provocative messages", category: "Comunicare", categoryEn: "Communication"),
        WouldYouRatherCard(optionA: "Vacanta la Paris, orasul iubirii", optionAEn: "Vacation in Paris, city of love", optionB: "Vacanta pe o insula privata tropicala", optionBEn: "Vacation on a private tropical island", category: "Destinatie", categoryEn: "Destination"),
    ]
    
    // MARK: - Dice Actions
    static let diceActions: [DiceAction] = [
        DiceAction(action: "Saruta", actionEn: "Kiss", bodyPart: "buzele", bodyPartEn: "the lips", duration: "30 secunde", durationEn: "30 seconds", icon: "mouth.fill"),
        DiceAction(action: "Maseaza", actionEn: "Massage", bodyPart: "umerii", bodyPartEn: "the shoulders", duration: "2 minute", durationEn: "2 minutes", icon: "hand.raised.fill"),
        DiceAction(action: "Saruta", actionEn: "Kiss", bodyPart: "gatul", bodyPartEn: "the neck", duration: "1 minut", durationEn: "1 minute", icon: "mouth.fill"),
        DiceAction(action: "Mangaie", actionEn: "Caress", bodyPart: "spatele", bodyPartEn: "the back", duration: "1 minut", durationEn: "1 minute", icon: "hand.draw.fill"),
        DiceAction(action: "Sufla usor pe", actionEn: "Gently blow on", bodyPart: "urechea", bodyPartEn: "the ear", duration: "30 secunde", durationEn: "30 seconds", icon: "wind"),
        DiceAction(action: "Saruta", actionEn: "Kiss", bodyPart: "mana", bodyPartEn: "the hand", duration: "30 secunde", durationEn: "30 seconds", icon: "mouth.fill"),
        DiceAction(action: "Maseaza", actionEn: "Massage", bodyPart: "picioarele", bodyPartEn: "the feet", duration: "2 minute", durationEn: "2 minutes", icon: "hand.raised.fill"),
        DiceAction(action: "Atinge usor", actionEn: "Lightly touch", bodyPart: "fata", bodyPartEn: "the face", duration: "1 minut", durationEn: "1 minute", icon: "hand.point.up.fill"),
        DiceAction(action: "Imbratiseaza si tine", actionEn: "Hug and hold", bodyPart: "tot corpul", bodyPartEn: "the whole body", duration: "2 minute", durationEn: "2 minutes", icon: "figure.2.arms.open"),
        DiceAction(action: "Saruta", actionEn: "Kiss", bodyPart: "fruntea", bodyPartEn: "the forehead", duration: "10 secunde", durationEn: "10 seconds", icon: "mouth.fill"),
        DiceAction(action: "Mangaie", actionEn: "Caress", bodyPart: "parul", bodyPartEn: "the hair", duration: "1 minut", durationEn: "1 minute", icon: "hand.draw.fill"),
        DiceAction(action: "Maseaza", actionEn: "Massage", bodyPart: "talia", bodyPartEn: "the waist", duration: "1 minut", durationEn: "1 minute", icon: "hand.raised.fill"),
        DiceAction(action: "Atinge delicat", actionEn: "Gently touch", bodyPart: "bratele", bodyPartEn: "the arms", duration: "30 secunde", durationEn: "30 seconds", icon: "hand.point.up.fill"),
        DiceAction(action: "Saruta drumul de la", actionEn: "Kiss the path from", bodyPart: "mana pana la umar", bodyPartEn: "hand to shoulder", duration: "1 minut", durationEn: "1 minute", icon: "mouth.fill"),
        DiceAction(action: "Priveste in ochi si tine", actionEn: "Look into eyes and hold", bodyPart: "mainile", bodyPartEn: "the hands", duration: "1 minut", durationEn: "1 minute", icon: "eye.fill"),
        DiceAction(action: "Maseaza", actionEn: "Massage", bodyPart: "degetele", bodyPartEn: "the fingers", duration: "1 minut", durationEn: "1 minute", icon: "hand.raised.fill"),
    ]
    
    // MARK: - Quiz Questions
    static let quizQuestions: [QuizQuestion] = [
        QuizQuestion(question: "Care este limba iubirii cea mai importanta?", questionEn: "What is the most important love language?", options: ["Cuvinte de afirmare", "Timp de calitate", "Cadouri", "Toate sunt importante"], optionsEn: ["Words of affirmation", "Quality time", "Gifts", "All are important"], correctIndex: 3, explanation: "Toate cele 5 limbi ale iubirii sunt importante. Fiecare persoana are preferinta sa.", explanationEn: "All 5 love languages are important. Each person has their preference."),
        QuizQuestion(question: "Cat timp ar trebui sa dureze preludiul ideal?", questionEn: "How long should ideal foreplay last?", options: ["5 minute", "10-15 minute", "15-30 minute", "Nu exista timp ideal"], optionsEn: ["5 minutes", "10-15 minutes", "15-30 minutes", "There is no ideal time"], correctIndex: 3, explanation: "Nu exista un timp ideal universal. Comunicarea cu partenerul este cheia.", explanationEn: "There is no universal ideal time. Communication with your partner is key."),
        QuizQuestion(question: "Ce hormon este eliberat in timpul sarutului?", questionEn: "What hormone is released during kissing?", options: ["Adrenalina", "Oxitocina", "Cortizol", "Melatonina"], optionsEn: ["Adrenaline", "Oxytocin", "Cortisol", "Melatonin"], correctIndex: 1, explanation: "Oxitocina, hormonul iubirii, este eliberat in timpul sarutului si intareste legatura emotionala.", explanationEn: "Oxytocin, the love hormone, is released during kissing and strengthens the emotional bond."),
        QuizQuestion(question: "Care este cel mai important factor intr-o relatie intima?", questionEn: "What is the most important factor in an intimate relationship?", options: ["Atractia fizica", "Comunicarea", "Experienta", "Frecventa"], optionsEn: ["Physical attraction", "Communication", "Experience", "Frequency"], correctIndex: 1, explanation: "Comunicarea deschisa si sincera este baza unei relatii intime sanatoase.", explanationEn: "Open and honest communication is the foundation of a healthy intimate relationship."),
        QuizQuestion(question: "Kamasutra a fost scrisa in ce tara?", questionEn: "In which country was the Kamasutra written?", options: ["China", "Japonia", "India", "Egipt"], optionsEn: ["China", "Japan", "India", "Egypt"], correctIndex: 2, explanation: "Kamasutra a fost scrisa in India antica de Vatsyayana, in secolul al III-lea.", explanationEn: "The Kamasutra was written in ancient India by Vatsyayana in the 3rd century."),
        QuizQuestion(question: "Cate pozitii contine Kamasutra originala?", questionEn: "How many positions does the original Kamasutra contain?", options: ["57", "64", "100+", "36"], optionsEn: ["57", "64", "100+", "36"], correctIndex: 1, explanation: "Kamasutra originala descrie 64 de arte, inclusiv pozitii si tehnici.", explanationEn: "The original Kamasutra describes 64 arts, including positions and techniques."),
        QuizQuestion(question: "Ce zona este considerata cea mai erogena?", questionEn: "What zone is considered the most erogenous?", options: ["Gatul", "Urechea", "Creierul", "Buzele"], optionsEn: ["The neck", "The ear", "The brain", "The lips"], correctIndex: 2, explanation: "Creierul este cel mai mare organ sexual. Excitarea incepe in minte.", explanationEn: "The brain is the largest sexual organ. Arousal begins in the mind."),
        QuizQuestion(question: "Care este beneficiul principal al contactului vizual in timpul intimitatii?", questionEn: "What is the main benefit of eye contact during intimacy?", options: ["Arata dominanta", "Creste conexiunea emotionala", "Este o traditie", "Nu are beneficii"], optionsEn: ["Shows dominance", "Increases emotional connection", "It's a tradition", "No benefits"], correctIndex: 1, explanation: "Contactul vizual elibereaza oxitocina si creste semnificativ conexiunea emotionala.", explanationEn: "Eye contact releases oxytocin and significantly increases emotional connection."),
        QuizQuestion(question: "Ce tehnica de respiratie ajuta la relaxare in cuplu?", questionEn: "What breathing technique helps couple relaxation?", options: ["Respiratie rapida", "Respiratie sincronizata", "Retinerea respiratiei", "Nu conteaza"], optionsEn: ["Rapid breathing", "Synchronized breathing", "Holding breath", "It doesn't matter"], correctIndex: 1, explanation: "Respiratia sincronizata cu partenerul creste intimitatea si relaxarea.", explanationEn: "Synchronized breathing with your partner increases intimacy and relaxation."),
        QuizQuestion(question: "Care este efectul masajului asupra relatiei?", questionEn: "What is the effect of massage on a relationship?", options: ["Doar relaxare fizica", "Creste increderea si intimitatea", "Nu are efect", "Doar placere fizica"], optionsEn: ["Only physical relaxation", "Increases trust and intimacy", "No effect", "Only physical pleasure"], correctIndex: 1, explanation: "Masajul creste nivelul de oxitocina, reducand stresul si crescand increderea reciproca.", explanationEn: "Massage increases oxytocin levels, reducing stress and increasing mutual trust."),
    ]
    
    // MARK: - Challenge Cards
    static let challenges: [ChallengeCard] = [
        ChallengeCard(title: "Seara fara Telefon", titleEn: "Phone-Free Evening", description: "Petreceti o seara intreaga fara telefoane. Concentrati-va doar pe voi.", descriptionEn: "Spend an entire evening without phones. Focus only on each other.", duration: "O seara", durationEn: "One evening", difficulty: "Usor", difficultyEn: "Easy", icon: "iphone.slash"),
        ChallengeCard(title: "Masajul Surpriza", titleEn: "Surprise Massage", description: "Pregateste un masaj complet surpriza pentru partenerul tau cu uleiuri.", descriptionEn: "Prepare a complete surprise massage for your partner with oils.", duration: "30 min", durationEn: "30 min", difficulty: "Usor", difficultyEn: "Easy", icon: "hand.raised.fill"),
        ChallengeCard(title: "Scrisoare de Dragoste", titleEn: "Love Letter", description: "Scrieti fiecare o scrisoare de dragoste si cititi-le impreuna seara.", descriptionEn: "Each write a love letter and read them together in the evening.", duration: "1 ora", durationEn: "1 hour", difficulty: "Usor", difficultyEn: "Easy", icon: "envelope.fill"),
        ChallengeCard(title: "Gatiti Impreuna", titleEn: "Cook Together", description: "Alegeti o reteta noua si gatiti impreuna o cina romantica.", descriptionEn: "Choose a new recipe and cook a romantic dinner together.", duration: "2 ore", durationEn: "2 hours", difficulty: "Mediu", difficultyEn: "Medium", icon: "fork.knife"),
        ChallengeCard(title: "Dans in Doi", titleEn: "Dance for Two", description: "Puneti muzica preferata si dansati impreuna in sufragerie.", descriptionEn: "Put on your favorite music and dance together in the living room.", duration: "30 min", durationEn: "30 min", difficulty: "Usor", difficultyEn: "Easy", icon: "music.note"),
        ChallengeCard(title: "Baie Romantica", titleEn: "Romantic Bath", description: "Pregatiti o baie cu lumanari, muzica si spuma pentru doi.", descriptionEn: "Prepare a bath with candles, music and bubbles for two.", duration: "1 ora", durationEn: "1 hour", difficulty: "Mediu", difficultyEn: "Medium", icon: "drop.fill"),
        ChallengeCard(title: "Pozitia Saptamanii", titleEn: "Position of the Week", description: "Alegeti o pozitie noua din aplicatie si incercati-o impreuna.", descriptionEn: "Choose a new position from the app and try it together.", duration: "O seara", durationEn: "One evening", difficulty: "Mediu", difficultyEn: "Medium", icon: "star.fill"),
        ChallengeCard(title: "Joc de Rol", titleEn: "Role Play", description: "Inventati personaje noi si jucati un scenariu romantic.", descriptionEn: "Invent new characters and play a romantic scenario.", duration: "O seara", durationEn: "One evening", difficulty: "Avansat", difficultyEn: "Advanced", icon: "theatermasks.fill"),
        ChallengeCard(title: "Fotografii de Cuplu", titleEn: "Couple Photos", description: "Faceti o sedinta foto romantica, doar pentru voi.", descriptionEn: "Have a romantic photo session, just for you.", duration: "1 ora", durationEn: "1 hour", difficulty: "Mediu", difficultyEn: "Medium", icon: "camera.fill"),
        ChallengeCard(title: "Mic Dejun in Pat", titleEn: "Breakfast in Bed", description: "Trezeste-te devreme si pregateste mic dejun surpriza in pat.", descriptionEn: "Wake up early and prepare a surprise breakfast in bed.", duration: "1 ora", durationEn: "1 hour", difficulty: "Usor", difficultyEn: "Easy", icon: "cup.and.saucer.fill"),
        ChallengeCard(title: "Explorare Senzoriala", titleEn: "Sensory Exploration", description: "Cu ochii legati, exploreaza senzatii noi: miere, gheata, pene.", descriptionEn: "Blindfolded, explore new sensations: honey, ice, feathers.", duration: "30 min", durationEn: "30 min", difficulty: "Avansat", difficultyEn: "Advanced", icon: "eye.slash.fill"),
        ChallengeCard(title: "Zi a Complimentelor", titleEn: "Compliment Day", description: "Trimiteti-va cel putin 10 complimente sincere pe parcursul zilei.", descriptionEn: "Send each other at least 10 sincere compliments throughout the day.", duration: "O zi", durationEn: "One day", difficulty: "Usor", difficultyEn: "Easy", icon: "heart.text.square.fill"),
        ChallengeCard(title: "Noapte de Film", titleEn: "Movie Night", description: "Alegeti un film romantic si priviti-l imbratisati sub patura.", descriptionEn: "Choose a romantic movie and watch it cuddled under a blanket.", duration: "2 ore", durationEn: "2 hours", difficulty: "Usor", difficultyEn: "Easy", icon: "play.rectangle.fill"),
        ChallengeCard(title: "Striptease", titleEn: "Striptease", description: "Pregatiti o prezentare seducatoare pentru partenerul vostru.", descriptionEn: "Prepare a seductive performance for your partner.", duration: "30 min", durationEn: "30 min", difficulty: "Avansat", difficultyEn: "Advanced", icon: "sparkles"),
        ChallengeCard(title: "Lista Dorintelor", titleEn: "Wish List", description: "Scrieti fiecare 5 dorinte secrete si schimbati listele.", descriptionEn: "Each write 5 secret wishes and exchange lists.", duration: "30 min", durationEn: "30 min", difficulty: "Mediu", difficultyEn: "Medium", icon: "list.clipboard.fill"),
    ]
    
    // MARK: - Spin the Bottle Actions
    static let spinActions: [SpinAction] = [
        SpinAction(text: "Saruta partenerul pe buze timp de 10 secunde", textEn: "Kiss your partner on the lips for 10 seconds", intensity: 1, icon: "mouth.fill"),
        SpinAction(text: "Fa-i partenerului un compliment seducator", textEn: "Give your partner a seductive compliment", intensity: 1, icon: "heart.text.square.fill"),
        SpinAction(text: "Maseaza umerii partenerului timp de 1 minut", textEn: "Massage your partner's shoulders for 1 minute", intensity: 1, icon: "hand.raised.fill"),
        SpinAction(text: "Sopteste o fantezie la urechea partenerului", textEn: "Whisper a fantasy in your partner's ear", intensity: 2, icon: "ear.fill"),
        SpinAction(text: "Danseaza lent cu partenerul 30 secunde", textEn: "Slow dance with your partner for 30 seconds", intensity: 2, icon: "music.note"),
        SpinAction(text: "Saruta gatul partenerului de 5 ori", textEn: "Kiss your partner's neck 5 times", intensity: 2, icon: "mouth.fill"),
        SpinAction(text: "Priveste fix in ochii partenerului 30 secunde", textEn: "Stare into your partner's eyes for 30 seconds", intensity: 2, icon: "eye.fill"),
        SpinAction(text: "Scoate o piesa vestimentara", textEn: "Remove one clothing item", intensity: 3, icon: "tshirt.fill"),
        SpinAction(text: "Fa un dans seducator de 30 secunde", textEn: "Do a seductive dance for 30 seconds", intensity: 3, icon: "figure.dance"),
        SpinAction(text: "Atinge partenerul doar cu buzele timp de 1 minut", textEn: "Touch your partner only with lips for 1 minute", intensity: 3, icon: "mouth.fill"),
        SpinAction(text: "Imita cel mai seducator sunet", textEn: "Make the most seductive sound", intensity: 3, icon: "speaker.wave.2.fill"),
        SpinAction(text: "Fa-i partenerului un masaj senzual pe spate", textEn: "Give your partner a sensual back massage", intensity: 4, icon: "hand.raised.fill"),
        SpinAction(text: "Leaga-ti partenerul la ochi si saruta-l", textEn: "Blindfold your partner and kiss them", intensity: 4, icon: "eye.slash.fill"),
        SpinAction(text: "Demonstreaza o pozitie din aplicatie", textEn: "Demonstrate a position from the app", intensity: 5, icon: "star.fill"),
        SpinAction(text: "Strip-tease de 1 minut", textEn: "1-minute striptease", intensity: 5, icon: "sparkles"),
    ]
    
    // MARK: - Fantasy Cards
    static let fantasyCards: [FantasyCard] = [
        FantasyCard(title: "Intalnirea Secreta", titleEn: "Secret Meeting", description: "Imaginati-va ca va intalniti pentru prima data intr-un bar. Flirtati ca si cum nu v-ati cunoaste.", descriptionEn: "Imagine meeting for the first time in a bar. Flirt as if you don't know each other.", category: "Role-play", categoryEn: "Role-play", intensity: 2, icon: "person.2.fill"),
        FantasyCard(title: "Vacanta Tropicala", titleEn: "Tropical Vacation", description: "Creati atmosfera unei insule tropicale: muzica, lumini calde, bauturi exotice.", descriptionEn: "Create the atmosphere of a tropical island: music, warm lights, exotic drinks.", category: "Atmosfera", categoryEn: "Atmosphere", intensity: 1, icon: "sun.max.fill"),
        FantasyCard(title: "Masajul Tantric", titleEn: "Tantric Massage", description: "Un masaj complet al corpului cu uleiuri, lumanari si respiratie sincronizata.", descriptionEn: "A full body massage with oils, candles and synchronized breathing.", category: "Senzorial", categoryEn: "Sensory", intensity: 3, icon: "hands.sparkles.fill"),
        FantasyCard(title: "Fotograf si Model", titleEn: "Photographer & Model", description: "Unul fotografiaza, celalalt pozeaza din ce in ce mai indraznet.", descriptionEn: "One photographs, the other poses more and more boldly.", category: "Role-play", categoryEn: "Role-play", intensity: 3, icon: "camera.fill"),
        FantasyCard(title: "Seara cu Ciocolata", titleEn: "Chocolate Evening", description: "Folositi ciocolata topita pentru a desena pe corpul partenerului.", descriptionEn: "Use melted chocolate to draw on your partner's body.", category: "Senzorial", categoryEn: "Sensory", intensity: 3, icon: "cup.and.saucer.fill"),
        FantasyCard(title: "Maestru si Elev", titleEn: "Teacher & Student", description: "Unul invata celalalt tehnici noi, pas cu pas, cu rabdare.", descriptionEn: "One teaches the other new techniques, step by step, with patience.", category: "Role-play", categoryEn: "Role-play", intensity: 2, icon: "book.fill"),
        FantasyCard(title: "Dansul Pasiunii", titleEn: "Dance of Passion", description: "Invatati un dans senzual impreuna: tango sau bachata.", descriptionEn: "Learn a sensual dance together: tango or bachata.", category: "Activitate", categoryEn: "Activity", intensity: 2, icon: "figure.dance"),
        FantasyCard(title: "Exploratorul", titleEn: "The Explorer", description: "Cu ochii legati, explorati corpul partenerului doar prin atingere.", descriptionEn: "Blindfolded, explore your partner's body only through touch.", category: "Senzorial", categoryEn: "Sensory", intensity: 4, icon: "hand.point.up.fill"),
        FantasyCard(title: "Seara Japoneza", titleEn: "Japanese Evening", description: "Creati o atmosfera zen: ceai, masaj shiatsu, liniste si conexiune.", descriptionEn: "Create a zen atmosphere: tea, shiatsu massage, silence and connection.", category: "Atmosfera", categoryEn: "Atmosphere", intensity: 2, icon: "leaf.fill"),
        FantasyCard(title: "Strip Poker Romantic", titleEn: "Romantic Strip Poker", description: "Jucati carti cu reguli speciale: cine pierde, pierde o haina.", descriptionEn: "Play cards with special rules: who loses, loses a garment.", category: "Joc", categoryEn: "Game", intensity: 3, icon: "suit.heart.fill"),
        FantasyCard(title: "Scenariu de Film", titleEn: "Movie Scenario", description: "Recreati o scena romantica din filmul vostru preferat.", descriptionEn: "Recreate a romantic scene from your favorite movie.", category: "Role-play", categoryEn: "Role-play", intensity: 2, icon: "film.fill"),
        FantasyCard(title: "Noapte Sub Stele", titleEn: "Night Under the Stars", description: "Creati un cort in camera cu lumini si muzica, ca sub stele.", descriptionEn: "Create a tent in the room with lights and music, as under the stars.", category: "Atmosfera", categoryEn: "Atmosphere", intensity: 1, icon: "star.fill"),
    ]
    
    // MARK: - Bingo Items (5x5 grid = 25 items)
    static let bingoItems: [BingoItem] = [
        BingoItem(text: "Sarut de 1 minut", textEn: "1-minute kiss"),
        BingoItem(text: "Masaj la umeri", textEn: "Shoulder massage"),
        BingoItem(text: "Compliment sincer", textEn: "Sincere compliment"),
        BingoItem(text: "Dans lent impreuna", textEn: "Slow dance together"),
        BingoItem(text: "Imbratisare lunga", textEn: "Long hug"),
        BingoItem(text: "Sarut pe gat", textEn: "Neck kiss"),
        BingoItem(text: "Declaratie de dragoste", textEn: "Love declaration"),
        BingoItem(text: "Masaj pe picioare", textEn: "Foot massage"),
        BingoItem(text: "Contact vizual 30s", textEn: "Eye contact 30s"),
        BingoItem(text: "Soptire romantica", textEn: "Romantic whisper"),
        BingoItem(text: "Mangaiere pe par", textEn: "Hair caress"),
        BingoItem(text: "Sarut pe frunte", textEn: "Forehead kiss"),
        BingoItem(text: "BONUS LIBER", textEn: "FREE BONUS"),
        BingoItem(text: "Tinutul de mana", textEn: "Holding hands"),
        BingoItem(text: "Sarut pe mana", textEn: "Hand kiss"),
        BingoItem(text: "Spune 3 motive de iubire", textEn: "Say 3 reasons for love"),
        BingoItem(text: "Masaj pe spate", textEn: "Back massage"),
        BingoItem(text: "Sarut surpriza", textEn: "Surprise kiss"),
        BingoItem(text: "Atingere delicata", textEn: "Gentle touch"),
        BingoItem(text: "Cantati impreuna", textEn: "Sing together"),
        BingoItem(text: "Baie impreuna", textEn: "Bath together"),
        BingoItem(text: "Mic dejun in pat", textEn: "Breakfast in bed"),
        BingoItem(text: "Film romantic", textEn: "Romantic movie"),
        BingoItem(text: "Cina la lumanare", textEn: "Candlelight dinner"),
        BingoItem(text: "Pozitie noua", textEn: "New position"),
    ]
    
    // MARK: - Countdown Challenges
    static let countdownChallenges: [CountdownChallenge] = [
        CountdownChallenge(text: "Priviti-va in ochi fara sa clipiti", textEn: "Look into each other's eyes without blinking", duration: 30, intensity: 1),
        CountdownChallenge(text: "Maseaza mainile partenerului", textEn: "Massage your partner's hands", duration: 60, intensity: 1),
        CountdownChallenge(text: "Saruta-ti partenerul pe obraz de 10 ori", textEn: "Kiss your partner on the cheek 10 times", duration: 30, intensity: 1),
        CountdownChallenge(text: "Sopteste lucruri frumoase la urechea partenerului", textEn: "Whisper beautiful things in your partner's ear", duration: 60, intensity: 2),
        CountdownChallenge(text: "Masaj senzual pe umeri si gat", textEn: "Sensual shoulder and neck massage", duration: 90, intensity: 2),
        CountdownChallenge(text: "Danseaza incet si aproape", textEn: "Dance slowly and close together", duration: 60, intensity: 2),
        CountdownChallenge(text: "Saruta gatul partenerului incet", textEn: "Slowly kiss your partner's neck", duration: 60, intensity: 3),
        CountdownChallenge(text: "Atinge corpul partenerului doar cu degetele", textEn: "Touch your partner's body only with fingertips", duration: 90, intensity: 3),
        CountdownChallenge(text: "Fa cel mai senzual dans pe care il poti", textEn: "Do the most sensual dance you can", duration: 60, intensity: 4),
        CountdownChallenge(text: "Masaj complet cu uleiuri", textEn: "Complete massage with oils", duration: 120, intensity: 4),
        CountdownChallenge(text: "Demonstreaza pozitia ta preferata", textEn: "Demonstrate your favorite position", duration: 60, intensity: 5),
        CountdownChallenge(text: "Strip-tease complet", textEn: "Full striptease", duration: 90, intensity: 5),
    ]
    
    // MARK: - Mystery Box Items
    static let mysteryBoxItems: [MysteryBoxItem] = [
        MysteryBoxItem(text: "Saruta partenerul pe buzele timp de 20 secunde", textEn: "Kiss your partner on the lips for 20 seconds", icon: "mouth.fill", intensity: 1),
        MysteryBoxItem(text: "Fa 5 complimente sincere", textEn: "Give 5 sincere compliments", icon: "heart.text.square.fill", intensity: 1),
        MysteryBoxItem(text: "Masaj la picioare 2 minute", textEn: "Foot massage for 2 minutes", icon: "hand.raised.fill", intensity: 1),
        MysteryBoxItem(text: "Danseaza romantic cu partenerul", textEn: "Dance romantically with your partner", icon: "music.note", intensity: 2),
        MysteryBoxItem(text: "Spune cel mai frumos lucru despre partener", textEn: "Say the most beautiful thing about your partner", icon: "bubble.left.fill", intensity: 1),
        MysteryBoxItem(text: "Masaj senzual pe spate cu ulei", textEn: "Sensual back massage with oil", icon: "hand.raised.fill", intensity: 3),
        MysteryBoxItem(text: "Saruta fiecare deget al partenerului", textEn: "Kiss each of your partner's fingers", icon: "mouth.fill", intensity: 2),
        MysteryBoxItem(text: "Imbratisare stransa 1 minut", textEn: "Tight hug for 1 minute", icon: "figure.2.arms.open", intensity: 1),
        MysteryBoxItem(text: "Scrie un mesaj de dragoste pe spatele partenerului", textEn: "Write a love message on your partner's back", icon: "pencil", intensity: 2),
        MysteryBoxItem(text: "Priveste in ochii partenerului si spune ce simti", textEn: "Look into your partner's eyes and say what you feel", icon: "eye.fill", intensity: 2),
        MysteryBoxItem(text: "Strip-tease rapid", textEn: "Quick striptease", icon: "sparkles", intensity: 4),
        MysteryBoxItem(text: "Alege o pozitie noua si incearc-o", textEn: "Choose a new position and try it", icon: "star.fill", intensity: 5),
    ]
    
    // MARK: - Tempo Challenges
    static let tempoChallenges: [TempoChallenge] = [
        TempoChallenge(text: "Tineti-va de maini si priviti-va in ochi", textEn: "Hold hands and look into each other's eyes", duration: 20, level: 1),
        TempoChallenge(text: "Maseaza usor mainile partenerului", textEn: "Gently massage your partner's hands", duration: 30, level: 1),
        TempoChallenge(text: "Saruta partenerul pe obraz", textEn: "Kiss your partner on the cheek", duration: 10, level: 1),
        TempoChallenge(text: "Imbratisati-va strans", textEn: "Hug each other tightly", duration: 30, level: 2),
        TempoChallenge(text: "Sopteste ceva dulce la ureche", textEn: "Whisper something sweet in their ear", duration: 20, level: 2),
        TempoChallenge(text: "Saruta gatul partenerului", textEn: "Kiss your partner's neck", duration: 30, level: 3),
        TempoChallenge(text: "Masaj pe umeri si gat", textEn: "Shoulder and neck massage", duration: 45, level: 3),
        TempoChallenge(text: "Danseaza aproape, corp la corp", textEn: "Dance close, body to body", duration: 40, level: 4),
        TempoChallenge(text: "Atinge usor corpul partenerului", textEn: "Gently touch your partner's body", duration: 45, level: 4),
        TempoChallenge(text: "Masaj senzual complet", textEn: "Full sensual massage", duration: 60, level: 5),
    ]
    
    // MARK: - Body Painting Prompts
    static let bodyPaintingPrompts: [(ro: String, en: String)] = [
        ("Deseneaza o inima pe pieptul partenerului", "Draw a heart on your partner's chest"),
        ("Scrie \"Te iubesc\" pe spatele partenerului", "Write \"I love you\" on your partner's back"),
        ("Deseneaza un fluture pe umarul partenerului", "Draw a butterfly on your partner's shoulder"),
        ("Fa un desen abstract pe burta partenerului", "Make an abstract drawing on your partner's belly"),
        ("Deseneaza o stea pe incheietura mainii", "Draw a star on the wrist"),
        ("Scrie un mesaj secret pe coapsa partenerului", "Write a secret message on your partner's thigh"),
        ("Deseneaza o floare pe umarul partenerului", "Draw a flower on your partner's shoulder"),
        ("Fa un traseu de sarut cu pensula", "Make a kiss trail with the brush"),
    ]
    
    // MARK: - Massage Roulette
    static let massageZones: [(ro: String, en: String)] = [
        ("Umeri", "Shoulders"), ("Spate", "Back"), ("Picioare", "Feet"),
        ("Maini", "Hands"), ("Gat", "Neck"), ("Talie", "Waist"),
        ("Brate", "Arms"), ("Scalp", "Scalp"), ("Fata", "Face"), ("Coapse", "Thighs"),
    ]
    
    static let massageTechniques: [(ro: String, en: String)] = [
        ("Framantare usoara", "Light kneading"), ("Presiune cu degetul mare", "Thumb pressure"),
        ("Miscari circulare", "Circular movements"), ("Atingere cu varful degetelor", "Fingertip touch"),
        ("Glisare lenta", "Slow glide"), ("Tapotare usoara", "Light tapping"),
        ("Presiune profunda", "Deep pressure"), ("Mangaiere cu palma", "Palm caress"),
    ]
    
    // MARK: - Love Story Prompts
    static let loveStoryPrompts: [(ro: String, en: String)] = [
        ("Intr-o seara magica, ei s-au intalnit la...", "On a magical evening, they met at..."),
        ("El/ea a spus ceva care a schimbat totul...", "He/she said something that changed everything..."),
        ("Prima lor intalnire a fost la...", "Their first date was at..."),
        ("Cel mai romantic lucru pe care l-au facut a fost...", "The most romantic thing they did was..."),
        ("Intr-o noapte instelata, ei au decis sa...", "On a starry night, they decided to..."),
        ("Cel mai frumos cadou pe care si l-au facut a fost...", "The most beautiful gift they gave each other was..."),
        ("Daca ar putea calatori oriunde, ar merge la...", "If they could travel anywhere, they would go to..."),
        ("Momentul in care au stiut ca e dragoste adevarata a fost cand...", "The moment they knew it was true love was when..."),
    ]
}
