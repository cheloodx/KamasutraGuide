import SwiftUI

struct PositionDetailView: View {
    let position: Position
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var localization: LocalizationManager
    @EnvironmentObject var audioManager: AudioManager
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Theme.background.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 0) {
                    // Hero Image
                    heroImageView
                    
                    // Content
                    VStack(alignment: .leading, spacing: 20) {
                        // Title & Category
                        titleSection
                        
                        // Stats Row
                        statsRow
                        
                        // Description
                        descriptionSection
                        
                        // Benefits
                        benefitsSection
                        
                        // Tips
                        tipsSection
                        
                        // Variations
                        variationsSection
                        
                        Spacer(minLength: 80)
                    }
                    .padding(20)
                }
            }
            
            // Mini Music Player
            MiniMusicPlayerView()
                .padding(.horizontal)
                .padding(.bottom, 8)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { appState.toggleFavorite(position) }) {
                    Image(systemName: appState.isFavorite(position) ? "heart.fill" : "heart")
                        .foregroundColor(appState.isFavorite(position) ? .red : .white)
                }
            }
        }
    }
    
    // MARK: - Hero Image
    private var heroImageView: some View {
        ZStack(alignment: .bottomLeading) {
            Image(position.id)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .clipped()
            
            // Gradient overlay
            LinearGradient(
                colors: [.clear, Theme.background],
                startPoint: .center,
                endPoint: .bottom
            )
        }
    }
    
    // MARK: - Title Section
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(position.localizedName(localization))
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Theme.textPrimary)
            
            HStack(spacing: 8) {
                HStack(spacing: 4) {
                    Image(systemName: position.category.icon)
                    Text(position.category.localizedName(localization))
                }
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Theme.categoryColor(position.category))
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Theme.categoryColor(position.category).opacity(0.15))
                .cornerRadius(8)
                
                Text(position.difficulty.localizedName(localization))
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Theme.difficultyColor(position.difficulty))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Theme.difficultyColor(position.difficulty).opacity(0.15))
                    .cornerRadius(8)
            }
        }
    }
    
    // MARK: - Stats Row
    private var statsRow: some View {
        HStack(spacing: 20) {
            // Intimacy
            VStack(spacing: 4) {
                HStack(spacing: 2) {
                    ForEach(1...5, id: \.self) { level in
                        Image(systemName: level <= position.intimacy ? "heart.fill" : "heart")
                            .font(.system(size: 14))
                            .foregroundColor(level <= position.intimacy ? Theme.primary : Theme.textMuted)
                    }
                }
                Text(localization.L("Intimitate", "Intimacy"))
                    .font(.system(size: 11))
                    .foregroundColor(Theme.textSecondary)
            }
            
            Divider()
                .frame(height: 30)
                .background(Theme.textMuted)
            
            // Difficulty
            VStack(spacing: 4) {
                Text(position.difficulty.localizedName(localization))
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Theme.difficultyColor(position.difficulty))
                Text(localization.L("Dificultate", "Difficulty"))
                    .font(.system(size: 11))
                    .foregroundColor(Theme.textSecondary)
            }
            
            Divider()
                .frame(height: 30)
                .background(Theme.textMuted)
            
            // Category
            VStack(spacing: 4) {
                Image(systemName: position.category.icon)
                    .font(.system(size: 18))
                    .foregroundColor(Theme.categoryColor(position.category))
                Text(position.category.localizedName(localization))
                    .font(.system(size: 11))
                    .foregroundColor(Theme.textSecondary)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Theme.cardBackground)
        .cornerRadius(12)
    }
    
    // MARK: - Description
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionHeader(title: localization.L("Descriere", "Description"), icon: "text.alignleft")
            Text(position.localizedDescription(localization))
                .font(.system(size: 15))
                .foregroundColor(Theme.textSecondary)
                .lineSpacing(4)
        }
    }
    
    // MARK: - Benefits
    private var benefitsSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            SectionHeader(title: localization.L("Beneficii", "Benefits"), icon: "star.fill")
            
            ForEach(position.localizedBenefits(localization), id: \.self) { benefit in
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "4CAF50"))
                        .padding(.top, 2)
                    Text(benefit)
                        .font(.system(size: 14))
                        .foregroundColor(Theme.textSecondary)
                }
            }
        }
        .padding(16)
        .background(Theme.cardBackground)
        .cornerRadius(12)
    }
    
    // MARK: - Tips
    private var tipsSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            SectionHeader(title: localization.L("Sfaturi", "Tips"), icon: "lightbulb.fill")
            
            ForEach(Array(position.localizedTips(localization).enumerated()), id: \.offset) { index, tip in
                HStack(alignment: .top, spacing: 10) {
                    Text("\(index + 1)")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Theme.primary)
                        .frame(width: 22, height: 22)
                        .background(Theme.primary.opacity(0.15))
                        .clipShape(Circle())
                        .padding(.top, 1)
                    Text(tip)
                        .font(.system(size: 14))
                        .foregroundColor(Theme.textSecondary)
                }
            }
        }
        .padding(16)
        .background(Theme.cardBackground)
        .cornerRadius(12)
    }
    
    // MARK: - Variations
    private var variationsSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            SectionHeader(title: localization.L("Variatii", "Variations"), icon: "arrow.triangle.branch")
            
            ForEach(position.localizedVariations(localization), id: \.self) { variation in
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "arrow.right.circle")
                        .font(.system(size: 14))
                        .foregroundColor(Theme.accent)
                        .padding(.top, 2)
                    Text(variation)
                        .font(.system(size: 14))
                        .foregroundColor(Theme.textSecondary)
                }
            }
        }
        .padding(16)
        .background(Theme.cardBackground)
        .cornerRadius(12)
    }
}
