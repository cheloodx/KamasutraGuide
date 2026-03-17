import SwiftUI

struct RomanticQuotesView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var currentQuote: RomanticQuote = FeatureData.quotes[0]
    @State private var selectedCategory: QuoteCategory? = nil
    
    var filteredQuotes: [RomanticQuote] {
        if let cat = selectedCategory {
            return FeatureData.quotes.filter { $0.category == cat }
        }
        return FeatureData.quotes
    }
    
    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    VStack(spacing: 16) {
                        Image(systemName: "quote.opening")
                            .font(.system(size: 30))
                            .foregroundColor(Color(hex: "FF6B8A"))
                        
                        Text(currentQuote.localizedText(localization))
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .lineSpacing(6)
                        
                        Text("\u{2014} \(currentQuote.author)")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white.opacity(0.5))
                        
                        HStack(spacing: 8) {
                            Image(systemName: currentQuote.category.icon)
                                .foregroundColor(currentQuote.category.color)
                            Text(currentQuote.category.rawValue)
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(currentQuote.category.color)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(currentQuote.category.color.opacity(0.15))
                        .cornerRadius(12)
                    }
                    .padding(24)
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(20)
                    .padding(.horizontal)
                    
                    Button(action: {
                        withAnimation(.spring()) {
                            currentQuote = filteredQuotes.randomElement() ?? FeatureData.quotes[0]
                        }
                    }) {
                        HStack {
                            Image(systemName: "arrow.triangle.2.circlepath")
                            Text(localization.L("Citat Nou", "New Quote"))
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
                            CategoryFilterChip(title: localization.L("Toate", "All"), isSelected: selectedCategory == nil) {
                                selectedCategory = nil
                            }
                            ForEach(QuoteCategory.allCases, id: \.self) { cat in
                                CategoryFilterChip(title: cat.rawValue, isSelected: selectedCategory == cat) {
                                    selectedCategory = cat
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    VStack(spacing: 12) {
                        ForEach(filteredQuotes) { quote in
                            Button(action: {
                                withAnimation { currentQuote = quote }
                            }) {
                                HStack(spacing: 12) {
                                    Image(systemName: quote.category.icon)
                                        .foregroundColor(quote.category.color)
                                        .frame(width: 30)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(quote.localizedText(localization))
                                            .font(.system(size: 13))
                                            .foregroundColor(.white.opacity(0.8))
                                            .lineLimit(2)
                                            .multilineTextAlignment(.leading)
                                        Text(quote.author)
                                            .font(.system(size: 11))
                                            .foregroundColor(.white.opacity(0.4))
                                    }
                                    Spacer()
                                }
                                .padding(12)
                                .background(Color.white.opacity(0.04))
                                .cornerRadius(12)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 8)
                .padding(.bottom, 30)
            }
        }
        .navigationTitle(localization.L("Citate Romantice", "Romantic Quotes"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CategoryFilterChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(isSelected ? .white : .white.opacity(0.6))
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(isSelected ? AnyView(Theme.primaryGradient) : AnyView(Color.white.opacity(0.08)))
                .cornerRadius(16)
        }
    }
}
