import SwiftUI

struct PositionsGridView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var localization: LocalizationManager
    @State private var showingFilters = false
    
    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Theme.background.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 16) {
                        // Header
                        headerView
                        
                        // Search
                        SearchBar(text: $appState.searchText)
                            .padding(.horizontal)
                        
                        // Category filters
                        categoryFiltersView
                        
                        // Difficulty filters
                        if showingFilters {
                            difficultyFiltersView
                        }
                        
                        // Results count
                        HStack {
                            Text(localization.L("\(appState.filteredPositions.count) pozitii", "\(appState.filteredPositions.count) positions"))
                                .font(.system(size: 13))
                                .foregroundColor(Theme.textSecondary)
                            Spacer()
                            Button(action: { withAnimation { showingFilters.toggle() } }) {
                                HStack(spacing: 4) {
                                    Image(systemName: "slider.horizontal.3")
                                    Text(showingFilters ? localization.L("Ascunde filtre", "Hide filters") : localization.L("Mai multe filtre", "More filters"))
                                }
                                .font(.system(size: 12))
                                .foregroundColor(Theme.primary)
                            }
                        }
                        .padding(.horizontal)
                        
                        // Grid
                        if appState.filteredPositions.isEmpty {
                            EmptyStateView(
                                icon: "magnifyingglass",
                                title: localization.L("Nicio pozitie gasita", "No positions found"),
                                message: localization.L("Incercati sa modificati filtrele sau termenul de cautare.", "Try changing the filters or search term.")
                            )
                        } else {
                            LazyVGrid(columns: columns, spacing: 12) {
                                ForEach(appState.filteredPositions) { position in
                                    NavigationLink(destination: PositionDetailView(position: position)) {
                                        PositionCard(
                                            position: position,
                                            isFavorite: appState.isFavorite(position),
                                            onFavoriteToggle: { appState.toggleFavorite(position) }
                                        )
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        Spacer(minLength: 20)
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    // MARK: - Header
    private var headerView: some View {
        VStack(spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Kamasutra Guide")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Theme.textPrimary)
                    Text(localization.L("Descopera arta intimitatii", "Discover the art of intimacy"))
                        .font(.system(size: 14))
                        .foregroundColor(Theme.textSecondary)
                }
                Spacer()
                
                // Stats badge
                VStack(spacing: 2) {
                    Text("\(appState.totalPositions)")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Theme.primary)
                    Text(localization.L("pozitii", "positions"))
                        .font(.system(size: 10))
                        .foregroundColor(Theme.textMuted)
                }
                .padding(12)
                .background(Theme.cardBackground)
                .cornerRadius(12)
            }
            .padding(.horizontal)
            .padding(.top, 16)
        }
    }
    
    // MARK: - Category Filters
    private var categoryFiltersView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                // All button
                Button(action: { appState.selectedCategory = nil }) {
                    Text(localization.L("Toate", "All"))
                        .font(.system(size: 13, weight: .medium))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(appState.selectedCategory == nil ? Theme.primary.opacity(0.3) : Color.clear)
                        .foregroundColor(appState.selectedCategory == nil ? Theme.primary : Theme.textSecondary)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(appState.selectedCategory == nil ? Theme.primary : Theme.textMuted.opacity(0.3), lineWidth: 1)
                        )
                }
                
                ForEach(PositionCategory.allCases, id: \.self) { category in
                    CategoryChip(
                        category: category,
                        isSelected: appState.selectedCategory == category,
                        action: {
                            appState.selectedCategory = appState.selectedCategory == category ? nil : category
                        }
                    )
                }
            }
            .padding(.horizontal)
        }
    }
    
    // MARK: - Difficulty Filters
    private var difficultyFiltersView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                Button(action: { appState.selectedDifficulty = nil }) {
                    Text(localization.L("Toate", "All"))
                        .font(.system(size: 12, weight: .medium))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(appState.selectedDifficulty == nil ? Theme.accent.opacity(0.3) : Color.clear)
                        .foregroundColor(appState.selectedDifficulty == nil ? Theme.accent : Theme.textSecondary)
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(appState.selectedDifficulty == nil ? Theme.accent : Theme.textMuted.opacity(0.3), lineWidth: 1)
                        )
                }
                
                ForEach(Difficulty.allCases, id: \.self) { difficulty in
                    DifficultyChip(
                        difficulty: difficulty,
                        isSelected: appState.selectedDifficulty == difficulty,
                        action: {
                            appState.selectedDifficulty = appState.selectedDifficulty == difficulty ? nil : difficulty
                        }
                    )
                }
            }
            .padding(.horizontal)
        }
        .transition(.opacity.combined(with: .move(edge: .top)))
    }
}
