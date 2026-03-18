import Foundation
import SwiftUI

// MARK: - Couple Game Model
struct CoupleGame: Identifiable {
    let id: String
    let name: String
    let nameEn: String
    let icon: String
    let description: String
    let descriptionEn: String
    let color1: String
    let color2: String
    let minPlayers: Int
    
    var gradient: LinearGradient {
        LinearGradient(
            colors: [Color(hex: color1), Color(hex: color2)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    func localizedName(_ l: LocalizationManager) -> String {
        l.isEnglish ? nameEn : name
    }
    
    func localizedDescription(_ l: LocalizationManager) -> String {
        l.isEnglish ? descriptionEn : description
    }
}

// MARK: - Truth or Dare
enum TruthOrDareType: String, CaseIterable {
    case truth = "Adevar"
    case dare = "Provocare"
    
    var icon: String {
        switch self {
        case .truth: return "bubble.left.fill"
        case .dare: return "flame.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .truth: return Color(hex: "4FC3F7")
        case .dare: return Color(hex: "FF6B8A")
        }
    }
    
    func localizedName(_ l: LocalizationManager) -> String {
        switch self {
        case .truth: return l.L("Adevar", "Truth")
        case .dare: return l.L("Provocare", "Dare")
        }
    }
}

struct TruthOrDareCard: Identifiable {
    let id = UUID()
    let type: TruthOrDareType
    let text: String
    let textEn: String
    let intensity: Int
    
    func localizedText(_ l: LocalizationManager) -> String {
        l.isEnglish ? textEn : text
    }
}

// MARK: - Would You Rather
struct WouldYouRatherCard: Identifiable {
    let id = UUID()
    let optionA: String
    let optionAEn: String
    let optionB: String
    let optionBEn: String
    let category: String
    let categoryEn: String
    
    func localizedOptionA(_ l: LocalizationManager) -> String { l.isEnglish ? optionAEn : optionA }
    func localizedOptionB(_ l: LocalizationManager) -> String { l.isEnglish ? optionBEn : optionB }
    func localizedCategory(_ l: LocalizationManager) -> String { l.isEnglish ? categoryEn : category }
}

// MARK: - Dice Game
struct DiceAction: Identifiable {
    let id = UUID()
    let action: String
    let actionEn: String
    let bodyPart: String
    let bodyPartEn: String
    let duration: String
    let durationEn: String
    let icon: String
    
    func localizedAction(_ l: LocalizationManager) -> String { l.isEnglish ? actionEn : action }
    func localizedBodyPart(_ l: LocalizationManager) -> String { l.isEnglish ? bodyPartEn : bodyPart }
    func localizedDuration(_ l: LocalizationManager) -> String { l.isEnglish ? durationEn : duration }
}

// MARK: - Quiz
struct QuizQuestion: Identifiable {
    let id = UUID()
    let question: String
    let questionEn: String
    let options: [String]
    let optionsEn: [String]
    let correctIndex: Int
    let explanation: String
    let explanationEn: String
    
    func localizedQuestion(_ l: LocalizationManager) -> String { l.isEnglish ? questionEn : question }
    func localizedOptions(_ l: LocalizationManager) -> [String] { l.isEnglish ? optionsEn : options }
    func localizedExplanation(_ l: LocalizationManager) -> String { l.isEnglish ? explanationEn : explanation }
}

// MARK: - Challenge Card
struct ChallengeCard: Identifiable {
    let id = UUID()
    let title: String
    let titleEn: String
    let description: String
    let descriptionEn: String
    let duration: String
    let durationEn: String
    let difficulty: String
    let difficultyEn: String
    let icon: String
    
    func localizedTitle(_ l: LocalizationManager) -> String { l.isEnglish ? titleEn : title }
    func localizedDescription(_ l: LocalizationManager) -> String { l.isEnglish ? descriptionEn : description }
    func localizedDuration(_ l: LocalizationManager) -> String { l.isEnglish ? durationEn : duration }
    func localizedDifficulty(_ l: LocalizationManager) -> String { l.isEnglish ? difficultyEn : difficulty }
}

// MARK: - Spin the Bottle Action
struct SpinAction: Identifiable {
    let id = UUID()
    let text: String
    let textEn: String
    let intensity: Int
    let icon: String
    
    func localizedText(_ l: LocalizationManager) -> String { l.isEnglish ? textEn : text }
}

// MARK: - Fantasy Card
struct FantasyCard: Identifiable {
    let id = UUID()
    let title: String
    let titleEn: String
    let description: String
    let descriptionEn: String
    let category: String
    let categoryEn: String
    let intensity: Int
    let icon: String
    
    func localizedTitle(_ l: LocalizationManager) -> String { l.isEnglish ? titleEn : title }
    func localizedDescription(_ l: LocalizationManager) -> String { l.isEnglish ? descriptionEn : description }
    func localizedCategory(_ l: LocalizationManager) -> String { l.isEnglish ? categoryEn : category }
}

// MARK: - Bingo Item
struct BingoItem: Identifiable {
    let id = UUID()
    let text: String
    let textEn: String
    var isCompleted: Bool = false
    
    func localizedText(_ l: LocalizationManager) -> String { l.isEnglish ? textEn : text }
}

// MARK: - Countdown Challenge
struct CountdownChallenge: Identifiable {
    let id = UUID()
    let text: String
    let textEn: String
    let duration: Int // seconds
    let intensity: Int
    
    func localizedText(_ l: LocalizationManager) -> String { l.isEnglish ? textEn : text }
}

// MARK: - Mystery Box Item
struct MysteryBoxItem: Identifiable {
    let id = UUID()
    let text: String
    let textEn: String
    let icon: String
    let intensity: Int
    
    func localizedText(_ l: LocalizationManager) -> String { l.isEnglish ? textEn : text }
}

// MARK: - Tempo Challenge
struct TempoChallenge: Identifiable {
    let id = UUID()
    let text: String
    let textEn: String
    let duration: Int
    let level: Int
    
    func localizedText(_ l: LocalizationManager) -> String { l.isEnglish ? textEn : text }
}
