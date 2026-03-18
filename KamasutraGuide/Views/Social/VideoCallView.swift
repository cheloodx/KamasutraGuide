import SwiftUI

// MARK: - Game Detail Router View
struct GameDetailView: View {
    let game: CoupleGame
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var localization: LocalizationManager
    
    var body: some View {
        NavigationView {
            Group {
                switch game.id {
                case "truth-or-dare":
                    TruthOrDareGameView()
                case "would-you-rather":
                    WouldYouRatherGameView()
                case "dice-game":
                    DiceGameView()
                case "quiz":
                    QuizGameView()
                case "challenges":
                    ChallengesGameView()
                case "position-roulette":
                    PositionRouletteView()
                        .environmentObject(appState)
                case "spin-the-bottle":
                    SpinTheBottleView()
                case "fantasy-cards":
                    FantasyCardsView()
                case "love-bingo":
                    LoveBingoView()
                case "countdown":
                    CountdownGameView()
                case "mystery-box":
                    MysteryBoxView()
                case "tempo":
                    TempoGameView()
                case "body-painting":
                    BodyPaintingView()
                case "blindfold-game":
                    BlindfoldGameView()
                case "hot-and-cold":
                    HotAndColdView()
                case "massage-roulette":
                    MassageRouletteView()
                case "love-story":
                    LoveStoryView()
                case "strip-poker":
                    StripPokerView()
                default:
                    Text(localization.L("Joc in curs de dezvoltare", "Game in development"))
                }
            }
            .background(Theme.backgroundGradient.ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title3)
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
            }
        }
    }
}

// MARK: - Truth or Dare Game
struct TruthOrDareGameView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var currentCard: TruthOrDareCard?
    @State private var showCard = false
    @State private var selectedType: TruthOrDareType?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(localization.L("Adevar sau Provocare", "Truth or Dare"))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Theme.primaryGradient)
                
                Text(localization.L("Alege intre Adevar si Provocare!", "Choose between Truth and Dare!"))
                    .foregroundColor(.white.opacity(0.6))
                
                if let card = currentCard, showCard {
                    VStack(spacing: 16) {
                        HStack {
                            Image(systemName: card.type.icon)
                                .foregroundColor(card.type.color)
                            Text(card.type.localizedName(localization))
                                .fontWeight(.bold)
                                .foregroundColor(card.type.color)
                        }
                        .font(.title3)
                        
                        Text(card.localizedText(localization))
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        HStack(spacing: 4) {
                            ForEach(0..<5) { i in
                                Image(systemName: i < card.intensity ? "flame.fill" : "flame")
                                    .foregroundColor(i < card.intensity ? Color(hex: "FF6B8A") : .white.opacity(0.3))
                            }
                        }
                        .font(.caption)
                        
                        Text(localization.L("Intensitate: \(card.intensity)/5", "Intensity: \(card.intensity)/5"))
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(LinearGradient(
                                colors: [Color.white.opacity(0.1), Color.white.opacity(0.05)],
                                startPoint: .top,
                                endPoint: .bottom
                            ))
                    )
                    .padding(.horizontal)
                    .transition(.scale.combined(with: .opacity))
                }
                
                HStack(spacing: 16) {
                    Button(action: { drawCard(.truth) }) {
                        HStack {
                            Image(systemName: "bubble.left.fill")
                            Text(localization.L("Adevar", "Truth"))
                        }
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(LinearGradient(colors: [Color(hex: "4FC3F7"), Color(hex: "0288D1")], startPoint: .top, endPoint: .bottom))
                        )
                    }
                    
                    Button(action: { drawCard(.dare) }) {
                        HStack {
                            Image(systemName: "flame.fill")
                            Text(localization.L("Provocare", "Dare"))
                        }
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Theme.primaryGradient)
                        )
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top, 20)
        }
    }
    
    private func drawCard(_ type: TruthOrDareType) {
        withAnimation(.spring(response: 0.5)) {
            showCard = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let cards = type == .truth ? GameData.truthCards : GameData.dareCards
            currentCard = cards.randomElement()
            withAnimation(.spring(response: 0.5)) {
                showCard = true
            }
        }
    }
}

// MARK: - Would You Rather Game
struct WouldYouRatherGameView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var currentCard: WouldYouRatherCard?
    @State private var selectedOption: String?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(localization.L("Ce Ai Prefera?", "Would You Rather?"))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(colors: [Color(hex: "A55EEA"), Color(hex: "8854D0")], startPoint: .leading, endPoint: .trailing)
                    )
                
                if let card = currentCard {
                    VStack(spacing: 16) {
                        Text(card.localizedCategory(localization))
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(Color(hex: "A55EEA").opacity(0.3))
                            .cornerRadius(10)
                            .foregroundColor(Color(hex: "A55EEA"))
                        
                        Button(action: { selectedOption = "A" }) {
                            Text(card.localizedOptionA(localization))
                                .font(.headline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(selectedOption == "A" ? Color(hex: "A55EEA") : Color.white.opacity(0.08))
                                )
                        }
                        
                        Text(localization.L("SAU", "OR"))
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white.opacity(0.4))
                        
                        Button(action: { selectedOption = "B" }) {
                            Text(card.localizedOptionB(localization))
                                .font(.headline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(selectedOption == "B" ? Color(hex: "8854D0") : Color.white.opacity(0.08))
                                )
                        }
                    }
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white.opacity(0.05))
                    )
                    .padding(.horizontal)
                }
                
                Button(action: { nextCard() }) {
                    HStack {
                        Image(systemName: "arrow.right.circle.fill")
                        Text(currentCard == nil ? localization.L("Incepe Jocul", "Start Game") : localization.L("Urmatoarea Intrebare", "Next Question"))
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(LinearGradient(colors: [Color(hex: "A55EEA"), Color(hex: "8854D0")], startPoint: .leading, endPoint: .trailing))
                    )
                }
                .padding(.horizontal)
            }
            .padding(.top, 20)
        }
    }
    
    private func nextCard() {
        selectedOption = nil
        currentCard = GameData.wouldYouRather.randomElement()
    }
}

// MARK: - Dice Game
struct DiceGameView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var currentAction: DiceAction?
    @State private var isRolling = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(localization.L("Zarurile Pasiunii", "Passion Dice"))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(colors: [Color(hex: "FF6348"), Color(hex: "EE5A24")], startPoint: .leading, endPoint: .trailing)
                    )
                
                Text(localization.L("Arunca zarurile si urmeaza instructiunile!", "Roll the dice and follow the instructions!"))
                    .foregroundColor(.white.opacity(0.6))
                
                // Dice display
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(LinearGradient(colors: [Color(hex: "FF6348").opacity(0.2), Color(hex: "EE5A24").opacity(0.1)], startPoint: .top, endPoint: .bottom))
                        .frame(width: 120, height: 120)
                    
                    Image(systemName: "dice.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(LinearGradient(colors: [Color(hex: "FF6348"), Color(hex: "EE5A24")], startPoint: .top, endPoint: .bottom))
                        .rotationEffect(.degrees(isRolling ? 360 : 0))
                }
                
                if let action = currentAction {
                    VStack(spacing: 16) {
                        Image(systemName: action.icon)
                            .font(.system(size: 40))
                            .foregroundColor(Color(hex: "FF6348"))
                        
                        Text(action.localizedAction(localization))
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text(action.localizedBodyPart(localization))
                            .font(.title3)
                            .foregroundColor(Color(hex: "FF6348"))
                        
                        HStack {
                            Image(systemName: "clock.fill")
                            Text(action.localizedDuration(localization))
                        }
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.6))
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white.opacity(0.08))
                    )
                    .padding(.horizontal)
                    .transition(.scale.combined(with: .opacity))
                }
                
                Button(action: { rollDice() }) {
                    HStack {
                        Image(systemName: "dice.fill")
                        Text(localization.L("Arunca Zarurile!", "Roll the Dice!"))
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(LinearGradient(colors: [Color(hex: "FF6348"), Color(hex: "EE5A24")], startPoint: .leading, endPoint: .trailing))
                    )
                }
                .padding(.horizontal)
            }
            .padding(.top, 20)
        }
    }
    
    private func rollDice() {
        withAnimation(.easeInOut(duration: 0.5)) {
            isRolling = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.spring()) {
                isRolling = false
                currentAction = GameData.diceActions.randomElement()
            }
        }
    }
}
