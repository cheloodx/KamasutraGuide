import Foundation
import SwiftUI

// MARK: - App Language
enum AppLanguage: String, CaseIterable {
    case romanian = "ro"
    case english = "en"
    
    var displayName: String {
        switch self {
        case .romanian: return "Romana"
        case .english: return "English"
        }
    }
    
    var flag: String {
        switch self {
        case .romanian: return "\u{1F1F7}\u{1F1F4}"
        case .english: return "\u{1F1EC}\u{1F1E7}"
        }
    }
}

// MARK: - Localization Manager
class LocalizationManager: ObservableObject {
    @Published var currentLanguage: AppLanguage {
        didSet {
            UserDefaults.standard.set(currentLanguage.rawValue, forKey: languageKey)
        }
    }
    
    private let languageKey = "kamasutra_app_language"
    
    init() {
        if let saved = UserDefaults.standard.string(forKey: languageKey),
           let language = AppLanguage(rawValue: saved) {
            self.currentLanguage = language
        } else {
            self.currentLanguage = .romanian
        }
    }
    
    func toggleLanguage() {
        currentLanguage = currentLanguage == .romanian ? .english : .romanian
    }
    
    func setLanguage(_ language: AppLanguage) {
        currentLanguage = language
    }
    
    /// Returns localized string based on current language
    func L(_ ro: String, _ en: String) -> String {
        currentLanguage == .romanian ? ro : en
    }
    
    var isEnglish: Bool { currentLanguage == .english }
    var isRomanian: Bool { currentLanguage == .romanian }
}

// MARK: - Localized Strings
struct Strings {
    
    // MARK: - Tab Names
    struct Tabs {
        static func positions(_ l: LocalizationManager) -> String { l.L("Pozitii", "Positions") }
        static func games(_ l: LocalizationManager) -> String { l.L("Jocuri", "Games") }
        static func favorites(_ l: LocalizationManager) -> String { l.L("Favorite", "Favorites") }
        static func info(_ l: LocalizationManager) -> String { l.L("Info", "Info") }
        static func discover(_ l: LocalizationManager) -> String { l.L("Descopera", "Discover") }
    }
    
    // MARK: - Positions Grid
    struct PositionsGrid {
        static func title(_ l: LocalizationManager) -> String { l.L("Kamasutra Guide", "Kamasutra Guide") }
        static func subtitle(_ l: LocalizationManager) -> String { l.L("Descopera arta intimitatii", "Discover the art of intimacy") }
        static func positions(_ l: LocalizationManager) -> String { l.L("pozitii", "positions") }
        static func allFilter(_ l: LocalizationManager) -> String { l.L("Toate", "All") }
        static func hideFilters(_ l: LocalizationManager) -> String { l.L("Ascunde filtre", "Hide filters") }
        static func moreFilters(_ l: LocalizationManager) -> String { l.L("Mai multe filtre", "More filters") }
        static func noResults(_ l: LocalizationManager) -> String { l.L("Nicio pozitie gasita", "No positions found") }
        static func noResultsMsg(_ l: LocalizationManager) -> String { l.L("Incercati sa modificati filtrele sau termenul de cautare.", "Try changing the filters or search term.") }
        static func searchPlaceholder(_ l: LocalizationManager) -> String { l.L("Cauta pozitii...", "Search positions...") }
    }
    
    // MARK: - Position Detail
    struct PositionDetail {
        static func description(_ l: LocalizationManager) -> String { l.L("Descriere", "Description") }
        static func benefits(_ l: LocalizationManager) -> String { l.L("Beneficii", "Benefits") }
        static func tips(_ l: LocalizationManager) -> String { l.L("Sfaturi", "Tips") }
        static func variations(_ l: LocalizationManager) -> String { l.L("Variatii", "Variations") }
        static func intimacy(_ l: LocalizationManager) -> String { l.L("Intimitate", "Intimacy") }
        static func difficulty(_ l: LocalizationManager) -> String { l.L("Dificultate", "Difficulty") }
    }
    
    // MARK: - Favorites
    struct Favorites {
        static func title(_ l: LocalizationManager) -> String { l.L("Favorite", "Favorites") }
        static func savedPositions(_ l: LocalizationManager, _ count: Int) -> String {
            l.L("\(count) pozitii salvate", "\(count) saved positions")
        }
        static func noFavorites(_ l: LocalizationManager) -> String { l.L("Nicio pozitie favorita", "No favorite positions") }
        static func noFavoritesMsg(_ l: LocalizationManager) -> String {
            l.L("Apasati pe inima de pe orice pozitie pentru a o adauga la favorite.", "Tap the heart on any position to add it to favorites.")
        }
    }
    
    // MARK: - Games
    struct Games {
        static func title(_ l: LocalizationManager) -> String { l.L("Jocuri de Cuplu", "Couple Games") }
        static func subtitle(_ l: LocalizationManager) -> String { l.L("Distractie si intimitate", "Fun and intimacy") }
        static func gamesCount(_ l: LocalizationManager, _ count: Int) -> String { l.L("\(count) Jocuri", "\(count) Games") }
        static func gameInProgress(_ l: LocalizationManager) -> String { l.L("Joc in curs de dezvoltare", "Game in development") }
    }
    
    // MARK: - Truth or Dare
    struct TruthOrDare {
        static func title(_ l: LocalizationManager) -> String { l.L("Adevar sau Provocare", "Truth or Dare") }
        static func choosePrompt(_ l: LocalizationManager) -> String { l.L("Alege intre Adevar si Provocare!", "Choose between Truth and Dare!") }
        static func truth(_ l: LocalizationManager) -> String { l.L("Adevar", "Truth") }
        static func dare(_ l: LocalizationManager) -> String { l.L("Provocare", "Dare") }
        static func intensity(_ l: LocalizationManager, _ level: Int) -> String { l.L("Intensitate: \(level)/5", "Intensity: \(level)/5") }
    }
    
    // MARK: - Would You Rather
    struct WouldYouRather {
        static func title(_ l: LocalizationManager) -> String { l.L("Ce Ai Prefera?", "Would You Rather?") }
        static func or(_ l: LocalizationManager) -> String { l.L("SAU", "OR") }
        static func startGame(_ l: LocalizationManager) -> String { l.L("Incepe Jocul", "Start Game") }
        static func nextQuestion(_ l: LocalizationManager) -> String { l.L("Urmatoarea Intrebare", "Next Question") }
    }
    
    // MARK: - Dice Game
    struct DiceGame {
        static func title(_ l: LocalizationManager) -> String { l.L("Zarurile Pasiunii", "Dice of Passion") }
        static func subtitle(_ l: LocalizationManager) -> String { l.L("Arunca zarurile si urmeaza instructiunile!", "Roll the dice and follow the instructions!") }
        static func roll(_ l: LocalizationManager) -> String { l.L("Arunca Zarurile!", "Roll the Dice!") }
    }
    
    // MARK: - Quiz
    struct Quiz {
        static func title(_ l: LocalizationManager) -> String { l.L("Cat de Bine Ma Cunosti?", "How Well Do You Know Me?") }
        static func correct(_ l: LocalizationManager) -> String { l.L("Corecte", "Correct") }
        static func questions(_ l: LocalizationManager) -> String { l.L("Intrebari", "Questions") }
        static func startQuiz(_ l: LocalizationManager) -> String { l.L("Incepe Quiz-ul", "Start Quiz") }
        static func nextQuestion(_ l: LocalizationManager) -> String { l.L("Urmatoarea Intrebare", "Next Question") }
    }
    
    // MARK: - Challenges
    struct Challenges {
        static func title(_ l: LocalizationManager) -> String { l.L("Provocari de Cuplu", "Couple Challenges") }
        static func subtitle(_ l: LocalizationManager) -> String { l.L("Alege o provocare si distreaza-va impreuna!", "Pick a challenge and have fun together!") }
        static func pickChallenge(_ l: LocalizationManager) -> String { l.L("Alege o Provocare", "Pick a Challenge") }
        static func anotherChallenge(_ l: LocalizationManager) -> String { l.L("Alta Provocare", "Another Challenge") }
        static func allChallenges(_ l: LocalizationManager) -> String { l.L("Toate Provocarile", "All Challenges") }
    }
    
    // MARK: - Position Roulette
    struct Roulette {
        static func title(_ l: LocalizationManager) -> String { l.L("Ruleta Pozitiilor", "Position Roulette") }
        static func subtitle(_ l: LocalizationManager) -> String { l.L("Lasa soarta sa aleaga pentru voi!", "Let fate choose for you!") }
        static func spin(_ l: LocalizationManager) -> String { l.L("Invarte Ruleta!", "Spin the Wheel!") }
        static func spinAgain(_ l: LocalizationManager) -> String { l.L("Invarte Din Nou!", "Spin Again!") }
    }
    
    // MARK: - Info
    struct Info {
        static func title(_ l: LocalizationManager) -> String { l.L("Kamasutra Guide", "Kamasutra Guide") }
        static func subtitle(_ l: LocalizationManager) -> String { l.L("Ghidul complet al intimitatii", "The complete guide to intimacy") }
        static func statistics(_ l: LocalizationManager) -> String { l.L("Statistici", "Statistics") }
        static func positionsLabel(_ l: LocalizationManager) -> String { l.L("Pozitii", "Positions") }
        static func favoritesLabel(_ l: LocalizationManager) -> String { l.L("Favorite", "Favorites") }
        static func categoriesLabel(_ l: LocalizationManager) -> String { l.L("Categorii", "Categories") }
        static func levelsLabel(_ l: LocalizationManager) -> String { l.L("Niveluri", "Levels") }
        static func categories(_ l: LocalizationManager) -> String { l.L("Categorii", "Categories") }
        static func difficultyLevels(_ l: LocalizationManager) -> String { l.L("Niveluri de dificultate", "Difficulty Levels") }
        static func aboutApp(_ l: LocalizationManager) -> String { l.L("Despre aplicatie", "About the App") }
        static func aboutText(_ l: LocalizationManager) -> String {
                        l.L("Kamasutra Guide este un ghid educational complet care prezinta 59 de pozitii din arta clasica a iubirii. Aplicatia ofera informatii detaliate despre fiecare pozitie, inclusiv beneficii, sfaturi practice si variatii.",
                            "Kamasutra Guide is a complete educational guide featuring 59 positions from the classic art of love. The app provides detailed information about each position, including benefits, practical tips, and variations.")
        }
        static func aboutText2(_ l: LocalizationManager) -> String {
            l.L("Aceasta aplicatie este destinata exclusiv adultilor si are un scop educational. Toate informatiile sunt prezentate intr-o maniera respectuoasa si informativa.",
                "This app is intended exclusively for adults and has an educational purpose. All information is presented in a respectful and informative manner.")
        }
        static func warning(_ l: LocalizationManager) -> String { l.L("Avertisment", "Warning") }
        static func warningText(_ l: LocalizationManager) -> String {
            l.L("Aceasta aplicatie este destinata exclusiv persoanelor cu varsta de peste 18 ani. Continutul are un caracter educational si informativ. Practicati intotdeauna comunicarea deschisa cu partenerul.",
                "This app is intended exclusively for persons over 18 years of age. The content is educational and informative. Always practice open communication with your partner.")
        }
        static func version(_ l: LocalizationManager) -> String { l.L("Versiunea 1.0.0", "Version 1.0.0") }
        static func language(_ l: LocalizationManager) -> String { l.L("Limba", "Language") }
        static func settings(_ l: LocalizationManager) -> String { l.L("Setari", "Settings") }
    }
    
    // MARK: - Discover
    struct Discover {
        static func title(_ l: LocalizationManager) -> String { l.L("Descopera", "Discover") }
        static func subtitle(_ l: LocalizationManager) -> String { l.L("Exploreaza toate functiile pentru cupluri", "Explore all features for couples") }
    }
    
    // MARK: - Romantic Quotes
    struct Quotes {
        static func title(_ l: LocalizationManager) -> String { l.L("Citate Romantice", "Romantic Quotes") }
        static func newQuote(_ l: LocalizationManager) -> String { l.L("Citat Nou", "New Quote") }
        static func all(_ l: LocalizationManager) -> String { l.L("Toate", "All") }
    }
    
    // MARK: - Mood Tracker
    struct MoodTracker {
        static func title(_ l: LocalizationManager) -> String { l.L("Mood Tracker", "Mood Tracker") }
        static func howDoYouFeel(_ l: LocalizationManager) -> String { l.L("Cum te simti azi?", "How do you feel today?") }
        static func moodLabel(_ l: LocalizationManager) -> String { l.L("Stare de spirit", "Mood") }
        static func intimacyLevel(_ l: LocalizationManager) -> String { l.L("Nivel de intimitate", "Intimacy Level") }
        static func save(_ l: LocalizationManager) -> String { l.L("Salveaza", "Save") }
        static func avgMood(_ l: LocalizationManager) -> String { l.L("Medie Mood", "Avg Mood") }
        static func avgIntimacy(_ l: LocalizationManager) -> String { l.L("Medie Intimitate", "Avg Intimacy") }
        static func entries(_ l: LocalizationManager) -> String { l.L("Inregistrari", "Entries") }
        static func history(_ l: LocalizationManager) -> String { l.L("Istoric", "History") }
        static func noEntries(_ l: LocalizationManager) -> String { l.L("Nicio inregistrare inca", "No entries yet") }
        static func recordDaily(_ l: LocalizationManager) -> String { l.L("Inregistreaza-ti starea zilnic!", "Record your mood daily!") }
        static func intimacyLabels(_ l: LocalizationManager) -> [String] {
            l.isRomanian ? ["Scazut", "Moderat", "Bun", "Ridicat", "Intens"] : ["Low", "Moderate", "Good", "High", "Intense"]
        }
    }
    
    // MARK: - Date Night
    struct DateNight {
        static func title(_ l: LocalizationManager) -> String { l.L("Date Night", "Date Night") }
        static func generate(_ l: LocalizationManager) -> String { l.L("Genereaza o Idee", "Generate an Idea") }
        static func another(_ l: LocalizationManager) -> String { l.L("Alta Idee", "Another Idea") }
        static func all(_ l: LocalizationManager) -> String { l.L("Toate", "All") }
    }
    
    // MARK: - Achievements
    struct Achievements {
        static func title(_ l: LocalizationManager) -> String { l.L("Realizari", "Achievements") }
        static func subtitle(_ l: LocalizationManager) -> String {
            l.L("Deblocheaza realizari pe masura ce explorezi aplicatia!", "Unlock achievements as you explore the app!")
        }
    }
    
    // MARK: - Playlists
    struct Playlists {
        static func title(_ l: LocalizationManager) -> String { l.L("Playlisturi", "Playlists") }
    }
    
    // MARK: - Music Player
    struct MusicPlayer {
        static func title(_ l: LocalizationManager) -> String { l.L("Muzica de Fond", "Background Music") }
        static func nowPlaying(_ l: LocalizationManager) -> String { l.L("Acum se reda", "Now Playing") }
        static func playlist(_ l: LocalizationManager) -> String { l.L("Playlist Romantic", "Romantic Playlist") }
    }
    
    // MARK: - Category Names
    struct Categories {
        static func romantic(_ l: LocalizationManager) -> String { l.L("Romantic", "Romantic") }
        static func passionate(_ l: LocalizationManager) -> String { l.L("Pasional", "Passionate") }
        static func adventurous(_ l: LocalizationManager) -> String { l.L("Aventuros", "Adventurous") }
        static func intimate(_ l: LocalizationManager) -> String { l.L("Intim", "Intimate") }
        
        static func displayName(_ category: PositionCategory, _ l: LocalizationManager) -> String {
            switch category {
            case .romantic: return romantic(l)
            case .passionate: return passionate(l)
            case .adventurous: return adventurous(l)
            case .intimate: return intimate(l)
            }
        }
    }
    
    // MARK: - Difficulty Names
    struct Difficulties {
        static func beginner(_ l: LocalizationManager) -> String { l.L("Incepator", "Beginner") }
        static func intermediate(_ l: LocalizationManager) -> String { l.L("Intermediar", "Intermediate") }
        static func advanced(_ l: LocalizationManager) -> String { l.L("Avansat", "Advanced") }
        static func expert(_ l: LocalizationManager) -> String { l.L("Expert", "Expert") }
        
        static func displayName(_ difficulty: Difficulty, _ l: LocalizationManager) -> String {
            switch difficulty {
            case .beginner: return beginner(l)
            case .intermediate: return intermediate(l)
            case .advanced: return advanced(l)
            case .expert: return expert(l)
            }
        }
    }
}
