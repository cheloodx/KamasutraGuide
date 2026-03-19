import SwiftUI

// MARK: - Quiz Game View
struct QuizGameView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var currentQuestion: QuizQuestion?
    @State private var selectedAnswer: Int?
    @State private var showExplanation = false
    @State private var score = 0
    @State private var questionsAnswered = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(localization.L("Cat de Bine Ma Cunosti?", "How Well Do You Know Me?"))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(colors: [Color(hex: "4FC3F7"), Color(hex: "0288D1")], startPoint: .leading, endPoint: .trailing)
                    )
                
                // Score
                HStack(spacing: 20) {
                    VStack {
                        Text("\(score)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "4CAF50"))
                        Text(localization.L("Corecte", "Correct"))
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                    }
                    
                    VStack {
                        Text("\(questionsAnswered)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "4FC3F7"))
                        Text(localization.L("Intrebari", "Questions"))
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white.opacity(0.08))
                )
                
                if let question = currentQuestion {
                    VStack(spacing: 16) {
                        Text(question.localizedQuestion(localization))
                            .font(.headline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        ForEach(0..<question.localizedOptions(localization).count, id: \.self) { index in
                            Button(action: {
                                if selectedAnswer == nil {
                                    selectedAnswer = index
                                    showExplanation = true
                                    questionsAnswered += 1
                                    if index == question.correctIndex {
                                        score += 1
                                    }
                                }
                            }) {
                                HStack {
                                    Text(question.localizedOptions(localization)[index])
                                        .foregroundColor(.white)
                                    Spacer()
                                    if let selected = selectedAnswer {
                                        if index == question.correctIndex {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundColor(Color(hex: "4CAF50"))
                                        } else if index == selected {
                                            Image(systemName: "xmark.circle.fill")
                                                .foregroundColor(Color(hex: "F44336"))
                                        }
                                    }
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(backgroundColor(for: index))
                                )
                            }
                        }
                        
                        if showExplanation {
                            VStack(spacing: 8) {
                                Image(systemName: "lightbulb.fill")
                                    .foregroundColor(Color(hex: "FFB74D"))
                                Text(question.localizedExplanation(localization))
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.7))
                                    .multilineTextAlignment(.center)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(hex: "FFB74D").opacity(0.1))
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                
                Button(action: { nextQuestion() }) {
                    HStack {
                        Image(systemName: "arrow.right.circle.fill")
                        Text(currentQuestion == nil ? localization.L("Incepe Quiz-ul", "Start Quiz") : localization.L("Urmatoarea Intrebare", "Next Question"))
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(LinearGradient(colors: [Color(hex: "4FC3F7"), Color(hex: "0288D1")], startPoint: .leading, endPoint: .trailing))
                    )
                }
                .padding(.horizontal)
            }
            .padding(.top, 20)
        }
    }
    
    private func backgroundColor(for index: Int) -> Color {
        guard let selected = selectedAnswer, let question = currentQuestion else {
            return Color.white.opacity(0.08)
        }
        if index == question.correctIndex {
            return Color(hex: "4CAF50").opacity(0.3)
        } else if index == selected {
            return Color(hex: "F44336").opacity(0.3)
        }
        return Color.white.opacity(0.08)
    }
    
    private func nextQuestion() {
        selectedAnswer = nil
        showExplanation = false
        currentQuestion = GameData.quizQuestions.randomElement()
    }
}

// MARK: - Challenges Game View
struct ChallengesGameView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var currentChallenge: ChallengeCard?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(localization.L("Provocari de Cuplu", "Couple Challenges"))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(colors: [Color(hex: "FFB74D"), Color(hex: "FF8F00")], startPoint: .leading, endPoint: .trailing)
                    )
                
                Text(localization.L("Alege o provocare si distreaza-va impreuna!", "Choose a challenge and have fun together!"))
                    .foregroundColor(.white.opacity(0.6))
                
                if let challenge = currentChallenge {
                    VStack(spacing: 16) {
                        Image(systemName: challenge.icon)
                            .font(.system(size: 40))
                            .foregroundColor(Color(hex: "FFB74D"))
                        
                        Text(challenge.localizedTitle(localization))
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text(challenge.localizedDescription(localization))
                            .font(.body)
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                        
                        HStack(spacing: 20) {
                            HStack {
                                Image(systemName: "clock.fill")
                                Text(challenge.localizedDuration(localization))
                            }
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                            
                            HStack {
                                Image(systemName: "speedometer")
                                Text(challenge.localizedDifficulty(localization))
                            }
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(8)
                            .foregroundColor(Color(hex: "FFB74D"))
                        }
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white.opacity(0.08))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(hex: "FFB74D").opacity(0.3), lineWidth: 1)
                    )
                    .padding(.horizontal)
                    .transition(.scale.combined(with: .opacity))
                }
                
                Button(action: {
                    withAnimation(.spring()) {
                        currentChallenge = GameData.challenges.randomElement()
                    }
                }) {
                    HStack {
                        Image(systemName: "star.fill")
                        Text(currentChallenge == nil ? localization.L("Alege o Provocare", "Choose a Challenge") : localization.L("Alta Provocare", "Another Challenge"))
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(LinearGradient(colors: [Color(hex: "FFB74D"), Color(hex: "FF8F00")], startPoint: .leading, endPoint: .trailing))
                    )
                }
                .padding(.horizontal)
                
                // Show all challenges list
                VStack(alignment: .leading, spacing: 12) {
                    Text(localization.L("Toate Provocarile", "All Challenges"))
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    ForEach(GameData.challenges) { challenge in
                        HStack(spacing: 12) {
                            Image(systemName: challenge.icon)
                                .font(.title3)
                                .foregroundColor(Color(hex: "FFB74D"))
                                .frame(width: 36)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(challenge.localizedTitle(localization))
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                
                                Text(challenge.localizedDescription(localization))
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                                    .lineLimit(2)
                            }
                            
                            Spacer()
                            
                            Text(challenge.localizedDifficulty(localization))
                                .font(.caption2)
                                .fontWeight(.bold)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(8)
                                .foregroundColor(.white.opacity(0.6))
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 8)
            }
            .padding(.top, 20)
            .padding(.bottom, 20)
        }
    }
}

// MARK: - Position Roulette View
struct PositionRouletteView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var localization: LocalizationManager
    @State private var selectedPosition: Position?
    @State private var isSpinning = false
    @State private var rotation: Double = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(localization.L("Ruleta Pozitiilor", "Position Roulette"))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(colors: [Color(hex: "FC5C7D"), Color(hex: "6A82FB")], startPoint: .leading, endPoint: .trailing)
                    )
                
                Text(localization.L("Lasa soarta sa aleaga pentru voi!", "Let fate choose for you!"))
                    .foregroundColor(.white.opacity(0.6))
                
                // Spinning wheel
                ZStack {
                    Circle()
                        .fill(LinearGradient(colors: [Color(hex: "FC5C7D").opacity(0.2), Color(hex: "6A82FB").opacity(0.2)], startPoint: .top, endPoint: .bottom))
                        .frame(width: 150, height: 150)
                    
                    Image(systemName: "arrow.triangle.2.circlepath")
                        .font(.system(size: 50))
                        .foregroundStyle(LinearGradient(colors: [Color(hex: "FC5C7D"), Color(hex: "6A82FB")], startPoint: .top, endPoint: .bottom))
                        .rotationEffect(.degrees(rotation))
                }
                
                if let position = selectedPosition {
                    VStack(spacing: 16) {
                        Image(position.id)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 150)
                            .clipped()
                            .cornerRadius(16)
                        
                        Text(position.localizedName(localization))
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        HStack(spacing: 8) {
                            Text(position.category.localizedName(localization))
                                .font(.caption)
                                .fontWeight(.bold)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Theme.categoryColor(position.category).opacity(0.3))
                                .cornerRadius(8)
                                .foregroundColor(Theme.categoryColor(position.category))
                            
                            Text(position.difficulty.localizedName(localization))
                                .font(.caption)
                                .fontWeight(.bold)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Theme.difficultyColor(position.difficulty).opacity(0.3))
                                .cornerRadius(8)
                                .foregroundColor(Theme.difficultyColor(position.difficulty))
                        }
                        
                        Text(position.localizedDescription(localization))
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.7))
                            .multilineTextAlignment(.center)
                    }
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white.opacity(0.08))
                    )
                    .padding(.horizontal)
                    .transition(.scale.combined(with: .opacity))
                }
                
                Button(action: { spin() }) {
                    HStack {
                        Image(systemName: "arrow.triangle.2.circlepath")
                        Text(selectedPosition == nil ? localization.L("Invarte Ruleta!", "Spin the Roulette!") : localization.L("Invarte Din Nou!", "Spin Again!"))
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(LinearGradient(colors: [Color(hex: "FC5C7D"), Color(hex: "6A82FB")], startPoint: .leading, endPoint: .trailing))
                    )
                }
                .padding(.horizontal)
                .disabled(isSpinning)
            }
            .padding(.top, 20)
        }
    }
    
    private func spin() {
        isSpinning = true
        withAnimation(.easeInOut(duration: 1.5)) {
            rotation += Double.random(in: 720...1440)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.spring()) {
                selectedPosition = PositionData.allPositions.randomElement()
                isSpinning = false
            }
        }
    }
}


// MARK: - Spin the Bottle Game
struct SpinTheBottleView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var currentAction: SpinAction?
    @State private var rotation: Double = 0
    @State private var isSpinning = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(localization.L("Invarte Sticla", "Spin the Bottle"))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(colors: [Color(hex: "E91E63"), Color(hex: "AD1457")], startPoint: .leading, endPoint: .trailing)
                    )
                
                Text(localization.L("Invarte sticla si urmeaza provocarea!", "Spin the bottle and follow the dare!"))
                    .foregroundColor(.white.opacity(0.6))
                
                ZStack {
                    Circle()
                        .fill(LinearGradient(colors: [Color(hex: "E91E63").opacity(0.2), Color(hex: "AD1457").opacity(0.1)], startPoint: .top, endPoint: .bottom))
                        .frame(width: 160, height: 160)
                    
                    Image(systemName: "arrow.up")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundStyle(LinearGradient(colors: [Color(hex: "E91E63"), Color(hex: "AD1457")], startPoint: .top, endPoint: .bottom))
                        .rotationEffect(.degrees(rotation))
                }
                
                if let action = currentAction {
                    VStack(spacing: 12) {
                        Image(systemName: action.icon)
                            .font(.system(size: 36))
                            .foregroundColor(Color(hex: "E91E63"))
                        
                        Text(action.localizedText(localization))
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        HStack(spacing: 4) {
                            ForEach(0..<5) { i in
                                Image(systemName: i < action.intensity ? "flame.fill" : "flame")
                                    .foregroundColor(i < action.intensity ? Color(hex: "E91E63") : .white.opacity(0.3))
                            }
                        }
                        .font(.caption)
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.08)))
                    .padding(.horizontal)
                    .transition(.scale.combined(with: .opacity))
                }
                
                Button(action: { spin() }) {
                    HStack {
                        Image(systemName: "arrow.triangle.2.circlepath")
                        Text(localization.L("Invarte!", "Spin!"))
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(LinearGradient(colors: [Color(hex: "E91E63"), Color(hex: "AD1457")], startPoint: .leading, endPoint: .trailing)))
                }
                .padding(.horizontal)
                .disabled(isSpinning)
            }
            .padding(.top, 20)
        }
    }
    
    private func spin() {
        isSpinning = true
        withAnimation(.easeInOut(duration: 1.5)) {
            rotation += Double.random(in: 720...1440)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.spring()) {
                currentAction = GameData.spinActions.randomElement()
                isSpinning = false
            }
        }
    }
}

// MARK: - Strip Poker Game
struct StripPokerView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var player1Score: Int = 0
    @State private var player2Score: Int = 0
    @State private var currentRound: Int = 0
    @State private var player1Card: Int?
    @State private var player2Card: Int?
    @State private var roundResult: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("Strip Poker")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(LinearGradient(colors: [Color(hex: "FF5722"), Color(hex: "D84315")], startPoint: .leading, endPoint: .trailing))
                
                Text(localization.L("Jocul de carti cu provocari indraznete!", "The card game with bold dares!"))
                    .foregroundColor(.white.opacity(0.6))
                
                // Score
                HStack(spacing: 30) {
                    VStack {
                        Text(localization.L("Jucator 1", "Player 1"))
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                        Text("\(player1Score)")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(Color(hex: "4FC3F7"))
                    }
                    
                    Text("VS")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white.opacity(0.3))
                    
                    VStack {
                        Text(localization.L("Jucator 2", "Player 2"))
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                        Text("\(player2Score)")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(Color(hex: "FF5722"))
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.08)))
                
                if let c1 = player1Card, let c2 = player2Card {
                    HStack(spacing: 20) {
                        cardView(value: c1, color: Color(hex: "4FC3F7"))
                        cardView(value: c2, color: Color(hex: "FF5722"))
                    }
                    
                    Text(roundResult)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                }
                
                Text(localization.L("Runda \(currentRound + 1)", "Round \(currentRound + 1)"))
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.5))
                
                Button(action: { playRound() }) {
                    HStack {
                        Image(systemName: "suit.spade.fill")
                        Text(localization.L("Trage Cartile!", "Draw Cards!"))
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(LinearGradient(colors: [Color(hex: "FF5722"), Color(hex: "D84315")], startPoint: .leading, endPoint: .trailing)))
                }
                .padding(.horizontal)
                
                Button(action: { resetGame() }) {
                    Text(localization.L("Joc Nou", "New Game"))
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.5))
                }
            }
            .padding(.top, 20)
        }
    }
    
    private func cardView(value: Int, color: Color) -> some View {
        VStack {
            Text(suitForValue(value))
                .font(.system(size: 30))
            Text("\(value)")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(color)
        }
        .frame(width: 80, height: 110)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.1)))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(color.opacity(0.5), lineWidth: 1))
    }
    
    private func suitForValue(_ v: Int) -> String {
        let suits = ["\u{2660}", "\u{2665}", "\u{2666}", "\u{2663}"]
        return suits[v % 4]
    }
    
    private func playRound() {
        player1Card = Int.random(in: 2...14)
        player2Card = Int.random(in: 2...14)
        currentRound += 1
        
        if let c1 = player1Card, let c2 = player2Card {
            if c1 > c2 {
                player1Score += 1
                roundResult = localization.L("Jucatorul 1 castiga! Jucatorul 2 pierde o piesa!", "Player 1 wins! Player 2 loses an item!")
            } else if c2 > c1 {
                player2Score += 1
                roundResult = localization.L("Jucatorul 2 castiga! Jucatorul 1 pierde o piesa!", "Player 2 wins! Player 1 loses an item!")
            } else {
                roundResult = localization.L("Egalitate! Ambii pierd o piesa!", "Tie! Both lose an item!")
            }
        }
    }
    
    private func resetGame() {
        player1Score = 0; player2Score = 0; currentRound = 0
        player1Card = nil; player2Card = nil; roundResult = ""
    }
}

// MARK: - Body Painting Game
struct BodyPaintingView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var currentPrompt: String = ""
    @State private var currentZone: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(localization.L("Pictura pe Corp", "Body Painting"))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(LinearGradient(colors: [Color(hex: "9C27B0"), Color(hex: "6A1B9A")], startPoint: .leading, endPoint: .trailing))
                
                Text(localization.L("Deseneaza pe corpul partenerului!", "Draw on your partner's body!"))
                    .foregroundColor(.white.opacity(0.6))
                
                Image(systemName: "paintbrush.pointed.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(LinearGradient(colors: [Color(hex: "9C27B0"), Color(hex: "6A1B9A")], startPoint: .top, endPoint: .bottom))
                
                if !currentPrompt.isEmpty {
                    VStack(spacing: 16) {
                        Text(localization.L("Deseneaza:", "Draw:"))
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                        Text(currentPrompt)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Text(localization.L("Pe zona:", "On area:"))
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                        Text(currentZone)
                            .font(.title3)
                            .foregroundColor(Color(hex: "9C27B0"))
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.08)))
                    .padding(.horizontal)
                }
                
                Button(action: { generatePrompt() }) {
                    HStack {
                        Image(systemName: "paintbrush.fill")
                        Text(currentPrompt.isEmpty ? localization.L("Genereaza Provocare", "Generate Challenge") : localization.L("Alta Provocare", "Another Challenge"))
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(LinearGradient(colors: [Color(hex: "9C27B0"), Color(hex: "6A1B9A")], startPoint: .leading, endPoint: .trailing)))
                }
                .padding(.horizontal)
            }
            .padding(.top, 20)
        }
    }
    
    private func generatePrompt() {
        let prompts = GameData.bodyPaintingPrompts
        let zones = localization.isEnglish ?
            ["arm", "back", "shoulder", "chest", "leg", "neck", "hand", "belly"] :
            ["brat", "spate", "umar", "piept", "picior", "gat", "mana", "burta"]
        withAnimation(.spring()) {
            if let prompt = prompts.randomElement() {
                currentPrompt = localization.isEnglish ? prompt.en : prompt.ro
            }
            currentZone = zones.randomElement() ?? ""
        }
    }
}

// MARK: - Blindfold Game
struct BlindfoldGameView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var currentChallenge: String = ""
    @State private var timer: Int = 30
    @State private var isTimerRunning = false
    @State private var timerObj: Timer? = nil
    
    private var challenges: [String] {
        localization.isEnglish ? [
            "Touch your partner and guess the body part",
            "Feed your partner something and have them guess",
            "Guide your partner through the room",
            "Dance together while blindfolded",
            "Describe your partner using only touch",
            "Find your partner's lips for a kiss",
            "Draw a heart on your partner's back",
            "Massage your partner for 30 seconds",
            "Whisper a love confession blindfolded",
            "Try to braid your partner's hair blindfolded"
        ] : [
            "Atinge partenerul si ghiceste partea corpului",
            "Da-i partenerului sa manance ceva si sa ghiceasca",
            "Ghideaza-ti partenerul prin camera",
            "Dansati impreuna cu ochii legati",
            "Descrie-ti partenerul folosind doar atingerea",
            "Gaseste buzele partenerului pentru un sarut",
            "Deseneaza o inima pe spatele partenerului",
            "Maseaza partenerul 30 de secunde",
            "Sopteste o declaratie de dragoste legat la ochi",
            "Incearca sa impletesti parul partenerului legat la ochi"
        ]
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(localization.L("Legat la Ochi", "Blindfold"))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(LinearGradient(colors: [Color(hex: "795548"), Color(hex: "4E342E")], startPoint: .leading, endPoint: .trailing))
                
                Image(systemName: "eye.slash.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(LinearGradient(colors: [Color(hex: "795548"), Color(hex: "4E342E")], startPoint: .top, endPoint: .bottom))
                
                if !currentChallenge.isEmpty {
                    VStack(spacing: 16) {
                        Text(currentChallenge)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        // Timer
                        Text("\(timer)s")
                            .font(.system(size: 40, weight: .bold, design: .monospaced))
                            .foregroundColor(timer <= 10 ? Color(hex: "FF5722") : .white)
                        
                        HStack(spacing: 16) {
                            Button(action: { toggleTimer() }) {
                                Image(systemName: isTimerRunning ? "pause.fill" : "play.fill")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .frame(width: 50, height: 50)
                                    .background(Circle().fill(Color(hex: "795548")))
                            }
                            Button(action: { timer = 30; stopTimerFunc() }) {
                                Image(systemName: "arrow.counterclockwise")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .frame(width: 50, height: 50)
                                    .background(Circle().fill(Color.white.opacity(0.1)))
                            }
                        }
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.08)))
                    .padding(.horizontal)
                }
                
                Button(action: { nextChallenge() }) {
                    HStack {
                        Image(systemName: "eye.slash.fill")
                        Text(currentChallenge.isEmpty ? localization.L("Incepe Jocul", "Start Game") : localization.L("Alta Provocare", "Next Challenge"))
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(LinearGradient(colors: [Color(hex: "795548"), Color(hex: "4E342E")], startPoint: .leading, endPoint: .trailing)))
                }
                .padding(.horizontal)
            }
            .padding(.top, 20)
        }
        .onDisappear { stopTimerFunc() }
    }
    
    private func nextChallenge() {
        stopTimerFunc()
        timer = 30
        withAnimation(.spring()) {
            currentChallenge = challenges.randomElement() ?? ""
        }
    }
    
    private func toggleTimer() {
        if isTimerRunning { stopTimerFunc() } else { startTimerFunc() }
    }
    
    private func startTimerFunc() {
        isTimerRunning = true
        timerObj = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timer > 0 { timer -= 1 } else { stopTimerFunc() }
        }
    }
    
    private func stopTimerFunc() {
        isTimerRunning = false
        timerObj?.invalidate()
        timerObj = nil
    }
}

// MARK: - Countdown Game
struct CountdownGameView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var currentChallenge: CountdownChallenge?
    @State private var timeLeft: Int = 0
    @State private var isRunning = false
    @State private var timerObj: Timer? = nil
    @State private var currentLevel: Int = 1
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(localization.L("Numaratoare Inversa", "Countdown"))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(LinearGradient(colors: [Color(hex: "FF9800"), Color(hex: "E65100")], startPoint: .leading, endPoint: .trailing))
                
                Text(localization.L("Nivel \(currentLevel)", "Level \(currentLevel)"))
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "FF9800"))
                
                if let challenge = currentChallenge {
                    VStack(spacing: 16) {
                        Image(systemName: "timer")
                            .font(.system(size: 40))
                            .foregroundColor(Color(hex: "FF9800"))
                        
                        Text(challenge.localizedText(localization))
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Text("\(timeLeft)s")
                            .font(.system(size: 50, weight: .bold, design: .monospaced))
                            .foregroundColor(timeLeft <= 5 ? Color(hex: "F44336") : Color(hex: "FF9800"))
                        
                        if !isRunning && timeLeft == 0 {
                            Text(localization.L("Timp expirat! Urmatorul nivel!", "Time's up! Next level!"))
                                .font(.headline)
                                .foregroundColor(Color(hex: "4CAF50"))
                        }
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.08)))
                    .padding(.horizontal)
                }
                
                Button(action: { nextChallenge() }) {
                    HStack {
                        Image(systemName: "timer")
                        Text(currentChallenge == nil ? localization.L("Incepe!", "Start!") : localization.L("Nivelul Urmator", "Next Level"))
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(LinearGradient(colors: [Color(hex: "FF9800"), Color(hex: "E65100")], startPoint: .leading, endPoint: .trailing)))
                }
                .padding(.horizontal)
            }
            .padding(.top, 20)
        }
        .onDisappear { timerObj?.invalidate() }
    }
    
    private func nextChallenge() {
        timerObj?.invalidate()
        let challenges = GameData.countdownChallenges.filter { $0.intensity <= currentLevel + 2 }
        currentChallenge = challenges.randomElement() ?? GameData.countdownChallenges.first
        timeLeft = currentChallenge?.duration ?? 30
        isRunning = true
        
        timerObj = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeLeft > 0 { timeLeft -= 1 } else {
                timerObj?.invalidate()
                isRunning = false
                currentLevel += 1
            }
        }
    }
}

// MARK: - Love Bingo Game
struct LoveBingoView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var bingoItems: [BingoItem] = []
    @State private var completedCount: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Love Bingo")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(LinearGradient(colors: [Color(hex: "E91E63"), Color(hex: "C2185B")], startPoint: .leading, endPoint: .trailing))
                
                Text(localization.L("\(completedCount)/\(bingoItems.count) completate", "\(completedCount)/\(bingoItems.count) completed"))
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.5))
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                    ForEach(bingoItems.indices, id: \.self) { index in
                        Button(action: {
                            withAnimation(.spring()) {
                                bingoItems[index].isCompleted.toggle()
                                completedCount = bingoItems.filter { $0.isCompleted }.count
                            }
                        }) {
                            VStack(spacing: 6) {
                                Image(systemName: bingoItems[index].isCompleted ? "checkmark.circle.fill" : "circle")
                                    .font(.system(size: 24))
                                    .foregroundColor(bingoItems[index].isCompleted ? Color(hex: "E91E63") : .white.opacity(0.4))
                                Text(bingoItems[index].localizedText(localization))
                                    .font(.system(size: 9))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(3)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 90)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(bingoItems[index].isCompleted ? Color(hex: "E91E63").opacity(0.3) : Color.white.opacity(0.06))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(bingoItems[index].isCompleted ? Color(hex: "E91E63") : Color.clear, lineWidth: 2)
                            )
                        }
                    }
                }
                .padding(.horizontal)
                
                if completedCount == bingoItems.count && !bingoItems.isEmpty {
                    VStack(spacing: 8) {
                        Text("\u{1F389}")
                            .font(.system(size: 50))
                        Text("BINGO!")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(LinearGradient(colors: [Color(hex: "E91E63"), Color(hex: "C2185B")], startPoint: .leading, endPoint: .trailing))
                        Text(localization.L("Felicitari! Ati completat toate provocarile!", "Congratulations! You completed all challenges!"))
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
                
                Button(action: { resetBingo() }) {
                    HStack {
                        Image(systemName: "arrow.counterclockwise")
                        Text(localization.L("Bingo Nou", "New Bingo"))
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(LinearGradient(colors: [Color(hex: "E91E63"), Color(hex: "C2185B")], startPoint: .leading, endPoint: .trailing)))
                }
                .padding(.horizontal)
            }
            .padding(.top, 20)
            .padding(.bottom, 20)
        }
        .onAppear { if bingoItems.isEmpty { resetBingo() } }
    }
    
    private func resetBingo() {
        bingoItems = Array(GameData.bingoItems.shuffled().prefix(9))
        completedCount = 0
    }
}

// MARK: - Fantasy Cards Game
struct FantasyCardsView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var currentCard: FantasyCard?
    @State private var showCard = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(localization.L("Carti cu Fantezii", "Fantasy Cards"))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(LinearGradient(colors: [Color(hex: "7B1FA2"), Color(hex: "4A148C")], startPoint: .leading, endPoint: .trailing))
                
                Text(localization.L("Trage o carte si indeplineste fantezia!", "Draw a card and fulfill the fantasy!"))
                    .foregroundColor(.white.opacity(0.6))
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(LinearGradient(colors: [Color(hex: "7B1FA2").opacity(0.3), Color(hex: "4A148C").opacity(0.2)], startPoint: .top, endPoint: .bottom))
                        .frame(width: 140, height: 200)
                    
                    if let card = currentCard, showCard {
                        VStack(spacing: 12) {
                            Image(systemName: card.icon)
                                .font(.system(size: 36))
                                .foregroundColor(Color(hex: "7B1FA2"))
                            
                            Text(card.localizedCategory(localization))
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: "7B1FA2"))
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color(hex: "7B1FA2").opacity(0.2))
                                .cornerRadius(8)
                            
                            Text(card.localizedTitle(localization))
                                .font(.headline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            
                            Text(card.localizedDescription(localization))
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.7))
                                .multilineTextAlignment(.center)
                            
                            HStack(spacing: 4) {
                                ForEach(0..<5) { i in
                                    Image(systemName: i < card.intensity ? "star.fill" : "star")
                                        .foregroundColor(i < card.intensity ? Color(hex: "FFD700") : .white.opacity(0.3))
                                }
                            }
                            .font(.caption2)
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.08)))
                        .padding(.horizontal)
                        .transition(.scale.combined(with: .opacity))
                    } else {
                        VStack(spacing: 8) {
                            Image(systemName: "questionmark")
                                .font(.system(size: 40))
                                .foregroundColor(.white.opacity(0.3))
                            Text("?")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.white.opacity(0.3))
                        }
                    }
                }
                
                Button(action: { drawCard() }) {
                    HStack {
                        Image(systemName: "sparkles")
                        Text(localization.L("Trage o Carte", "Draw a Card"))
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(LinearGradient(colors: [Color(hex: "7B1FA2"), Color(hex: "4A148C")], startPoint: .leading, endPoint: .trailing)))
                }
                .padding(.horizontal)
            }
            .padding(.top, 20)
        }
    }
    
    private func drawCard() {
        withAnimation(.spring(response: 0.3)) { showCard = false }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            currentCard = GameData.fantasyCards.randomElement()
            withAnimation(.spring(response: 0.5)) { showCard = true }
        }
    }
}

// MARK: - Hot & Cold Game
struct HotAndColdView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var temperature: Double = 50
    @State private var targetZone: String = ""
    @State private var isPlaying = false
    
    private var zones: [String] {
        localization.isEnglish ?
            ["neck", "shoulders", "lower back", "hands", "feet", "forehead", "arms", "belly", "thighs", "ears"] :
            ["gat", "umeri", "spate jos", "maini", "picioare", "frunte", "brate", "burta", "coapse", "urechi"]
    }
    
    var temperatureColor: Color {
        if temperature < 30 { return Color(hex: "2196F3") }
        if temperature < 50 { return Color(hex: "4FC3F7") }
        if temperature < 70 { return Color(hex: "FFB74D") }
        return Color(hex: "F44336")
    }
    
    var temperatureText: String {
        if temperature < 25 { return localization.L("Inghetat!", "Freezing!") }
        if temperature < 50 { return localization.L("Rece", "Cold") }
        if temperature < 75 { return localization.L("Cald", "Warm") }
        return localization.L("Fierbinte!", "Hot!")
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(localization.L("Cald si Rece", "Hot & Cold"))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(LinearGradient(colors: [Color(hex: "F44336"), Color(hex: "2196F3")], startPoint: .leading, endPoint: .trailing))
                
                Text(localization.L("Ghideaza partenerul spre zona preferata!", "Guide your partner to the preferred zone!"))
                    .foregroundColor(.white.opacity(0.6))
                
                if isPlaying {
                    VStack(spacing: 16) {
                        Text(localization.L("Zona secreta:", "Secret zone:"))
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                        
                        Text(targetZone)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(temperatureColor)
                        
                        ZStack {
                            Circle()
                                .fill(temperatureColor.opacity(0.2))
                                .frame(width: 150, height: 150)
                            
                            Image(systemName: temperature >= 75 ? "flame.fill" : temperature >= 50 ? "thermometer.medium" : "snowflake")
                                .font(.system(size: 50))
                                .foregroundColor(temperatureColor)
                        }
                        
                        Text(temperatureText)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(temperatureColor)
                        
                        Slider(value: $temperature, in: 0...100)
                            .accentColor(temperatureColor)
                            .padding(.horizontal, 30)
                        
                        Text(localization.L("Misca sliderul pe masura ce partenerul se apropie!", "Move the slider as your partner gets closer!"))
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                            .multilineTextAlignment(.center)
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.08)))
                    .padding(.horizontal)
                }
                
                Button(action: { startGame() }) {
                    HStack {
                        Image(systemName: "flame.fill")
                        Text(isPlaying ? localization.L("Zona Noua", "New Zone") : localization.L("Incepe Jocul", "Start Game"))
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(LinearGradient(colors: [Color(hex: "F44336"), Color(hex: "2196F3")], startPoint: .leading, endPoint: .trailing)))
                }
                .padding(.horizontal)
            }
            .padding(.top, 20)
        }
    }
    
    private func startGame() {
        temperature = 50
        targetZone = zones.randomElement() ?? ""
        isPlaying = true
    }
}

// MARK: - Mystery Box Game
struct MysteryBoxView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var currentItem: MysteryBoxItem?
    @State private var isOpening = false
    @State private var showItem = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(localization.L("Cutia Misterioasa", "Mystery Box"))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(LinearGradient(colors: [Color(hex: "FF6F00"), Color(hex: "E65100")], startPoint: .leading, endPoint: .trailing))
                
                Text(localization.L("Deschide cutia si descopera surpriza!", "Open the box and discover the surprise!"))
                    .foregroundColor(.white.opacity(0.6))
                
                ZStack {
                    if !showItem {
                        VStack(spacing: 12) {
                            Image(systemName: isOpening ? "shippingbox" : "shippingbox.fill")
                                .font(.system(size: 70))
                                .foregroundStyle(LinearGradient(colors: [Color(hex: "FF6F00"), Color(hex: "E65100")], startPoint: .top, endPoint: .bottom))
                                .scaleEffect(isOpening ? 1.2 : 1.0)
                            
                            Text("?")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.white.opacity(0.4))
                        }
                    }
                    
                    if let item = currentItem, showItem {
                        VStack(spacing: 16) {
                            Image(systemName: item.icon)
                                .font(.system(size: 50))
                                .foregroundColor(Color(hex: "FF6F00"))
                            
                            Text(item.localizedText(localization))
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            
                            HStack(spacing: 4) {
                                ForEach(0..<5) { i in
                                    Image(systemName: i < item.intensity ? "flame.fill" : "flame")
                                        .foregroundColor(i < item.intensity ? Color(hex: "FF6F00") : .white.opacity(0.3))
                                }
                            }
                            .font(.caption)
                        }
                        .padding(24)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.08)))
                        .padding(.horizontal)
                        .transition(.scale.combined(with: .opacity))
                    }
                }
                
                Button(action: { openBox() }) {
                    HStack {
                        Image(systemName: "gift.fill")
                        Text(localization.L("Deschide Cutia!", "Open the Box!"))
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(LinearGradient(colors: [Color(hex: "FF6F00"), Color(hex: "E65100")], startPoint: .leading, endPoint: .trailing)))
                }
                .padding(.horizontal)
                .disabled(isOpening)
            }
            .padding(.top, 20)
        }
    }
    
    private func openBox() {
        showItem = false
        isOpening = true
        withAnimation(.easeInOut(duration: 0.5)) { }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            currentItem = GameData.mysteryBoxItems.randomElement()
            isOpening = false
            withAnimation(.spring()) { showItem = true }
        }
    }
}

// MARK: - Massage Roulette Game
struct MassageRouletteView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var currentZone: String = ""
    @State private var currentTechnique: String = ""
    @State private var currentDuration: Int = 0
    @State private var isSpinning = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(localization.L("Ruleta Masajului", "Massage Roulette"))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(LinearGradient(colors: [Color(hex: "00897B"), Color(hex: "004D40")], startPoint: .leading, endPoint: .trailing))
                
                Text(localization.L("Soarta decide cum masezi!", "Fate decides how you massage!"))
                    .foregroundColor(.white.opacity(0.6))
                
                Image(systemName: "hand.raised.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(LinearGradient(colors: [Color(hex: "00897B"), Color(hex: "004D40")], startPoint: .top, endPoint: .bottom))
                
                if !currentZone.isEmpty {
                    VStack(spacing: 16) {
                        HStack(spacing: 30) {
                            VStack(spacing: 8) {
                                Text(localization.L("Zona", "Zone"))
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                                Text(currentZone)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(hex: "00897B"))
                            }
                            
                            VStack(spacing: 8) {
                                Text(localization.L("Tehnica", "Technique"))
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                                Text(currentTechnique)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        HStack {
                            Image(systemName: "clock.fill")
                            Text("\(currentDuration) " + localization.L("minute", "minutes"))
                        }
                        .font(.headline)
                        .foregroundColor(Color(hex: "00897B"))
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.08)))
                    .padding(.horizontal)
                }
                
                Button(action: { spinRoulette() }) {
                    HStack {
                        Image(systemName: "arrow.triangle.2.circlepath")
                        Text(currentZone.isEmpty ? localization.L("Invarte Ruleta!", "Spin Roulette!") : localization.L("Invarte Din Nou!", "Spin Again!"))
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(LinearGradient(colors: [Color(hex: "00897B"), Color(hex: "004D40")], startPoint: .leading, endPoint: .trailing)))
                }
                .padding(.horizontal)
                .disabled(isSpinning)
            }
            .padding(.top, 20)
        }
    }
    
    private func spinRoulette() {
        isSpinning = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.spring()) {
                if let zone = GameData.massageZones.randomElement() {
                    currentZone = localization.isEnglish ? zone.en : zone.ro
                }
                if let technique = GameData.massageTechniques.randomElement() {
                    currentTechnique = localization.isEnglish ? technique.en : technique.ro
                }
                currentDuration = [1, 2, 3, 5].randomElement() ?? 2
                isSpinning = false
            }
        }
    }
}

// MARK: - Love Story Game
struct LoveStoryView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var storyParts: [String] = []
    @State private var currentPrompt: String = ""
    @State private var inputText: String = ""
    @State private var storyStarted = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(localization.L("Povestea Noastra", "Our Love Story"))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(LinearGradient(colors: [Color(hex: "EC407A"), Color(hex: "AD1457")], startPoint: .leading, endPoint: .trailing))
                
                Text(localization.L("Scrieti impreuna o poveste de dragoste!", "Write a love story together!"))
                    .foregroundColor(.white.opacity(0.6))
                
                if storyStarted {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(storyParts.indices, id: \.self) { index in
                            Text(storyParts[index])
                                .font(.system(size: 15))
                                .foregroundColor(.white.opacity(0.8))
                                .lineSpacing(4)
                        }
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.06)))
                    .padding(.horizontal)
                    
                    if !currentPrompt.isEmpty {
                        Text(currentPrompt)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "EC407A"))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        HStack {
                            TextField(localization.L("Continua povestea...", "Continue the story..."), text: $inputText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(.white)
                            
                            Button(action: { addToStory() }) {
                                Image(systemName: "arrow.right.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(Color(hex: "EC407A"))
                            }
                            .disabled(inputText.isEmpty)
                        }
                        .padding(.horizontal)
                    }
                } else {
                    Image(systemName: "book.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(LinearGradient(colors: [Color(hex: "EC407A"), Color(hex: "AD1457")], startPoint: .top, endPoint: .bottom))
                }
                
                if !storyStarted {
                    Button(action: { startStory() }) {
                        HStack {
                            Image(systemName: "pencil")
                            Text(localization.L("Incepe Povestea", "Start Story"))
                        }
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 16).fill(LinearGradient(colors: [Color(hex: "EC407A"), Color(hex: "AD1457")], startPoint: .leading, endPoint: .trailing)))
                    }
                    .padding(.horizontal)
                }
                
                if storyParts.count >= 6 {
                    Button(action: { storyStarted = false; storyParts = [] }) {
                        HStack {
                            Image(systemName: "arrow.counterclockwise")
                            Text(localization.L("Poveste Noua", "New Story"))
                        }
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.1)))
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 20)
        }
    }
    
    private func startStory() {
        storyStarted = true
        storyParts = []
        nextPrompt()
    }
    
    private func addToStory() {
        storyParts.append(inputText)
        inputText = ""
        nextPrompt()
    }
    
    private func nextPrompt() {
        let prompts = GameData.loveStoryPrompts
        if let prompt = prompts.randomElement() {
            currentPrompt = localization.isEnglish ? prompt.en : prompt.ro
        }
    }
}

// MARK: - Tempo Game
struct TempoGameView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var currentChallenge: TempoChallenge?
    @State private var timeLeft: Int = 0
    @State private var isRunning = false
    @State private var timerObj: Timer? = nil
    @State private var currentTempo: Int = 1
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("Tempo")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(LinearGradient(colors: [Color(hex: "D32F2F"), Color(hex: "B71C1C")], startPoint: .leading, endPoint: .trailing))
                
                Text(localization.L("Provocari cu timp limitat, tot mai intense!", "Time-limited challenges, getting more intense!"))
                    .foregroundColor(.white.opacity(0.6))
                
                // Tempo indicator
                HStack(spacing: 4) {
                    ForEach(1...5, id: \.self) { level in
                        RoundedRectangle(cornerRadius: 4)
                            .fill(level <= currentTempo ? Color(hex: "D32F2F") : Color.white.opacity(0.1))
                            .frame(width: 40, height: 8)
                    }
                }
                
                Text(localization.L("Tempo: \(currentTempo)/5", "Tempo: \(currentTempo)/5"))
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
                
                if let challenge = currentChallenge {
                    VStack(spacing: 16) {
                        Image(systemName: "bolt.fill")
                            .font(.system(size: 36))
                            .foregroundColor(Color(hex: "D32F2F"))
                        
                        Text(challenge.localizedText(localization))
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Text("\(timeLeft)s")
                            .font(.system(size: 44, weight: .bold, design: .monospaced))
                            .foregroundColor(timeLeft <= 5 ? Color(hex: "FF5722") : Color(hex: "D32F2F"))
                        
                        if !isRunning && timeLeft == 0 && currentChallenge != nil {
                            Text(localization.L("Bine! Creste tempo-ul!", "Good! Tempo up!"))
                                .font(.headline)
                                .foregroundColor(Color(hex: "4CAF50"))
                        }
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.08)))
                    .padding(.horizontal)
                }
                
                Button(action: { nextChallenge() }) {
                    HStack {
                        Image(systemName: "bolt.fill")
                        Text(currentChallenge == nil ? localization.L("Incepe!", "Start!") : localization.L("Urmatorul!", "Next!"))
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(LinearGradient(colors: [Color(hex: "D32F2F"), Color(hex: "B71C1C")], startPoint: .leading, endPoint: .trailing)))
                }
                .padding(.horizontal)
                
                Button(action: { resetTempo() }) {
                    Text(localization.L("Reseteaza Tempo", "Reset Tempo"))
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.5))
                }
            }
            .padding(.top, 20)
        }
        .onDisappear { timerObj?.invalidate() }
    }
    
    private func nextChallenge() {
        timerObj?.invalidate()
        let challenges = GameData.tempoChallenges.filter { $0.level <= currentTempo + 1 }
        currentChallenge = challenges.randomElement() ?? GameData.tempoChallenges.first
        timeLeft = currentChallenge?.duration ?? 20
        isRunning = true
        
        timerObj = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeLeft > 0 { timeLeft -= 1 } else {
                timerObj?.invalidate()
                isRunning = false
                if currentTempo < 5 { currentTempo += 1 }
            }
        }
    }
    
    private func resetTempo() {
        timerObj?.invalidate()
        isRunning = false
        currentTempo = 1
        currentChallenge = nil
        timeLeft = 0
    }
}
