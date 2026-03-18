import SwiftUI

struct InfoView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var localization: LocalizationManager
    
    var body: some View {
        NavigationView {
            ZStack {
                Theme.background.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        // Header
                        VStack(spacing: 12) {
                            Image(systemName: "heart.circle.fill")
                                .font(.system(size: 60))
                                .foregroundStyle(Theme.primaryGradient)
                            
                            Text("Kamasutra Guide")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(Theme.textPrimary)
                            
                            Text(localization.L("Ghidul complet al intimitatii", "The complete guide to intimacy"))
                                .font(.system(size: 16))
                                .foregroundColor(Theme.textSecondary)
                        }
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                        
                        // Language Toggle
                        languageToggle
                        
                        // Statistics Card
                        statsCard
                        
                        // Category Breakdown
                        categoryBreakdown
                        
                        // Difficulty Breakdown
                        difficultyBreakdown
                        
                        // About Section
                        aboutSection
                        
                        // Disclaimer
                        disclaimerSection
                        
                        // Version
                        Text(localization.L("Versiunea 1.0.0", "Version 1.0.0"))
                            .font(.system(size: 12))
                            .foregroundColor(Theme.textMuted)
                            .padding(.bottom, 30)
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    // MARK: - Language Toggle
    private var languageToggle: some View {
        VStack(spacing: 12) {
            SectionHeader(title: localization.L("Limba", "Language"), icon: "globe")
            
            HStack(spacing: 12) {
                Button(action: { localization.setLanguage(.romanian) }) {
                    HStack(spacing: 8) {
                        Text("\u{1F1F7}\u{1F1F4}")
                            .font(.system(size: 24))
                        Text("Romana")
                            .font(.system(size: 15, weight: .medium))
                    }
                    .foregroundColor(localization.currentLanguage == .romanian ? .white : Theme.textSecondary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(localization.currentLanguage == .romanian ? Theme.primary : Theme.cardBackground)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(localization.currentLanguage == .romanian ? Theme.primary : Theme.textMuted.opacity(0.3), lineWidth: 1)
                    )
                }
                
                Button(action: { localization.setLanguage(.english) }) {
                    HStack(spacing: 8) {
                        Text("\u{1F1EC}\u{1F1E7}")
                            .font(.system(size: 24))
                        Text("English")
                            .font(.system(size: 15, weight: .medium))
                    }
                    .foregroundColor(localization.currentLanguage == .english ? .white : Theme.textSecondary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(localization.currentLanguage == .english ? Theme.primary : Theme.cardBackground)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(localization.currentLanguage == .english ? Theme.primary : Theme.textMuted.opacity(0.3), lineWidth: 1)
                    )
                }
            }
        }
        .padding(16)
        .background(Theme.cardBackground)
        .cornerRadius(12)
    }
    
    // MARK: - Stats Card
    private var statsCard: some View {
        VStack(spacing: 16) {
            SectionHeader(title: localization.L("Statistici", "Statistics"), icon: "chart.bar.fill")
            
            HStack(spacing: 20) {
                statItem(value: "\(appState.totalPositions)", label: localization.L("Pozitii", "Positions"), icon: "square.grid.2x2.fill")
                statItem(value: "\(appState.totalFavorites)", label: localization.L("Favorite", "Favorites"), icon: "heart.fill")
                statItem(value: "4", label: localization.L("Categorii", "Categories"), icon: "folder.fill")
                statItem(value: "4", label: localization.L("Niveluri", "Levels"), icon: "chart.bar.fill")
            }
        }
        .padding(16)
        .background(Theme.cardBackground)
        .cornerRadius(12)
    }
    
    private func statItem(value: String, label: String, icon: String) -> some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(Theme.primary)
            Text(value)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Theme.textPrimary)
            Text(label)
                .font(.system(size: 11))
                .foregroundColor(Theme.textSecondary)
        }
        .frame(maxWidth: .infinity)
    }
    
    // MARK: - Category Breakdown
    private var categoryBreakdown: some View {
        VStack(spacing: 12) {
            SectionHeader(title: localization.L("Categorii", "Categories"), icon: "tag.fill")
            
            ForEach(PositionCategory.allCases, id: \.self) { category in
                HStack {
                    Image(systemName: category.icon)
                        .font(.system(size: 16))
                        .foregroundColor(Theme.categoryColor(category))
                        .frame(width: 30)
                    
                    Text(category.localizedName(localization))
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Theme.textPrimary)
                    
                    Spacer()
                    
                    Text("\(appState.positionsCount(for: category))")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Theme.categoryColor(category))
                }
                .padding(.vertical, 4)
            }
        }
        .padding(16)
        .background(Theme.cardBackground)
        .cornerRadius(12)
    }
    
    // MARK: - Difficulty Breakdown
    private var difficultyBreakdown: some View {
        VStack(spacing: 12) {
            SectionHeader(title: localization.L("Niveluri de dificultate", "Difficulty levels"), icon: "chart.bar.fill")
            
            ForEach(Difficulty.allCases, id: \.self) { difficulty in
                HStack {
                    Circle()
                        .fill(Theme.difficultyColor(difficulty))
                        .frame(width: 10, height: 10)
                    
                    Text(difficulty.localizedName(localization))
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Theme.textPrimary)
                    
                    Spacer()
                    
                    Text("\(appState.positionsCount(for: difficulty))")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Theme.difficultyColor(difficulty))
                }
                .padding(.vertical, 4)
            }
        }
        .padding(16)
        .background(Theme.cardBackground)
        .cornerRadius(12)
    }
    
    // MARK: - About Section
    private var aboutSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: localization.L("Despre aplicatie", "About the app"), icon: "info.circle.fill")
            
            Text(localization.L(
                                "Kamasutra Guide este un ghid educational complet care prezinta 59 de pozitii din arta clasica a iubirii. Aplicatia ofera informatii detaliate despre fiecare pozitie, inclusiv beneficii, sfaturi practice si variatii.",
                                "Kamasutra Guide is a complete educational guide that presents 59 positions from the classic art of love. The app provides detailed information about each position, including benefits, practical tips and variations."
            ))
                .font(.system(size: 14))
                .foregroundColor(Theme.textSecondary)
                .lineSpacing(4)
            
            Text(localization.L(
                "Aceasta aplicatie este destinata exclusiv adultilor si are un scop educational. Toate informatiile sunt prezentate intr-o maniera respectuoasa si informativa.",
                "This app is intended exclusively for adults and has an educational purpose. All information is presented in a respectful and informative manner."
            ))
                .font(.system(size: 14))
                .foregroundColor(Theme.textSecondary)
                .lineSpacing(4)
        }
        .padding(16)
        .background(Theme.cardBackground)
        .cornerRadius(12)
    }
    
    // MARK: - Disclaimer
    private var disclaimerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.yellow)
                Text(localization.L("Avertisment", "Warning"))
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.yellow)
            }
            
            Text(localization.L(
                "Aceasta aplicatie este destinata exclusiv persoanelor cu varsta de peste 18 ani. Continutul are un caracter educational si informativ. Practicati intotdeauna comunicarea deschisa cu partenerul.",
                "This app is intended exclusively for people over 18 years old. The content is educational and informative. Always practice open communication with your partner."
            ))
                .font(.system(size: 13))
                .foregroundColor(Theme.textSecondary)
                .lineSpacing(3)
        }
        .padding(16)
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.yellow.opacity(0.3), lineWidth: 1)
        )
    }
}
