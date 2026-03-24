import SwiftUI

struct ChallengeModeView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var challenges: [DailyChallenge] = CoupleVibeData.dailyChallenges
    @State private var selectedChallenge: DailyChallenge?
    @State private var showDetail = false
    
    private let completedKey = "couplevibe_completed_challenges"
    
    var completedCount: Int { challenges.filter { $0.isCompleted }.count }
    var progressPercent: Double { Double(completedCount) / 30.0 }
    
    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    headerSection
                    progressSection
                    categoryLegend
                    challengeGrid
                }
                .padding(.top, 8)
                .padding(.bottom, 30)
            }
        }
        .navigationTitle(localization.L("Provocari 30 Zile", "30 Day Challenges"))
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showDetail) {
            if let challenge = selectedChallenge {
                challengeDetailSheet(challenge)
            }
        }
        .onAppear { loadProgress() }
    }
    
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("\u{1F525}")
                .font(.system(size: 50))
            Text(localization.L("Provocari de Cuplu", "Couple Challenges"))
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            Text(localization.L("30 de zile de provocari progresive pentru cupluri", "30 days of progressive challenges for couples"))
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.5))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
    }
    
    private var progressSection: some View {
        VStack(spacing: 8) {
            HStack {
                Text(localization.L("Progres", "Progress"))
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                Spacer()
                Text("\(completedCount)/30")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Theme.primary)
            }
            
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.white.opacity(0.1))
                        .frame(height: 12)
                    
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Theme.primaryGradient)
                        .frame(width: geo.size.width * progressPercent, height: 12)
                        .animation(.easeInOut(duration: 0.5), value: progressPercent)
                }
            }
            .frame(height: 12)
            
            if completedCount == 30 {
                Text(localization.L("Felicitari! Ati completat toate provocarile!", "Congratulations! You completed all challenges!"))
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(Color(hex: "66BB6A"))
            }
        }
        .padding(.horizontal)
    }
    
    private var categoryLegend: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(ChallengeCategory.allCases, id: \.rawValue) { cat in
                    HStack(spacing: 4) {
                        Circle()
                            .fill(cat.color)
                            .frame(width: 8, height: 8)
                        Text(cat.localizedName(localization))
                            .font(.system(size: 11))
                            .foregroundColor(.white.opacity(0.7))
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    private var challengeGrid: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 5), spacing: 8) {
            ForEach(challenges) { challenge in
                Button {
                    selectedChallenge = challenge
                    showDetail = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(challenge.isCompleted ? Color(hex: "66BB6A").opacity(0.3) : challenge.category.color.opacity(0.15))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(challenge.isCompleted ? Color(hex: "66BB6A").opacity(0.5) : challenge.category.color.opacity(0.3), lineWidth: 1)
                            )
                        
                        VStack(spacing: 2) {
                            Text(localization.L("Ziua", "Day"))
                                .font(.system(size: 8))
                                .foregroundColor(.white.opacity(0.5))
                            Text("\(challenge.day)")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(challenge.isCompleted ? Color(hex: "66BB6A") : .white)
                            if challenge.isCompleted {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 10))
                                    .foregroundColor(Color(hex: "66BB6A"))
                            } else {
                                Text(challenge.icon)
                                    .font(.system(size: 10))
                            }
                        }
                    }
                    .frame(height: 65)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.horizontal)
    }
    
    private func challengeDetailSheet(_ challenge: DailyChallenge) -> some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            
            VStack(spacing: 20) {
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color.white.opacity(0.3))
                    .frame(width: 40, height: 5)
                    .padding(.top, 10)
                
                Text(challenge.icon)
                    .font(.system(size: 60))
                
                Text(localization.L("Ziua \(challenge.day)", "Day \(challenge.day)"))
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(challenge.category.color)
                
                Text(challenge.localizedTitle(localization))
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text(challenge.localizedDescription(localization))
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                HStack(spacing: 6) {
                    Image(systemName: challenge.category.sfIcon)
                        .font(.system(size: 12))
                    Text(challenge.category.localizedName(localization))
                        .font(.system(size: 13, weight: .semibold))
                }
                .foregroundColor(challenge.category.color)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(challenge.category.color.opacity(0.15))
                .cornerRadius(20)
                
                Spacer()
                
                Button {
                    toggleChallenge(challenge)
                    showDetail = false
                } label: {
                    HStack {
                        Image(systemName: challenge.isCompleted ? "arrow.uturn.backward.circle.fill" : "checkmark.circle.fill")
                        Text(challenge.isCompleted
                             ? localization.L("Marcheaza ca necompletat", "Mark as incomplete")
                             : localization.L("Completat!", "Completed!"))
                    }
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(challenge.isCompleted ? Color.gray : Theme.primaryGradient)
                    .cornerRadius(16)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 30)
            }
        }
        .presentationDetents([.medium])
    }
    
    private func toggleChallenge(_ challenge: DailyChallenge) {
        if let idx = challenges.firstIndex(where: { $0.id == challenge.id }) {
            challenges[idx].isCompleted.toggle()
            saveProgress()
        }
    }
    
    private func saveProgress() {
        let completed = challenges.filter { $0.isCompleted }.map { $0.id }
        UserDefaults.standard.set(completed, forKey: completedKey)
    }
    
    private func loadProgress() {
        let completed = UserDefaults.standard.array(forKey: completedKey) as? [Int] ?? []
        for i in challenges.indices {
            challenges[i].isCompleted = completed.contains(challenges[i].id)
        }
    }
}
