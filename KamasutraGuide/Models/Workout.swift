import Foundation
import SwiftUI

// MARK: - Feature Data
class FeatureData {
    
    // MARK: - Romantic Quotes
    static let quotes: [RomanticQuote] = [
        RomanticQuote(text: "Iubirea nu se masoara in timp, ci in momente.", textEn: "Love is not measured in time, but in moments.", author: "Anonim", category: .love),
        RomanticQuote(text: "Esti tot ce am visat vreodata si tot ce nu stiam ca am nevoie.", textEn: "You are everything I ever dreamed of and everything I didn't know I needed.", author: "Anonim", category: .romance),
        RomanticQuote(text: "In bratele tale am gasit casa mea.", textEn: "In your arms I found my home.", author: "Anonim", category: .love),
        RomanticQuote(text: "Cel mai frumos lucru pe care il pot face ochii mei este sa te priveasca.", textEn: "The most beautiful thing my eyes can do is look at you.", author: "Anonim", category: .romance),
        RomanticQuote(text: "Iubirea adevarata nu are final fericit, pentru ca iubirea adevarata nu se termina niciodata.", textEn: "True love doesn't have a happy ending, because true love never ends.", author: "Anonim", category: .wisdom),
        RomanticQuote(text: "Nu esti doar iubirea vietii mele, esti viata iubirii mele.", textEn: "You are not just the love of my life, you are the life of my love.", author: "Anonim", category: .passion),
        RomanticQuote(text: "Fiecare poveste de iubire este frumoasa, dar a noastra este preferata mea.", textEn: "Every love story is beautiful, but ours is my favorite.", author: "Anonim", category: .romance),
        RomanticQuote(text: "Iubirea este compusa dintr-un singur suflet care locuieste in doua corpuri.", textEn: "Love is composed of a single soul inhabiting two bodies.", author: "Aristotel", category: .wisdom),
        RomanticQuote(text: "Unde exista iubire, exista viata.", textEn: "Where there is love, there is life.", author: "Mahatma Gandhi", category: .wisdom),
        RomanticQuote(text: "Iubirea nu face lumea sa se invarta. Iubirea face ca plimbarea sa merite.", textEn: "Love doesn't make the world go round. Love makes the ride worthwhile.", author: "Franklin P. Jones", category: .humor),
        RomanticQuote(text: "A iubi si a fi iubit este a simti soarele din ambele parti.", textEn: "To love and be loved is to feel the sun from both sides.", author: "David Viscott", category: .love),
        RomanticQuote(text: "Cel mai bun lucru la care sa te tii in viata este unul de celalalt.", textEn: "The best thing to hold onto in life is each other.", author: "Audrey Hepburn", category: .wisdom),
        RomanticQuote(text: "Pasiunea face lumea sa se invarta intr-un mod mai frumos.", textEn: "Passion makes the world turn in a more beautiful way.", author: "Anonim", category: .passion),
        RomanticQuote(text: "Inima care iubeste este mereu tanara.", textEn: "The heart that loves is always young.", author: "Proverb grecesc", category: .love),
        RomanticQuote(text: "Iubirea este prietenia aprinsa.", textEn: "Love is friendship set on fire.", author: "Jeremy Taylor", category: .passion),
        RomanticQuote(text: "Atingerea ta este promisiunea mea de fericire.", textEn: "Your touch is my promise of happiness.", author: "Anonim", category: .passion),
        RomanticQuote(text: "Casatoria fericita este o conversatie lunga care pare intotdeauna prea scurta.", textEn: "A happy marriage is a long conversation that always seems too short.", author: "Andre Maurois", category: .humor),
        RomanticQuote(text: "Nu am nevoie de paradis pentru ca te-am gasit pe tine.", textEn: "I don't need paradise because I found you.", author: "Anonim", category: .romance),
        RomanticQuote(text: "Iubirea este cel mai frumos vis si cel mai real adevar.", textEn: "Love is the most beautiful dream and the most real truth.", author: "Anonim", category: .love),
        RomanticQuote(text: "Viata fara iubire este ca un copac fara flori.", textEn: "Life without love is like a tree without flowers.", author: "Khalil Gibran", category: .wisdom),
    ]
    
    // MARK: - Date Night Ideas
    static let dateNightIdeas: [DateNightIdea] = [
        DateNightIdea(title: "Cina Romantica Acasa", titleEn: "Romantic Dinner at Home", description: "Gatiti impreuna o reteta noua, aprindeti lumanari si puneti muzica.", descriptionEn: "Cook a new recipe together, light candles and play music.", icon: "\u{1F56F}", category: "Acasa", categoryEn: "Home", budget: "Mic", budgetEn: "Low", duration: "2-3 ore", durationEn: "2-3 hours"),
        DateNightIdea(title: "Picnic sub Stele", titleEn: "Picnic Under the Stars", description: "Pregatiti un cos de picnic si mergeti intr-un loc cu vedere la stele.", descriptionEn: "Prepare a picnic basket and go to a stargazing spot.", icon: "\u{2B50}", category: "Afara", categoryEn: "Outdoors", budget: "Mic", budgetEn: "Low", duration: "2-3 ore", durationEn: "2-3 hours"),
        DateNightIdea(title: "Seara de Film", titleEn: "Movie Night", description: "Alegeti 2-3 filme romantice, faceti popcorn si cuibariti-va.", descriptionEn: "Choose 2-3 romantic movies, make popcorn and cuddle up.", icon: "\u{1F3AC}", category: "Acasa", categoryEn: "Home", budget: "Mic", budgetEn: "Low", duration: "3-4 ore", durationEn: "3-4 hours"),
        DateNightIdea(title: "Curs de Dans", titleEn: "Dance Class", description: "Invatati impreuna un dans nou - salsa, tango sau bachata.", descriptionEn: "Learn a new dance together - salsa, tango or bachata.", icon: "\u{1F483}", category: "Activitate", categoryEn: "Activity", budget: "Mediu", budgetEn: "Medium", duration: "1-2 ore", durationEn: "1-2 hours"),
        DateNightIdea(title: "Spa Acasa", titleEn: "Home Spa", description: "Creati o experienta de spa cu masti, masaj si baie cu spuma.", descriptionEn: "Create a spa experience with masks, massage and bubble bath.", icon: "\u{1F9D6}", category: "Acasa", categoryEn: "Home", budget: "Mic", budgetEn: "Low", duration: "2-3 ore", durationEn: "2-3 hours"),
        DateNightIdea(title: "Degustare de Vinuri", titleEn: "Wine Tasting", description: "Cumparati 3-4 vinuri noi si faceti o degustare cu branzeturi.", descriptionEn: "Buy 3-4 new wines and have a tasting with cheese.", icon: "\u{1F377}", category: "Acasa", categoryEn: "Home", budget: "Mediu", budgetEn: "Medium", duration: "2 ore", durationEn: "2 hours"),
        DateNightIdea(title: "Aventura Culinara", titleEn: "Culinary Adventure", description: "Incercati un restaurant cu o bucatarie pe care nu ati mai incercat-o.", descriptionEn: "Try a restaurant with cuisine you've never tried before.", icon: "\u{1F37D}", category: "Oras", categoryEn: "City", budget: "Mare", budgetEn: "High", duration: "2-3 ore", durationEn: "2-3 hours"),
        DateNightIdea(title: "Plimbare la Apus", titleEn: "Sunset Walk", description: "Mergeti la o plimbare romantica si urmariti apusul impreuna.", descriptionEn: "Go for a romantic walk and watch the sunset together.", icon: "\u{1F305}", category: "Afara", categoryEn: "Outdoors", budget: "Gratis", budgetEn: "Free", duration: "1-2 ore", durationEn: "1-2 hours"),
        DateNightIdea(title: "Jocuri de Societate", titleEn: "Board Games", description: "Alegeti jocuri de societate pentru doi si competiti amical.", descriptionEn: "Choose board games for two and compete in a friendly way.", icon: "\u{1F3B2}", category: "Acasa", categoryEn: "Home", budget: "Mic", budgetEn: "Low", duration: "2-3 ore", durationEn: "2-3 hours"),
        DateNightIdea(title: "Atelier Creativ", titleEn: "Creative Workshop", description: "Pictati, desenati sau faceti ceramica impreuna.", descriptionEn: "Paint, draw or make ceramics together.", icon: "\u{1F3A8}", category: "Activitate", categoryEn: "Activity", budget: "Mediu", budgetEn: "Medium", duration: "2-3 ore", durationEn: "2-3 hours"),
        DateNightIdea(title: "Karaoke Privat", titleEn: "Private Karaoke", description: "Inchiriati o camera de karaoke sau cantati acasa.", descriptionEn: "Rent a karaoke room or sing at home.", icon: "\u{1F3A4}", category: "Activitate", categoryEn: "Activity", budget: "Mediu", budgetEn: "Medium", duration: "2 ore", durationEn: "2 hours"),
        DateNightIdea(title: "Excursie Spontana", titleEn: "Spontaneous Trip", description: "Alegeti un oras apropiat si faceti o excursie de o zi.", descriptionEn: "Choose a nearby city and take a day trip.", icon: "\u{1F697}", category: "Aventura", categoryEn: "Adventure", budget: "Mediu", budgetEn: "Medium", duration: "O zi", durationEn: "One day"),
        DateNightIdea(title: "Fotografie de Cuplu", titleEn: "Couple Photography", description: "Faceti o sedinta foto impreuna in locuri frumoase.", descriptionEn: "Have a photo session together in beautiful places.", icon: "\u{1F4F8}", category: "Activitate", categoryEn: "Activity", budget: "Mic", budgetEn: "Low", duration: "2 ore", durationEn: "2 hours"),
        DateNightIdea(title: "Mic Dejun in Pat", titleEn: "Breakfast in Bed", description: "Pregatiti un mic dejun special si serviti-l in pat.", descriptionEn: "Prepare a special breakfast and serve it in bed.", icon: "\u{1F950}", category: "Acasa", categoryEn: "Home", budget: "Mic", budgetEn: "Low", duration: "1-2 ore", durationEn: "1-2 hours"),
        DateNightIdea(title: "Concert sau Spectacol", titleEn: "Concert or Show", description: "Mergeti la un concert, teatru sau spectacol de comedie.", descriptionEn: "Go to a concert, theater or comedy show.", icon: "\u{1F3B5}", category: "Oras", categoryEn: "City", budget: "Mare", budgetEn: "High", duration: "3-4 ore", durationEn: "3-4 hours"),
    ]
    
    // MARK: - Bucket List Items
    static let defaultBucketList: [BucketListItem] = [
        BucketListItem(title: "Urmariti rasaritul impreuna", description: "Treziti-va devreme si urmariti rasaritul dintr-un loc special.", icon: "\u{1F305}", category: "Romantic"),
        BucketListItem(title: "Scrieti scrisori de dragoste", description: "Scrieti fiecare o scrisoare si cititi-le impreuna.", icon: "\u{1F48C}", category: "Romantic"),
        BucketListItem(title: "Gatiti o reteta complicata", description: "Alegeti o reteta provocatoare si gatiti-o impreuna.", icon: "\u{1F468}\u{200D}\u{1F373}", category: "Acasa"),
        BucketListItem(title: "Dansati in ploaie", description: "Data viitoare cand ploua, iesiti si dansati.", icon: "\u{1F327}", category: "Aventura"),
        BucketListItem(title: "Faceti un road trip", description: "Planificati o calatorie cu masina fara destinatie fixa.", icon: "\u{1F697}", category: "Aventura"),
        BucketListItem(title: "Invatati ceva nou impreuna", description: "Alegeti un hobby nou si invatati-l impreuna.", icon: "\u{1F4DA}", category: "Dezvoltare"),
        BucketListItem(title: "Construiti un fort din perne", description: "Construiti un fort din perne si uitati-va la filme.", icon: "\u{1F3F0}", category: "Acasa"),
        BucketListItem(title: "Mergeti la un festival", description: "Participati la un festival de muzica sau mancare.", icon: "\u{1F3AA}", category: "Aventura"),
        BucketListItem(title: "Faceti voluntariat impreuna", description: "Gasiti o cauza care va pasioneaza si ajutati.", icon: "\u{1F91D}", category: "Dezvoltare"),
        BucketListItem(title: "Creati o capsula a timpului", description: "Puneti amintiri intr-o cutie si deschideti-o peste un an.", icon: "\u{1F4E6}", category: "Romantic"),
        BucketListItem(title: "Masaj de cuplu profesional", description: "Mergeti la un salon pentru un masaj de cuplu.", icon: "\u{1F486}", category: "Relaxare"),
        BucketListItem(title: "Plantati un copac impreuna", description: "Plantati un copac care sa creasca odata cu relatia.", icon: "\u{1F333}", category: "Romantic"),
        BucketListItem(title: "Faceti o baie la miezul noptii", description: "Pregatiti o baie romantica la ore tarzii.", icon: "\u{1F6C1}", category: "Romantic"),
        BucketListItem(title: "Incercati 10 pozitii noi", description: "Explorati impreuna 10 pozitii din aplicatie.", icon: "\u{2B50}", category: "Intim"),
        BucketListItem(title: "Petreceti o zi fara tehnologie", description: "O zi intreaga fara telefoane sau laptopuri.", icon: "\u{1F4F5}", category: "Dezvoltare"),
    ]
    
    // MARK: - Achievements
    static let achievements: [Achievement] = [
        Achievement(id: "explorer", name: "Explorator", nameEn: "Explorer", description: "Ai vizualizat 10 pozitii diferite", descriptionEn: "You viewed 10 different positions", icon: "\u{1F5FA}", requirement: "10 pozitii vizualizate", requirementEn: "10 positions viewed", color1: "FF6B8A", color2: "C44569"),
        Achievement(id: "collector", name: "Colectionar", nameEn: "Collector", description: "Ai adaugat 5 pozitii la favorite", descriptionEn: "You added 5 positions to favorites", icon: "\u{2B50}", requirement: "5 favorite", requirementEn: "5 favorites", color1: "FFB74D", color2: "FF8F00"),
        Achievement(id: "adventurer", name: "Aventurier", nameEn: "Adventurer", description: "Ai explorat toate categoriile", descriptionEn: "You explored all categories", icon: "\u{1F9ED}", requirement: "Toate categoriile", requirementEn: "All categories", color1: "A55EEA", color2: "8854D0"),
        Achievement(id: "gamer", name: "Jucator", nameEn: "Gamer", description: "Ai jucat toate cele 18 jocuri", descriptionEn: "You played all 18 games", icon: "\u{1F3AE}", requirement: "18 jocuri jucate", requirementEn: "18 games played", color1: "4FC3F7", color2: "0288D1"),
        Achievement(id: "romantic", name: "Romantic", nameEn: "Romantic", description: "Ai citit 20 de citate romantice", descriptionEn: "You read 20 romantic quotes", icon: "\u{1F495}", requirement: "20 citate citite", requirementEn: "20 quotes read", color1: "FF6B8A", color2: "FC5C7D"),
        Achievement(id: "planner", name: "Planificator", nameEn: "Planner", description: "Ai generat 5 idei de intalniri", descriptionEn: "You generated 5 date ideas", icon: "\u{1F4C5}", requirement: "5 date nights", requirementEn: "5 date nights", color1: "66BB6A", color2: "43A047"),
        Achievement(id: "mood_master", name: "Maestru Emotional", nameEn: "Mood Master", description: "Ai inregistrat starea 7 zile la rand", descriptionEn: "You tracked your mood for 7 consecutive days", icon: "\u{1F4CA}", requirement: "7 zile consecutive", requirementEn: "7 consecutive days", color1: "FF6348", color2: "EE5A24"),
        Achievement(id: "bucket_starter", name: "Incepator de Aventuri", nameEn: "Adventure Starter", description: "Ai completat 3 activitati din bucket list", descriptionEn: "You completed 3 activities from the bucket list", icon: "\u{2705}", requirement: "3 activitati", requirementEn: "3 activities", color1: "26C6DA", color2: "00ACC1"),
        Achievement(id: "quiz_master", name: "Maestru Quiz", nameEn: "Quiz Master", description: "Ai obtinut scor perfect la quiz", descriptionEn: "You got a perfect score on the quiz", icon: "\u{1F3C6}", requirement: "10/10 la quiz", requirementEn: "10/10 on quiz", color1: "FFD54F", color2: "FFC107"),
        Achievement(id: "love_expert", name: "Expert in Iubire", nameEn: "Love Expert", description: "Ai completat testul limbajului iubirii", descriptionEn: "You completed the love language test", icon: "\u{1F49D}", requirement: "Test completat", requirementEn: "Test completed", color1: "EC407A", color2: "C2185B"),
    ]
    
    // MARK: - Love Language Questions
    static let loveLanguageQuestions: [LoveLanguageQuestion] = [
        LoveLanguageQuestion(optionA: "Partenerul imi spune cat de mult ma apreciaza", optionAEn: "My partner tells me how much they appreciate me", optionB: "Partenerul ma imbratiseaza strans", optionBEn: "My partner hugs me tightly", languageA: .wordsOfAffirmation, languageB: .physicalTouch),
        LoveLanguageQuestion(optionA: "Petrecem timp de calitate impreuna fara distractii", optionAEn: "We spend quality time together without distractions", optionB: "Partenerul imi face un cadou neasteptat", optionBEn: "My partner gives me an unexpected gift", languageA: .qualityTime, languageB: .receivingGifts),
        LoveLanguageQuestion(optionA: "Partenerul ma ajuta cu treburile casnice", optionAEn: "My partner helps me with household chores", optionB: "Partenerul imi spune ca ma iubeste", optionBEn: "My partner tells me they love me", languageA: .actsOfService, languageB: .wordsOfAffirmation),
        LoveLanguageQuestion(optionA: "Partenerul imi tine mana in public", optionAEn: "My partner holds my hand in public", optionB: "Partenerul imi pregateste cina", optionBEn: "My partner prepares dinner for me", languageA: .physicalTouch, languageB: .actsOfService),
        LoveLanguageQuestion(optionA: "Primesc un cadou gandit cu atentie", optionAEn: "I receive a thoughtfully chosen gift", optionB: "Avem o conversatie lunga si profunda", optionBEn: "We have a long and deep conversation", languageA: .receivingGifts, languageB: .qualityTime),
        LoveLanguageQuestion(optionA: "Partenerul imi scrie un mesaj frumos", optionAEn: "My partner writes me a beautiful message", optionB: "Partenerul imi face un masaj", optionBEn: "My partner gives me a massage", languageA: .wordsOfAffirmation, languageB: .physicalTouch),
        LoveLanguageQuestion(optionA: "Facem o activitate impreuna", optionAEn: "We do an activity together", optionB: "Partenerul imi repara ceva in casa", optionBEn: "My partner fixes something in the house", languageA: .qualityTime, languageB: .actsOfService),
        LoveLanguageQuestion(optionA: "Partenerul imi aduce flori", optionAEn: "My partner brings me flowers", optionB: "Partenerul ma complimenteaza", optionBEn: "My partner compliments me", languageA: .receivingGifts, languageB: .wordsOfAffirmation),
        LoveLanguageQuestion(optionA: "Stam imbratisati pe canapea", optionAEn: "We cuddle on the couch", optionB: "Partenerul imi planifica o surpriza", optionBEn: "My partner plans a surprise for me", languageA: .physicalTouch, languageB: .receivingGifts),
        LoveLanguageQuestion(optionA: "Partenerul gateste mancarea mea preferata", optionAEn: "My partner cooks my favorite food", optionB: "Mergem intr-o vacanta doar noi doi", optionBEn: "We go on a vacation just the two of us", languageA: .actsOfService, languageB: .qualityTime),
        LoveLanguageQuestion(optionA: "Partenerul imi spune ce apreciaza la mine", optionAEn: "My partner tells me what they appreciate about me", optionB: "Partenerul imi face un cadou de aniversare special", optionBEn: "My partner gives me a special anniversary gift", languageA: .wordsOfAffirmation, languageB: .receivingGifts),
        LoveLanguageQuestion(optionA: "Ne tinem de mana la plimbare", optionAEn: "We hold hands while walking", optionB: "Partenerul se ofera sa ma ajute cu un proiect", optionBEn: "My partner offers to help me with a project", languageA: .physicalTouch, languageB: .actsOfService),
        LoveLanguageQuestion(optionA: "Avem o seara dedicata doar noua", optionAEn: "We have an evening dedicated just to us", optionB: "Partenerul ma saruta cand plec de acasa", optionBEn: "My partner kisses me when I leave home", languageA: .qualityTime, languageB: .physicalTouch),
        LoveLanguageQuestion(optionA: "Partenerul imi curata masina", optionAEn: "My partner cleans my car", optionB: "Partenerul imi cumpara cartea pe care o vreau", optionBEn: "My partner buys me the book I want", languageA: .actsOfService, languageB: .receivingGifts),
        LoveLanguageQuestion(optionA: "Partenerul imi lasa un bilet de dragoste", optionAEn: "My partner leaves me a love note", optionB: "Petrecem o dupa-amiaza fara telefoane", optionBEn: "We spend an afternoon without phones", languageA: .wordsOfAffirmation, languageB: .qualityTime),
    ]
    
    // MARK: - Compatibility Questions
    static let compatibilityQuestions: [CompatibilityQuestion] = [
        CompatibilityQuestion(question: "Cum preferati sa petreceti o seara libera?", questionEn: "How do you prefer to spend a free evening?", options: ["Acasa cu un film", "La restaurant", "La o petrecere", "In natura"], optionsEn: ["Home with a movie", "At a restaurant", "At a party", "In nature"]),
        CompatibilityQuestion(question: "Ce este cel mai important intr-o relatie?", questionEn: "What is most important in a relationship?", options: ["Comunicarea", "Pasiunea", "Increderea", "Umorul"], optionsEn: ["Communication", "Passion", "Trust", "Humor"]),
        CompatibilityQuestion(question: "Cum va exprimati iubirea?", questionEn: "How do you express love?", options: ["Prin cuvinte", "Prin gesturi", "Prin cadouri", "Prin atingere"], optionsEn: ["Through words", "Through gestures", "Through gifts", "Through touch"]),
        CompatibilityQuestion(question: "Cat de des aveti nevoie de timp doar pentru voi?", questionEn: "How often do you need time just for yourselves?", options: ["Zilnic", "Saptamanal", "Lunar", "Rar"], optionsEn: ["Daily", "Weekly", "Monthly", "Rarely"]),
        CompatibilityQuestion(question: "Cum gestionati conflictele?", questionEn: "How do you handle conflicts?", options: ["Discutam imediat", "Ne luam o pauza", "Evitam conflictul", "Cautam compromisul"], optionsEn: ["Discuss immediately", "Take a break", "Avoid conflict", "Seek compromise"]),
        CompatibilityQuestion(question: "Ce tip de vacanta preferati?", questionEn: "What type of vacation do you prefer?", options: ["Plaja si relaxare", "Aventura si explorare", "Cultura si muzee", "Natura si camping"], optionsEn: ["Beach and relaxation", "Adventure and exploration", "Culture and museums", "Nature and camping"]),
        CompatibilityQuestion(question: "Cat de important este aspectul fizic?", questionEn: "How important is physical appearance?", options: ["Foarte important", "Important", "Moderat", "Nu prea important"], optionsEn: ["Very important", "Important", "Moderate", "Not very important"]),
        CompatibilityQuestion(question: "Cum vedeti viitorul impreuna?", questionEn: "How do you see the future together?", options: ["Casatorie si copii", "Parteneriat pe termen lung", "Traim prezentul", "Nu ne gandim la asta"], optionsEn: ["Marriage and kids", "Long-term partnership", "Living in the present", "We don't think about it"]),
        CompatibilityQuestion(question: "Ce va face sa radeti impreuna?", questionEn: "What makes you laugh together?", options: ["Glume si umor", "Situatii amuzante", "Filme de comedie", "Amintiri comune"], optionsEn: ["Jokes and humor", "Funny situations", "Comedy movies", "Shared memories"]),
        CompatibilityQuestion(question: "Cat de deschisi sunteti la lucruri noi in dormitor?", questionEn: "How open are you to new things in the bedroom?", options: ["Foarte deschisi", "Destul de deschisi", "Precauti dar curiosi", "Preferem ce stim"], optionsEn: ["Very open", "Quite open", "Cautious but curious", "We prefer what we know"]),
    ]
    
    // MARK: - Massage Presets
    static let massagePresets: [MassagePreset] = [
        MassagePreset(name: "Masaj Rapid", nameEn: "Quick Massage", duration: 5, icon: "\u{26A1}", description: "Un masaj scurt si energizant pentru umeri si gat.", descriptionEn: "A short and energizing shoulder and neck massage.", color1: "FF6B8A", color2: "C44569"),
        MassagePreset(name: "Masaj Relaxant", nameEn: "Relaxing Massage", duration: 15, icon: "\u{1F9D8}", description: "Masaj complet de relaxare pentru spate si umeri.", descriptionEn: "Full relaxation massage for back and shoulders.", color1: "4FC3F7", color2: "0288D1"),
        MassagePreset(name: "Masaj Senzual", nameEn: "Sensual Massage", duration: 20, icon: "\u{1F495}", description: "Masaj senzual cu uleiuri esentiale si lumina de lumanari.", descriptionEn: "Sensual massage with essential oils and candlelight.", color1: "A55EEA", color2: "8854D0"),
        MassagePreset(name: "Masaj Complet", nameEn: "Full Body Massage", duration: 30, icon: "\u{1F932}", description: "Masaj complet al corpului, de la cap pana la picioare.", descriptionEn: "Complete body massage, from head to toe.", color1: "FF6348", color2: "EE5A24"),
        MassagePreset(name: "Masaj de Picioare", nameEn: "Foot Massage", duration: 10, icon: "\u{1F9B6}", description: "Masaj reflexoterapeutic pentru picioare.", descriptionEn: "Reflexology massage for feet.", color1: "66BB6A", color2: "43A047"),
        MassagePreset(name: "Masaj Tantric", nameEn: "Tantric Massage", duration: 45, icon: "\u{1F549}", description: "Masaj tantric lung cu respiratie sincronizata.", descriptionEn: "Long tantric massage with synchronized breathing.", color1: "FFB74D", color2: "FF8F00"),
    ]
    
    // MARK: - Playlist Recommendations
    static let playlists: [PlaylistRecommendation] = [
        PlaylistRecommendation(name: "Seara Romantica", nameEn: "Romantic Evening", description: "Melodii perfecte pentru o seara intima.", descriptionEn: "Perfect songs for an intimate evening.", icon: "\u{1F56F}", mood: "Romantic", moodEn: "Romantic", songs: [
            SongSuggestion(title: "All of Me", artist: "John Legend"),
            SongSuggestion(title: "Perfect", artist: "Ed Sheeran"),
            SongSuggestion(title: "Thinking Out Loud", artist: "Ed Sheeran"),
            SongSuggestion(title: "At Last", artist: "Etta James"),
            SongSuggestion(title: "Make You Feel My Love", artist: "Adele"),
        ], color1: "FF6B8A", color2: "C44569"),
        PlaylistRecommendation(name: "Pasiune Intensa", nameEn: "Intense Passion", description: "Ritmuri care aprind flacara pasiunii.", descriptionEn: "Rhythms that ignite the flame of passion.", icon: "\u{1F525}", mood: "Pasional", moodEn: "Passionate", songs: [
            SongSuggestion(title: "Earned It", artist: "The Weeknd"),
            SongSuggestion(title: "Wicked Games", artist: "The Weeknd"),
            SongSuggestion(title: "Skin", artist: "Rihanna"),
            SongSuggestion(title: "Drunk in Love", artist: "Beyonce"),
            SongSuggestion(title: "Pony", artist: "Ginuwine"),
        ], color1: "FF6348", color2: "EE5A24"),
        PlaylistRecommendation(name: "Chill & Relax", nameEn: "Chill & Relax", description: "Sunete ambientale pentru relaxare.", descriptionEn: "Ambient sounds for relaxation.", icon: "\u{1F30A}", mood: "Relaxant", moodEn: "Relaxing", songs: [
            SongSuggestion(title: "Sunset Lover", artist: "Petit Biscuit"),
            SongSuggestion(title: "Breathe Me", artist: "Sia"),
            SongSuggestion(title: "Skinny Love", artist: "Bon Iver"),
            SongSuggestion(title: "Cherry Wine", artist: "Hozier"),
            SongSuggestion(title: "Falling", artist: "Harry Styles"),
        ], color1: "4FC3F7", color2: "0288D1"),
        PlaylistRecommendation(name: "Dans Senzual", nameEn: "Sensual Dance", description: "Ritmuri latine pentru dans in doi.", descriptionEn: "Latin rhythms for dancing as a couple.", icon: "\u{1F483}", mood: "Energic", moodEn: "Energetic", songs: [
            SongSuggestion(title: "Despacito", artist: "Luis Fonsi"),
            SongSuggestion(title: "Bailando", artist: "Enrique Iglesias"),
            SongSuggestion(title: "Havana", artist: "Camila Cabello"),
            SongSuggestion(title: "Senorita", artist: "Shawn Mendes & Camila Cabello"),
            SongSuggestion(title: "Shape of You", artist: "Ed Sheeran"),
        ], color1: "A55EEA", color2: "8854D0"),
        PlaylistRecommendation(name: "Dimineata Lenta", nameEn: "Slow Morning", description: "Melodii blande pentru o dimineata in doi.", descriptionEn: "Gentle melodies for a morning together.", icon: "\u{2600}", mood: "Calm", moodEn: "Calm", songs: [
            SongSuggestion(title: "Sunday Morning", artist: "Maroon 5"),
            SongSuggestion(title: "Banana Pancakes", artist: "Jack Johnson"),
            SongSuggestion(title: "Better Together", artist: "Jack Johnson"),
            SongSuggestion(title: "I'm Yours", artist: "Jason Mraz"),
            SongSuggestion(title: "Lucky", artist: "Jason Mraz & Colbie Caillat"),
        ], color1: "FFB74D", color2: "FF8F00"),
    ]
    
    // MARK: - Toy Shop Items
    static let toyShopItems: [ToyShopItem] = [
        ToyShopItem(name: "Lovehoney", nameEn: "Lovehoney", description: "Cel mai mare magazin online de jucarii pentru adulti, cu mii de produse.", descriptionEn: "The largest online adult toy store with thousands of products.", icon: "\u{1F49C}", url: "https://www.lovehoney.com", color1: "9C27B0", color2: "7B1FA2"),
        ToyShopItem(name: "Adam & Eve", nameEn: "Adam & Eve", description: "Magazin de incredere cu produse premium si livrare discreta.", descriptionEn: "Trusted store with premium products and discreet delivery.", icon: "\u{1F34E}", url: "https://www.adameve.com", color1: "E91E63", color2: "C2185B"),
        ToyShopItem(name: "LELO", nameEn: "LELO", description: "Brand de lux suedez, cunoscut pentru design elegant si calitate superioara.", descriptionEn: "Swedish luxury brand known for elegant design and superior quality.", icon: "\u{2728}", url: "https://www.lelo.com", color1: "FFD700", color2: "FFA000"),
        ToyShopItem(name: "We-Vibe", nameEn: "We-Vibe", description: "Specializat in jucarii pentru cupluri cu control prin aplicatie.", descriptionEn: "Specialized in couple toys with app control.", icon: "\u{1F4F1}", url: "https://www.we-vibe.com", color1: "00BCD4", color2: "0097A7"),
        ToyShopItem(name: "Satisfyer", nameEn: "Satisfyer", description: "Produse inovatoare cu tehnologie de unde de presiune.", descriptionEn: "Innovative products with pressure wave technology.", icon: "\u{1F30A}", url: "https://www.satisfyer.com", color1: "FF5722", color2: "E64A19"),
        ToyShopItem(name: "Bondara", nameEn: "Bondara", description: "Varietate mare de produse la preturi accesibile.", descriptionEn: "Wide variety of products at affordable prices.", icon: "\u{1F381}", url: "https://www.bondara.co.uk", color1: "F44336", color2: "D32F2F"),
        ToyShopItem(name: "SheVibe", nameEn: "SheVibe", description: "Magazin independent cu selectie curata si recenzii detaliate.", descriptionEn: "Independent store with curated selection and detailed reviews.", icon: "\u{1F308}", url: "https://shevibe.com", color1: "4CAF50", color2: "388E3C"),
        ToyShopItem(name: "Sinful", nameEn: "Sinful", description: "Magazin scandinav cu produse sigure pentru corp si eco-friendly.", descriptionEn: "Scandinavian store with body-safe and eco-friendly products.", icon: "\u{1F33F}", url: "https://www.sinful.com", color1: "607D8B", color2: "455A64"),
    ]
    
    // MARK: - Discover Features
    static let discoverFeatures: [DiscoverFeature] = [
        DiscoverFeature(id: "quotes", name: "Citate Romantice", nameEn: "Romantic Quotes", icon: "\u{1F4AC}", description: "20 citate despre iubire si pasiune", descriptionEn: "20 quotes about love and passion", color1: "FF6B8A", color2: "C44569"),
        DiscoverFeature(id: "mood", name: "Mood Tracker", nameEn: "Mood Tracker", icon: "\u{1F4CA}", description: "Urmareste starea de spirit zilnic", descriptionEn: "Track your daily mood", color1: "A55EEA", color2: "8854D0"),
        DiscoverFeature(id: "datenight", name: "Date Night", nameEn: "Date Night", icon: "\u{1F319}", description: "15 idei pentru seri romantice", descriptionEn: "15 ideas for romantic evenings", color1: "4FC3F7", color2: "0288D1"),
        DiscoverFeature(id: "massage", name: "Timer Masaj", nameEn: "Massage Timer", icon: "\u{1F932}", description: "6 preseturi de masaj cu timer", descriptionEn: "6 massage presets with timer", color1: "FF6348", color2: "EE5A24"),
        DiscoverFeature(id: "bucketlist", name: "Bucket List", nameEn: "Bucket List", icon: "\u{1F4CB}", description: "15 activitati de facut impreuna", descriptionEn: "15 activities to do together", color1: "66BB6A", color2: "43A047"),
        DiscoverFeature(id: "playlists", name: "Playlisturi", nameEn: "Playlists", icon: "\u{1F3B5}", description: "5 playlisturi tematice cu melodii", descriptionEn: "5 themed playlists with songs", color1: "FFB74D", color2: "FF8F00"),
        DiscoverFeature(id: "lovelanguage", name: "Limbajul Iubirii", nameEn: "Love Language", icon: "\u{1F49D}", description: "Descopera cum iubesti si esti iubit", descriptionEn: "Discover how you love and are loved", color1: "EC407A", color2: "C2185B"),
        DiscoverFeature(id: "compatibility", name: "Compatibilitate", nameEn: "Compatibility", icon: "\u{1F491}", description: "Test de compatibilitate pentru cuplu", descriptionEn: "Compatibility test for couples", color1: "26C6DA", color2: "00ACC1"),
        DiscoverFeature(id: "achievements", name: "Realizari", nameEn: "Achievements", icon: "\u{1F3C6}", description: "10 badge-uri de deblocat", descriptionEn: "10 badges to unlock", color1: "FFD54F", color2: "FFC107"),
        DiscoverFeature(id: "toyshop", name: "Magazin Jucarii", nameEn: "Toy Shop", icon: "\u{1F6CD}", description: "Magazine online de jucarii pentru adulti", descriptionEn: "Online adult toy shops", color1: "9C27B0", color2: "7B1FA2"),
    ]
}
