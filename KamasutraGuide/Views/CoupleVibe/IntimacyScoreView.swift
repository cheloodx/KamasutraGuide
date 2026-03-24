import SwiftUI

struct IntimacyScoreView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var communicationScore: Double = 5
    @State private var physicalScore: Double = 5
    @State private var emotionalScore: Double = 5
    @State private var adventureScore: Double = 5
    @State private var entries: [IntimacyScoreEntry] = []
    @State private var showSaved = false
    
    private let storageKey = "couplevibe_intimacy_scores"
    
    private var overallScore: Int {
        Int((communicationScore + physicalScore + emotionalScore + adventureScore) / 4.0)
    }
    
    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    headerSection
                    scoreCircle
                    slidersSection
                    saveButton
                    historySection
                }
                .padding(.top, 8)
                .padding(.bottom, 30)
            }
        }
        .navigationTitle(localization.L("Scor Intimitate", "Intimacy Score"))
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { loadEntries() }
    }
    
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("\u{1F4CA}")
                .font(.system(size: 50))
            Text(localization.L("Scor de Intimitate", "Intimacy Score"))
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            Text(localization.L("Urmareste si imbunatateste conexiunea cu partenerul", "Track and improve connection with your partner"))
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.5))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
    }
    
    private var scoreCircle: some View {
        ZStack {
            Circle()
                .stroke(Color.white.opacity(0.1), lineWidth: 12)
                .frame(width: 140, height: 140)
            
            Circle()
                .trim(from: 0, to: Double(overallScore) / 10.0)
                .stroke(
                    scoreGradient,
                    style: StrokeStyle(lineWidth: 12, lineCap: .round)
                )
                .frame(width: 140, height: 140)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.5), value: overallScore)
            
            VStack(spacing: 2) {
                Text("\(overallScore)")
                    .font(.system(size: 42, weight: .bold))
                    .foregroundColor(scoreColor)
                Text("/10")
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.5))
            }
        }
        .padding(.vertical, 8)
    }
    
    private var scoreGradient: LinearGradient {
        LinearGradient(
            colors: [scoreColor, scoreColor.opacity(0.6)],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    
    private var scoreColor: Color {
        if overallScore >= 8 { return Color(hex: "66BB6A") }
        if overallScore >= 6 { return Color(hex: "FFB74D") }
        if overallScore >= 4 { return Color(hex: "FF6348") }
        return Color(hex: "F44336")
    }
    
    private var slidersSection: some View {
        VStack(spacing: 16) {
            scoreSlider(
                title: localization.L("Comunicare", "Communication"),
                icon: "bubble.left.and.bubble.right.fill",
                color: Color(hex: "4FC3F7"),
                value: $communicationScore
            )
            scoreSlider(
                title: localization.L("Fizic", "Physical"),
                icon: "figure.2.arms.open",
                color: Color(hex: "FF6B8A"),
                value: $physicalScore
            )
            scoreSlider(
                title: localization.L("Emotional", "Emotional"),
                icon: "heart.circle.fill",
                color: Color(hex: "A55EEA"),
                value: $emotionalScore
            )
            scoreSlider(
                title: localization.L("Aventura", "Adventure"),
                icon: "mountain.2.fill",
                color: Color(hex: "FF6348"),
                value: $adventureScore
            )
        }
        .padding(.horizontal)
    }
    
    private func scoreSlider(title: String, icon: String, color: Color, value: Binding<Double>) -> some View {
        VStack(spacing: 6) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 14))
                    .foregroundColor(color)
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                Spacer()
                Text("\(Int(value.wrappedValue))/10")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(color)
            }
            
            Slider(value: value, in: 1...10, step: 1)
                .accentColor(color)
        }
        .padding()
        .background(color.opacity(0.08))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(color.opacity(0.2), lineWidth: 1)
        )
        .cornerRadius(14)
    }
    
    private var saveButton: some View {
        Button {
            saveEntry()
        } label: {
            HStack {
                Image(systemName: showSaved ? "checkmark.circle.fill" : "square.and.arrow.down.fill")
                Text(showSaved
                     ? localization.L("Salvat!", "Saved!")
                     : localization.L("Salveaza Scorul", "Save Score"))
            }
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(showSaved ? Color(hex: "66BB6A") : Theme.primaryGradient)
            .cornerRadius(16)
        }
        .padding(.horizontal)
    }
    
    private var historySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(localization.L("Istoric", "History"))
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal)
            
            if entries.isEmpty {
                VStack(spacing: 8) {
                    Text(localization.L("Nicio inregistrare inca", "No entries yet"))
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.5))
                    Text(localization.L("Salveaza primul tau scor!", "Save your first score!"))
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.3))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
            } else {
                // Mini chart
                miniChart
                
                // Recent entries
                ForEach(entries.prefix(5)) { entry in
                    entryRow(entry)
                }
            }
        }
    }
    
    private var miniChart: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(localization.L("Evolutie saptamanala", "Weekly evolution"))
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.5))
                .padding(.horizontal)
            
            HStack(alignment: .bottom, spacing: 4) {
                ForEach(entries.prefix(7).reversed()) { entry in
                    VStack(spacing: 4) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(barColor(entry.overallScore))
                            .frame(width: 30, height: CGFloat(entry.overallScore) * 8)
                        
                        Text("\(entry.overallScore)")
                            .font(.system(size: 9))
                            .foregroundColor(.white.opacity(0.5))
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .frame(height: 100, alignment: .bottom)
        }
        .padding(.vertical, 12)
        .background(Color.white.opacity(0.05))
        .cornerRadius(14)
        .padding(.horizontal)
    }
    
    private func barColor(_ score: Int) -> Color {
        if score >= 8 { return Color(hex: "66BB6A") }
        if score >= 6 { return Color(hex: "FFB74D") }
        if score >= 4 { return Color(hex: "FF6348") }
        return Color(hex: "F44336")
    }
    
    private func entryRow(_ entry: IntimacyScoreEntry) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(formatDate(entry.date))
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.white)
                HStack(spacing: 8) {
                    miniLabel("\u{1F4AC}", entry.communicationScore)
                    miniLabel("\u{1F495}", entry.physicalScore)
                    miniLabel("\u{1F49C}", entry.emotionalScore)
                    miniLabel("\u{1F680}", entry.adventureScore)
                }
            }
            Spacer()
            
            ZStack {
                Circle()
                    .fill(barColor(entry.overallScore).opacity(0.2))
                    .frame(width: 40, height: 40)
                Text("\(entry.overallScore)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(barColor(entry.overallScore))
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(14)
        .padding(.horizontal)
    }
    
    private func miniLabel(_ emoji: String, _ score: Int) -> some View {
        HStack(spacing: 2) {
            Text(emoji)
                .font(.system(size: 10))
            Text("\(score)")
                .font(.system(size: 11, weight: .semibold))
                .foregroundColor(.white.opacity(0.7))
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: localization.isEnglish ? "en_US" : "ro_RO")
        return formatter.string(from: date)
    }
    
    private func saveEntry() {
        let entry = IntimacyScoreEntry(
            communication: Int(communicationScore),
            physical: Int(physicalScore),
            emotional: Int(emotionalScore),
            adventure: Int(adventureScore)
        )
        entries.insert(entry, at: 0)
        saveEntries()
        showSaved = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showSaved = false
        }
    }
    
    private func saveEntries() {
        if let data = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
    
    private func loadEntries() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([IntimacyScoreEntry].self, from: data) {
            entries = decoded
        }
    }
}
