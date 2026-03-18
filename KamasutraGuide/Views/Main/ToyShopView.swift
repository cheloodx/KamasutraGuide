import SwiftUI

struct ToyShopView: View {
    @EnvironmentObject var localization: LocalizationManager
    
    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    // Header
                    VStack(spacing: 12) {
                        Text("\u{1F6CD}")
                            .font(.system(size: 50))
                        Text(localization.L("Magazin Jucarii", "Toy Shop"))
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        Text(localization.L("Magazine online de incredere pentru cupluri", "Trusted online shops for couples"))
                            .font(.system(size: 13))
                            .foregroundColor(.white.opacity(0.5))
                            .multilineTextAlignment(.center)
                    }
                    .padding(.bottom, 4)
                    
                    // Disclaimer
                    HStack(spacing: 8) {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(Color(hex: "9C27B0"))
                        Text(localization.L(
                            "Link-urile de mai jos duc catre magazine externe. Aplicatia nu este afiliata cu niciunul dintre aceste magazine.",
                            "The links below lead to external shops. The app is not affiliated with any of these stores."
                        ))
                            .font(.system(size: 11))
                            .foregroundColor(.white.opacity(0.5))
                    }
                    .padding(12)
                    .background(Color(hex: "9C27B0").opacity(0.1))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    // Shop List
                    VStack(spacing: 12) {
                        ForEach(FeatureData.toyShopItems) { shop in
                            if let url = URL(string: shop.url) {
                                Link(destination: url) {
                                    HStack(spacing: 14) {
                                        // Icon
                                        ZStack {
                                            Circle()
                                                .fill(shop.gradient.opacity(0.3))
                                                .frame(width: 50, height: 50)
                                            Text(shop.icon)
                                                .font(.system(size: 24))
                                        }
                                        
                                        // Info
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(shop.localizedName(localization))
                                                .font(.system(size: 16, weight: .bold))
                                                .foregroundColor(.white)
                                            Text(shop.localizedDescription(localization))
                                                .font(.system(size: 12))
                                                .foregroundColor(.white.opacity(0.6))
                                                .lineLimit(2)
                                                .multilineTextAlignment(.leading)
                                        }
                                        
                                        Spacer()
                                        
                                        // Arrow
                                        Image(systemName: "arrow.up.right.square.fill")
                                            .font(.system(size: 20))
                                            .foregroundStyle(shop.gradient)
                                    }
                                    .padding(14)
                                    .background(
                                        RoundedRectangle(cornerRadius: 16)
                                            .fill(LinearGradient(
                                                colors: [Color.white.opacity(0.08), Color.white.opacity(0.03)],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            ))
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(shop.gradient.opacity(0.3), lineWidth: 1)
                                    )
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Safety Tips
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 8) {
                            Image(systemName: "shield.checkered")
                                .foregroundColor(Color(hex: "4CAF50"))
                            Text(localization.L("Sfaturi pentru Cumparaturi Sigure", "Safe Shopping Tips"))
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            safetyTip(icon: "checkmark.seal.fill", text: localization.L("Cumparati doar de la magazine de incredere", "Only buy from trusted stores"), color: "4CAF50")
                            safetyTip(icon: "lock.shield.fill", text: localization.L("Verificati ca site-ul foloseste HTTPS", "Check that the site uses HTTPS"), color: "2196F3")
                            safetyTip(icon: "shippingbox.fill", text: localization.L("Alegeti livrare discreta", "Choose discreet delivery"), color: "FF9800")
                            safetyTip(icon: "heart.circle.fill", text: localization.L("Alegeti produse sigure pentru corp (body-safe)", "Choose body-safe products"), color: "E91E63")
                            safetyTip(icon: "star.fill", text: localization.L("Cititi recenziile inainte de cumparare", "Read reviews before buying"), color: "FFD700")
                        }
                    }
                    .padding(16)
                    .background(Color.white.opacity(0.04))
                    .cornerRadius(16)
                    .padding(.horizontal)
                }
                .padding(.top, 8)
                .padding(.bottom, 30)
            }
        }
        .navigationTitle(localization.L("Magazin Jucarii", "Toy Shop"))
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func safetyTip(icon: String, text: String, color: String) -> some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 14))
                .foregroundColor(Color(hex: color))
                .frame(width: 20)
            Text(text)
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.7))
        }
    }
}
