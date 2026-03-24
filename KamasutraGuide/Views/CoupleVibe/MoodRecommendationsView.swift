import SwiftUI

struct MoodRecommendationsView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var selectedMood: CoupleVibeMood?
    
    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    headerSection
                    moodSelector
                    
                    if let mood = selectedMood, let rec = CoupleVibeData.moodRecommendations.first(where: { $0.mood == mood }) {
                        recommendationContent(rec)
                            .transition(.opacity.combined(with: .move(edge: .bottom)))
                    }
                }
                .padding(.top, 8)
                .padding(.bottom, 30)
            }
        }
        .navigationTitle(localization.L("Recomandari", "Recommendations"))
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("\u{1F3AF}")
                .font(.system(size: 50))
            Text(localization.L("Cum te simti azi?", "How do you feel today?"))
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)
            Text(localization.L("Alege starea ta si primesti recomandari personalizate", "Choose your mood and get personalized recommendations"))
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.5))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
    }
    
    private var moodSelector: some View {
        HStack(spacing: 10) {
            ForEach(CoupleVibeMood.allCases, id: \.rawValue) { mood in
                Button {
                    withAnimation(.spring(response: 0.3)) {
                        selectedMood = mood
                    }
                } label: {
                    VStack(spacing: 6) {
                        Text(mood.icon)
                            .font(.system(size: 28))
                        Text(mood.localizedName(localization))
                            .font(.system(size: 10, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(selectedMood == mood ? mood.color.opacity(0.3) : Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(selectedMood == mood ? mood.color : Color.clear, lineWidth: 2)
                    )
                    .cornerRadius(14)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.horizontal)
    }
    
    private func recommendationContent(_ rec: MoodRecommendation) -> some View {
        VStack(spacing: 16) {
            // Tip
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "lightbulb.fill")
                        .foregroundColor(rec.mood.color)
                    Text(localization.L("Sfat", "Tip"))
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                }
                Text(rec.localizedTip(localization))
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.7))
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(rec.mood.color.opacity(0.1))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(rec.mood.color.opacity(0.3), lineWidth: 1)
            )
            .cornerRadius(16)
            .padding(.horizontal)
            
            // Recommended Positions
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "square.grid.2x2.fill")
                        .foregroundColor(rec.mood.color)
                    Text(localization.L("Pozitii recomandate", "Recommended positions"))
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                }
                
                let matchedPositions = PositionData.allPositions.filter { rec.positions.contains($0.id) }
                ForEach(matchedPositions) { pos in
                    HStack(spacing: 12) {
                        Image(systemName: pos.category.icon)
                            .font(.system(size: 16))
                            .foregroundColor(rec.mood.color)
                            .frame(width: 36, height: 36)
                            .background(rec.mood.color.opacity(0.15))
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(pos.localizedName(localization))
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                            Text(pos.difficulty.localizedName(localization))
                                .font(.system(size: 11))
                                .foregroundColor(.white.opacity(0.5))
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 2) {
                            ForEach(0..<5) { i in
                                Image(systemName: i < pos.intimacy ? "heart.fill" : "heart")
                                    .font(.system(size: 8))
                                    .foregroundColor(Theme.primary)
                            }
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white.opacity(0.05))
            .cornerRadius(16)
            .padding(.horizontal)
            
            // Recommended Games
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "gamecontroller.fill")
                        .foregroundColor(rec.mood.color)
                    Text(localization.L("Jocuri sugerate", "Suggested games"))
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                }
                
                ForEach(rec.games, id: \.self) { game in
                    HStack(spacing: 8) {
                        Image(systemName: "play.circle.fill")
                            .foregroundColor(rec.mood.color)
                        Text(game)
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white.opacity(0.05))
            .cornerRadius(16)
            .padding(.horizontal)
            
            // Playlist
            HStack(spacing: 12) {
                Image(systemName: "music.note.list")
                    .font(.system(size: 20))
                    .foregroundColor(rec.mood.color)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(localization.L("Playlist recomandat", "Recommended playlist"))
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.5))
                    Text(rec.playlist)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.white.opacity(0.3))
            }
            .padding()
            .background(rec.mood.color.opacity(0.1))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(rec.mood.color.opacity(0.3), lineWidth: 1)
            )
            .cornerRadius(16)
            .padding(.horizontal)
        }
    }
}
