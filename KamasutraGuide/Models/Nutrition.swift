import Foundation
import SwiftUI

// MARK: - Romantic Quote
struct RomanticQuote: Identifiable {
    let id = UUID()
    let text: String
    let textEn: String
    let author: String
    let category: QuoteCategory
    
    func localizedText(_ l: LocalizationManager) -> String { l.isEnglish ? textEn : text }
}

enum QuoteCategory: String, CaseIterable {
    case love = "Dragoste"
    case passion = "Pasiune"
    case romance = "Romantism"
    case wisdom = "Intelepciune"
    case humor = "Umor"
    
    func localizedName(_ l: LocalizationManager) -> String {
        switch self {
        case .love: return l.L("Dragoste", "Love")
        case .passion: return l.L("Pasiune", "Passion")
        case .romance: return l.L("Romantism", "Romance")
        case .wisdom: return l.L("Intelepciune", "Wisdom")
        case .humor: return l.L("Umor", "Humor")
        }
    }
    
    var icon: String {
        switch self {
        case .love: return "heart.fill"
        case .passion: return "flame.fill"
        case .romance: return "sparkles"
        case .wisdom: return "brain.head.profile"
        case .humor: return "face.smiling.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .love: return Color(hex: "FF6B8A")
        case .passion: return Color(hex: "FF6348")
        case .romance: return Color(hex: "A55EEA")
        case .wisdom: return Color(hex: "4FC3F7")
        case .humor: return Color(hex: "FFB74D")
        }
    }
}

// MARK: - Mood Entry
struct MoodEntry: Identifiable, Codable {
    let id: UUID
    let date: Date
    let mood: Int
    let intimacy: Int
    let note: String
    
    init(id: UUID = UUID(), date: Date = Date(), mood: Int, intimacy: Int, note: String = "") {
        self.id = id
        self.date = date
        self.mood = mood
        self.intimacy = intimacy
        self.note = note
    }
    
    var moodEmoji: String {
        switch mood {
        case 1: return "\u{1F614}"
        case 2: return "\u{1F610}"
        case 3: return "\u{1F642}"
        case 4: return "\u{1F60A}"
        case 5: return "\u{1F60D}"
        default: return "\u{1F642}"
        }
    }
}

// MARK: - Bucket List Item
struct BucketListItem: Identifiable, Codable {
    let id: UUID
    let title: String
    let description: String
    let icon: String
    var isCompleted: Bool
    let category: String
    
    init(id: UUID = UUID(), title: String, description: String, icon: String, isCompleted: Bool = false, category: String) {
        self.id = id
        self.title = title
        self.description = description
        self.icon = icon
        self.isCompleted = isCompleted
        self.category = category
    }
}

// MARK: - Date Night Idea
struct DateNightIdea: Identifiable {
    let id = UUID()
    let title: String
    let titleEn: String
    let description: String
    let descriptionEn: String
    let icon: String
    let category: String
    let categoryEn: String
    let budget: String
    let budgetEn: String
    let duration: String
    let durationEn: String
    
    func localizedTitle(_ l: LocalizationManager) -> String { l.isEnglish ? titleEn : title }
    func localizedDescription(_ l: LocalizationManager) -> String { l.isEnglish ? descriptionEn : description }
    func localizedCategory(_ l: LocalizationManager) -> String { l.isEnglish ? categoryEn : category }
    func localizedBudget(_ l: LocalizationManager) -> String { l.isEnglish ? budgetEn : budget }
    func localizedDuration(_ l: LocalizationManager) -> String { l.isEnglish ? durationEn : duration }
}

// MARK: - Badge/Achievement
struct Achievement: Identifiable {
    let id: String
    let name: String
    let nameEn: String
    let description: String
    let descriptionEn: String
    let icon: String
    let requirement: String
    let requirementEn: String
    let color1: String
    let color2: String
    
    var gradient: LinearGradient {
        LinearGradient(colors: [Color(hex: color1), Color(hex: color2)], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    func localizedName(_ l: LocalizationManager) -> String { l.isEnglish ? nameEn : name }
    func localizedDescription(_ l: LocalizationManager) -> String { l.isEnglish ? descriptionEn : description }
    func localizedRequirement(_ l: LocalizationManager) -> String { l.isEnglish ? requirementEn : requirement }
}

// MARK: - Love Language
struct LoveLanguageQuestion: Identifiable {
    let id = UUID()
    let optionA: String
    let optionAEn: String
    let optionB: String
    let optionBEn: String
    let languageA: LoveLanguage
    let languageB: LoveLanguage
    
    func localizedOptionA(_ l: LocalizationManager) -> String { l.isEnglish ? optionAEn : optionA }
    func localizedOptionB(_ l: LocalizationManager) -> String { l.isEnglish ? optionBEn : optionB }
}

enum LoveLanguage: String, CaseIterable {
    case wordsOfAffirmation = "Cuvinte de Afirmare"
    case actsOfService = "Acte de Serviciu"
    case receivingGifts = "Primirea Cadourilor"
    case qualityTime = "Timp de Calitate"
    case physicalTouch = "Atingere Fizica"
    
    func localizedName(_ l: LocalizationManager) -> String {
        switch self {
        case .wordsOfAffirmation: return l.L("Cuvinte de Afirmare", "Words of Affirmation")
        case .actsOfService: return l.L("Acte de Serviciu", "Acts of Service")
        case .receivingGifts: return l.L("Primirea Cadourilor", "Receiving Gifts")
        case .qualityTime: return l.L("Timp de Calitate", "Quality Time")
        case .physicalTouch: return l.L("Atingere Fizica", "Physical Touch")
        }
    }
    
    var icon: String {
        switch self {
        case .wordsOfAffirmation: return "text.bubble.fill"
        case .actsOfService: return "hands.sparkles.fill"
        case .receivingGifts: return "gift.fill"
        case .qualityTime: return "clock.fill"
        case .physicalTouch: return "hand.raised.fill"
        }
    }
    
    func localizedDescription(_ l: LocalizationManager) -> String {
        switch self {
        case .wordsOfAffirmation: return l.L("Te simti iubit/a cand partenerul iti spune lucruri frumoase, te complimenteaza si iti exprima aprecierea verbal.", "You feel loved when your partner says beautiful things, compliments you, and expresses appreciation verbally.")
        case .actsOfService: return l.L("Te simti iubit/a cand partenerul face lucruri pentru tine - gateste, curata, te ajuta cu sarcinile zilnice.", "You feel loved when your partner does things for you - cooks, cleans, helps with daily tasks.")
        case .receivingGifts: return l.L("Te simti iubit/a cand primesti cadouri atente care arata ca partenerul s-a gandit la tine.", "You feel loved when you receive thoughtful gifts that show your partner was thinking of you.")
        case .qualityTime: return l.L("Te simti iubit/a cand petreceti timp de calitate impreuna, fara distractii, concentrati unul pe celalalt.", "You feel loved when you spend quality time together, without distractions, focused on each other.")
        case .physicalTouch: return l.L("Te simti iubit/a prin atingere fizica - imbratisari, saruturi, tinutul de mana, proximitate fizica.", "You feel loved through physical touch - hugs, kisses, holding hands, physical closeness.")
        }
    }
    
    var langDescription: String {
        switch self {
        case .wordsOfAffirmation: return "Te simti iubit/a cand partenerul iti spune lucruri frumoase, te complimenteaza si iti exprima aprecierea verbal."
        case .actsOfService: return "Te simti iubit/a cand partenerul face lucruri pentru tine - gateste, curata, te ajuta cu sarcinile zilnice."
        case .receivingGifts: return "Te simti iubit/a cand primesti cadouri atente care arata ca partenerul s-a gandit la tine."
        case .qualityTime: return "Te simti iubit/a cand petreceti timp de calitate impreuna, fara distractii, concentrati unul pe celalalt."
        case .physicalTouch: return "Te simti iubit/a prin atingere fizica - imbratisari, saruturi, tinutul de mana, proximitate fizica."
        }
    }
    
    var color: Color {
        switch self {
        case .wordsOfAffirmation: return Color(hex: "FF6B8A")
        case .actsOfService: return Color(hex: "4FC3F7")
        case .receivingGifts: return Color(hex: "FFB74D")
        case .qualityTime: return Color(hex: "A55EEA")
        case .physicalTouch: return Color(hex: "FF6348")
        }
    }
}

// MARK: - Compatibility Question
struct CompatibilityQuestion: Identifiable {
    let id = UUID()
    let question: String
    let questionEn: String
    let options: [String]
    let optionsEn: [String]
    
    func localizedQuestion(_ l: LocalizationManager) -> String { l.isEnglish ? questionEn : question }
    func localizedOptions(_ l: LocalizationManager) -> [String] { l.isEnglish ? optionsEn : options }
}

// MARK: - Massage Timer Preset
struct MassagePreset: Identifiable {
    let id = UUID()
    let name: String
    let nameEn: String
    let duration: Int
    let icon: String
    let description: String
    let descriptionEn: String
    let color1: String
    let color2: String
    
    var gradient: LinearGradient {
        LinearGradient(colors: [Color(hex: color1), Color(hex: color2)], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    func localizedName(_ l: LocalizationManager) -> String { l.isEnglish ? nameEn : name }
    func localizedDescription(_ l: LocalizationManager) -> String { l.isEnglish ? descriptionEn : description }
}

// MARK: - Playlist
struct PlaylistRecommendation: Identifiable {
    let id = UUID()
    let name: String
    let nameEn: String
    let description: String
    let descriptionEn: String
    let icon: String
    let mood: String
    let moodEn: String
    let songs: [SongSuggestion]
    let color1: String
    let color2: String
    
    var gradient: LinearGradient {
        LinearGradient(colors: [Color(hex: color1), Color(hex: color2)], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    func localizedName(_ l: LocalizationManager) -> String { l.isEnglish ? nameEn : name }
    func localizedDescription(_ l: LocalizationManager) -> String { l.isEnglish ? descriptionEn : description }
    func localizedMood(_ l: LocalizationManager) -> String { l.isEnglish ? moodEn : mood }
}

struct SongSuggestion: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
}

// MARK: - Toy Shop Item
struct ToyShopItem: Identifiable {
    let id = UUID()
    let name: String
    let nameEn: String
    let description: String
    let descriptionEn: String
    let icon: String
    let url: String
    let color1: String
    let color2: String
    
    var gradient: LinearGradient {
        LinearGradient(colors: [Color(hex: color1), Color(hex: color2)], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    func localizedName(_ l: LocalizationManager) -> String { l.isEnglish ? nameEn : name }
    func localizedDescription(_ l: LocalizationManager) -> String { l.isEnglish ? descriptionEn : description }
}

// MARK: - Discover Feature Item
struct DiscoverFeature: Identifiable {
    let id: String
    let name: String
    let nameEn: String
    let icon: String
    let description: String
    let descriptionEn: String
    let color1: String
    let color2: String
    
    var gradient: LinearGradient {
        LinearGradient(colors: [Color(hex: color1), Color(hex: color2)], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    func localizedName(_ l: LocalizationManager) -> String { l.isEnglish ? nameEn : name }
    func localizedDescription(_ l: LocalizationManager) -> String { l.isEnglish ? descriptionEn : description }
}
