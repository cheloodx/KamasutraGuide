import SwiftUI

struct DateNightGeneratorView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var currentIdea: DateNightIdea? = nil
    @State private var selectedCategory: String? = nil
    
    var categories: [String] {
        localization.isEnglish ? ["All", "Home", "Outdoors", "City", "Activity", "Adventure"] : ["Toate", "Acasa", "Afara", "Oras", "Activitate", "Aventura"]
    }
    
    var filteredIdeas: [DateNightIdea] {
        if let cat = selectedCategory {
            let allStr = localization.isEnglish ? "All" : "Toate"
            if cat != allStr {
                return FeatureData.dateNightIdeas.filter {
                    localization.isEnglish ? $0.categoryEn == cat : $0.category == cat
                }
            }
        }
        return FeatureData.dateNightIdeas
    }
    
    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    if let idea = currentIdea {
                        VStack(spacing: 14) {
                            Text(idea.icon)
                                .font(.system(size: 50))
                            Text(idea.localizedTitle(localization))
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                            Text(idea.localizedDescription(localization))
                                .font(.system(size: 14))
                                .foregroundColor(.white.opacity(0.7))
                                .multilineTextAlignment(.center)
                            
                            HStack(spacing: 16) {
                                Label(idea.localizedCategory(localization), systemImage: "tag.fill")
                                Label(idea.localizedBudget(localization), systemImage: "creditcard.fill")
                                Label(idea.localizedDuration(localization), systemImage: "clock.fill")
                            }
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundColor(.white.opacity(0.5))
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.06))
                        .cornerRadius(20)
                        .padding(.horizontal)
                    }
                    
                    Button(action: {
                        withAnimation(.spring()) {
                            currentIdea = filteredIdeas.randomElement()
                        }
                    }) {
                        HStack {
                            Image(systemName: "sparkles")
                            Text(currentIdea == nil ? localization.L("Genereaza o Idee", "Generate an Idea") : localization.L("Alta Idee", "Another Idea"))
                        }
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Theme.primaryGradient)
                        .cornerRadius(16)
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(categories, id: \.self) { cat in
                                Button(action: { selectedCategory = cat }) {
                                    Text(cat)
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundColor(selectedCategory == cat || (selectedCategory == nil && cat == categories[0]) ? .white : .white.opacity(0.6))
                                        .padding(.horizontal, 14)
                                        .padding(.vertical, 8)
                                        .background((selectedCategory == cat || (selectedCategory == nil && cat == categories[0])) ? AnyView(Theme.primaryGradient) : AnyView(Color.white.opacity(0.08)))
                                        .cornerRadius(16)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    VStack(spacing: 10) {
                        ForEach(filteredIdeas) { idea in
                            Button(action: {
                                withAnimation { currentIdea = idea }
                            }) {
                                HStack(spacing: 12) {
                                    Text(idea.icon)
                                        .font(.system(size: 24))
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(idea.localizedTitle(localization))
                                            .font(.system(size: 14, weight: .semibold))
                                            .foregroundColor(.white)
                                        HStack(spacing: 8) {
                                            Text(idea.localizedBudget(localization))
                                            Text("\u{2022}")
                                            Text(idea.localizedDuration(localization))
                                        }
                                        .font(.system(size: 11))
                                        .foregroundColor(.white.opacity(0.4))
                                    }
                                    Spacer()
                                    Text(idea.localizedCategory(localization))
                                        .font(.system(size: 10, weight: .bold))
                                        .foregroundColor(.white.opacity(0.5))
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.white.opacity(0.08))
                                        .cornerRadius(8)
                                }
                                .padding(12)
                                .background(Color.white.opacity(0.04))
                                .cornerRadius(14)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 8)
                .padding(.bottom, 30)
            }
        }
        .navigationTitle(localization.L("Date Night", "Date Night"))
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: localization.currentLanguage) { _ in
            selectedCategory = nil
            currentIdea = nil
        }
    }
}
