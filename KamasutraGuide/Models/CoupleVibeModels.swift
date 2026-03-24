import Foundation
import SwiftUI

// MARK: - Daily Challenge
struct DailyChallenge: Identifiable, Codable {
    let id: Int
    let day: Int
    let title: String
    let titleEn: String
    let description: String
    let descriptionEn: String
    let category: ChallengeCategory
    let icon: String
    var isCompleted: Bool
    
    func localizedTitle(_ l: LocalizationManager) -> String { l.isEnglish ? titleEn : title }
    func localizedDescription(_ l: LocalizationManager) -> String { l.isEnglish ? descriptionEn : description }
}

extension DailyChallenge: Equatable {
    static func == (lhs: DailyChallenge, rhs: DailyChallenge) -> Bool { lhs.id == rhs.id }
}

enum ChallengeCategory: String, Codable, CaseIterable {
    case communication
    case physical
    case emotional
    case adventure
    case creative
    
    func localizedName(_ l: LocalizationManager) -> String {
        switch self {
        case .communication: return l.L("Comunicare", "Communication")
        case .physical: return l.L("Fizic", "Physical")
        case .emotional: return l.L("Emotional", "Emotional")
        case .adventure: return l.L("Aventura", "Adventure")
        case .creative: return l.L("Creativ", "Creative")
        }
    }
    
    var color: Color {
        switch self {
        case .communication: return Color(hex: "4FC3F7")
        case .physical: return Color(hex: "FF6B8A")
        case .emotional: return Color(hex: "A55EEA")
        case .adventure: return Color(hex: "FF6348")
        case .creative: return Color(hex: "FFB74D")
        }
    }
    
    var sfIcon: String {
        switch self {
        case .communication: return "bubble.left.and.bubble.right.fill"
        case .physical: return "figure.2.arms.open"
        case .emotional: return "heart.circle.fill"
        case .adventure: return "mountain.2.fill"
        case .creative: return "paintbrush.fill"
        }
    }
}

// MARK: - Intimacy Score Entry
struct IntimacyScoreEntry: Identifiable, Codable {
    let id: UUID
    let date: Date
    let communicationScore: Int
    let physicalScore: Int
    let emotionalScore: Int
    let adventureScore: Int
    let overallScore: Int
    
    init(id: UUID = UUID(), date: Date = Date(), communication: Int, physical: Int, emotional: Int, adventure: Int) {
        self.id = id
        self.date = date
        self.communicationScore = communication
        self.physicalScore = physical
        self.emotionalScore = emotional
        self.adventureScore = adventure
        self.overallScore = (communication + physical + emotional + adventure) / 4
    }
}

// MARK: - Mood Recommendation
struct MoodRecommendation: Identifiable {
    let id = UUID()
    let mood: CoupleVibeMood
    let positions: [String]
    let games: [String]
    let playlist: String
    let tip: String
    let tipEn: String
    
    func localizedTip(_ l: LocalizationManager) -> String { l.isEnglish ? tipEn : tip }
}

enum CoupleVibeMood: String, CaseIterable {
    case romantic
    case passionate
    case playful
    case relaxed
    case adventurous
    
    func localizedName(_ l: LocalizationManager) -> String {
        switch self {
        case .romantic: return l.L("Romantic", "Romantic")
        case .passionate: return l.L("Pasional", "Passionate")
        case .playful: return l.L("Jucaus", "Playful")
        case .relaxed: return l.L("Relaxat", "Relaxed")
        case .adventurous: return l.L("Aventuros", "Adventurous")
        }
    }
    
    var icon: String {
        switch self {
        case .romantic: return "\u{2764}\u{FE0F}"
        case .passionate: return "\u{1F525}"
        case .playful: return "\u{1F60F}"
        case .relaxed: return "\u{1F60C}"
        case .adventurous: return "\u{1F680}"
        }
    }
    
    var color: Color {
        switch self {
        case .romantic: return Color(hex: "FF6B8A")
        case .passionate: return Color(hex: "FF6348")
        case .playful: return Color(hex: "FFB74D")
        case .relaxed: return Color(hex: "4FC3F7")
        case .adventurous: return Color(hex: "A55EEA")
        }
    }
    
    var gradient: LinearGradient {
        switch self {
        case .romantic: return LinearGradient(colors: [Color(hex: "FF6B8A"), Color(hex: "C44569")], startPoint: .topLeading, endPoint: .bottomTrailing)
        case .passionate: return LinearGradient(colors: [Color(hex: "FF6348"), Color(hex: "EE5A24")], startPoint: .topLeading, endPoint: .bottomTrailing)
        case .playful: return LinearGradient(colors: [Color(hex: "FFB74D"), Color(hex: "FF8F00")], startPoint: .topLeading, endPoint: .bottomTrailing)
        case .relaxed: return LinearGradient(colors: [Color(hex: "4FC3F7"), Color(hex: "0288D1")], startPoint: .topLeading, endPoint: .bottomTrailing)
        case .adventurous: return LinearGradient(colors: [Color(hex: "A55EEA"), Color(hex: "8854D0")], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }
}

// MARK: - Video Tutorial
struct VideoTutorial: Identifiable {
    let id: String
    let title: String
    let titleEn: String
    let description: String
    let descriptionEn: String
    let duration: String
    let category: VideoCategory
    let icon: String
    let steps: [TutorialStep]
    let color1: String
    let color2: String
    
    var gradient: LinearGradient {
        LinearGradient(colors: [Color(hex: color1), Color(hex: color2)], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    func localizedTitle(_ l: LocalizationManager) -> String { l.isEnglish ? titleEn : title }
    func localizedDescription(_ l: LocalizationManager) -> String { l.isEnglish ? descriptionEn : description }
}

struct TutorialStep: Identifiable {
    let id = UUID()
    let stepNumber: Int
    let title: String
    let titleEn: String
    let description: String
    let descriptionEn: String
    let icon: String
    let duration: String
    
    func localizedTitle(_ l: LocalizationManager) -> String { l.isEnglish ? titleEn : title }
    func localizedDescription(_ l: LocalizationManager) -> String { l.isEnglish ? descriptionEn : description }
}

enum VideoCategory: String, CaseIterable {
    case massage
    case communication
    case intimacy
    case wellness
    case techniques
    
    func localizedName(_ l: LocalizationManager) -> String {
        switch self {
        case .massage: return l.L("Masaj", "Massage")
        case .communication: return l.L("Comunicare", "Communication")
        case .intimacy: return l.L("Intimitate", "Intimacy")
        case .wellness: return l.L("Wellness", "Wellness")
        case .techniques: return l.L("Tehnici", "Techniques")
        }
    }
    
    var sfIcon: String {
        switch self {
        case .massage: return "hand.raised.fill"
        case .communication: return "bubble.left.and.bubble.right.fill"
        case .intimacy: return "heart.fill"
        case .wellness: return "leaf.fill"
        case .techniques: return "lightbulb.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .massage: return Color(hex: "FF6348")
        case .communication: return Color(hex: "4FC3F7")
        case .intimacy: return Color(hex: "FF6B8A")
        case .wellness: return Color(hex: "66BB6A")
        case .techniques: return Color(hex: "A55EEA")
        }
    }
}

// MARK: - Love Language Result with Recommendations
struct LoveLanguageResult {
    let primaryLanguage: LoveLanguage
    let secondaryLanguage: LoveLanguage
    let scores: [LoveLanguage: Int]
    let recommendedPositions: [String]
    let recommendedActivities: [String]
    let recommendedActivitiesEn: [String]
    
    func localizedActivities(_ l: LocalizationManager) -> [String] {
        l.isEnglish ? recommendedActivitiesEn : recommendedActivities
    }
}
