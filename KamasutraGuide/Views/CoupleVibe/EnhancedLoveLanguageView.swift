import SwiftUI

struct EnhancedLoveLanguageView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var currentQuestion = 0
    @State private var scores: [LoveLanguage: Int] = [
        .wordsOfAffirmation: 0,
        .physicalTouch: 0,
        .qualityTime: 0,
        .receivingGifts: 0,
        .actsOfService: 0
    ]
    @State private var showResult = false
    @State private var result: LoveLanguageResult?
    
    private let questions = FeatureData.loveLanguageQuestions
    
    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            
            if showResult, let result = result {
                resultView(result)
            } else {
                questionView
            }
        }
        .navigationTitle(localization.L("Test Limbajul Iubirii", "Love Language Test"))
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var questionView: some View {
        VStack(spacing: 20) {
            // Header
            VStack(spacing: 8) {
                Text("\u{1F49D}")
                    .font(.system(size: 50))
                Text(localization.L("Descopera Limbajul Tau al Iubirii", "Discover Your Love Language"))
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text(localization.L("Raspunde la 15 intrebari pentru a afla cum iubesti", "Answer 15 questions to find out how you love"))
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.5))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            // Progress
            VStack(spacing: 6) {
                HStack {
                    Text(localization.L("Intrebarea \(currentQuestion + 1)/15", "Question \(currentQuestion + 1)/15"))
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white.opacity(0.7))
                    Spacer()
                    Text("\(Int(Double(currentQuestion) / 15.0 * 100))%")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(Theme.primary)
                }
                
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.white.opacity(0.1))
                            .frame(height: 6)
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Theme.primaryGradient)
                            .frame(width: geo.size.width * Double(currentQuestion) / 15.0, height: 6)
                    }
                }
                .frame(height: 6)
            }
            .padding(.horizontal)
            
            Spacer()
            
            if currentQuestion < questions.count {
                let q = questions[currentQuestion]
                
                VStack(spacing: 16) {
                    Text(localization.L("Ce preferi?", "What do you prefer?"))
                        .font(.system(size: 15))
                        .foregroundColor(.white.opacity(0.6))
                    
                    Button {
                        selectOption(q.languageA)
                    } label: {
                        Text(q.localizedOptionA(localization))
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: "FF6B8A").opacity(0.15))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color(hex: "FF6B8A").opacity(0.3), lineWidth: 1)
                            )
                            .cornerRadius(16)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Text(localization.L("SAU", "OR"))
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.white.opacity(0.3))
                    
                    Button {
                        selectOption(q.languageB)
                    } label: {
                        Text(q.localizedOptionB(localization))
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: "A55EEA").opacity(0.15))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color(hex: "A55EEA").opacity(0.3), lineWidth: 1)
                            )
                            .cornerRadius(16)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
    }
    
    private func selectOption(_ language: LoveLanguage) {
        scores[language, default: 0] += 1
        
        if currentQuestion < questions.count - 1 {
            withAnimation { currentQuestion += 1 }
        } else {
            calculateResult()
        }
    }
    
    private func calculateResult() {
        let sorted = scores.sorted { $0.value > $1.value }
        let primary = sorted[0].key
        let secondary = sorted.count > 1 ? sorted[1].key : primary
        
        var rec = CoupleVibeData.recommendationsForLanguage(primary)
        rec = LoveLanguageResult(
            primaryLanguage: primary,
            secondaryLanguage: secondary,
            scores: scores,
            recommendedPositions: rec.recommendedPositions,
            recommendedActivities: rec.recommendedActivities,
            recommendedActivitiesEn: rec.recommendedActivitiesEn
        )
        
        result = rec
        withAnimation { showResult = true }
    }
    
    private func resultView(_ result: LoveLanguageResult) -> some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                VStack(spacing: 8) {
                    Text("\u{1F49D}")
                        .font(.system(size: 50))
                    Text(localization.L("Rezultatul Tau", "Your Result"))
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                }
                
                // Primary Language
                VStack(spacing: 10) {
                    Text(localization.L("Limbajul tau principal", "Your primary language"))
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.5))
                    
                    HStack(spacing: 10) {
                        Image(systemName: result.primaryLanguage.icon)
                            .font(.system(size: 24))
                            .foregroundColor(result.primaryLanguage.color)
                        Text(result.primaryLanguage.localizedName(localization))
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    Text(result.primaryLanguage.localizedDescription(localization))
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.7))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                }
                .padding()
                .background(result.primaryLanguage.color.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(result.primaryLanguage.color.opacity(0.3), lineWidth: 1)
                )
                .cornerRadius(18)
                .padding(.horizontal)
                
                // Score Bars
                VStack(alignment: .leading, spacing: 10) {
                    Text(localization.L("Scoruri", "Scores"))
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                    
                    ForEach(LoveLanguage.allCases, id: \.rawValue) { lang in
                        HStack(spacing: 8) {
                            Image(systemName: lang.icon)
                                .font(.system(size: 12))
                                .foregroundColor(lang.color)
                                .frame(width: 20)
                            
                            Text(lang.localizedName(localization))
                                .font(.system(size: 12))
                                .foregroundColor(.white.opacity(0.7))
                                .frame(width: 100, alignment: .leading)
                            
                            GeometryReader { geo in
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color.white.opacity(0.1))
                                        .frame(height: 8)
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(lang.color)
                                        .frame(width: geo.size.width * Double(result.scores[lang] ?? 0) / Double(max(1, result.scores.values.max() ?? 1)), height: 8)
                                }
                            }
                            .frame(height: 8)
                            
                            Text("\(result.scores[lang] ?? 0)")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 20)
                        }
                    }
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(16)
                .padding(.horizontal)
                
                // Recommended Activities
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "sparkles")
                            .foregroundColor(Theme.primary)
                        Text(localization.L("Activitati recomandate", "Recommended activities"))
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    ForEach(result.localizedActivities(localization), id: \.self) { activity in
                        HStack(spacing: 8) {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 10))
                                .foregroundColor(Theme.primary)
                            Text(activity)
                                .font(.system(size: 14))
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                }
                .padding()
                .background(Theme.primary.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Theme.primary.opacity(0.2), lineWidth: 1)
                )
                .cornerRadius(16)
                .padding(.horizontal)
                
                // Recommended Positions
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "square.grid.2x2.fill")
                            .foregroundColor(Theme.accent)
                        Text(localization.L("Pozitii recomandate", "Recommended positions"))
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    let matchedPositions = PositionData.allPositions.filter { result.recommendedPositions.contains($0.id) }
                    ForEach(matchedPositions) { pos in
                        HStack(spacing: 10) {
                            Image(systemName: pos.category.icon)
                                .font(.system(size: 14))
                                .foregroundColor(Theme.categoryColor(pos.category))
                                .frame(width: 30, height: 30)
                                .background(Theme.categoryColor(pos.category).opacity(0.15))
                                .cornerRadius(8)
                            
                            Text(pos.localizedName(localization))
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                    }
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(16)
                .padding(.horizontal)
                
                // Retake button
                Button {
                    resetTest()
                } label: {
                    HStack {
                        Image(systemName: "arrow.counterclockwise")
                        Text(localization.L("Reia testul", "Retake test"))
                    }
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Theme.primaryGradient)
                    .cornerRadius(16)
                }
                .padding(.horizontal)
            }
            .padding(.top, 8)
            .padding(.bottom, 30)
        }
    }
    
    private func resetTest() {
        currentQuestion = 0
        scores = [
            .wordsOfAffirmation: 0,
            .physicalTouch: 0,
            .qualityTime: 0,
            .receivingGifts: 0,
            .actsOfService: 0
        ]
        result = nil
        withAnimation { showResult = false }
    }
}
