import SwiftUI
import AVFoundation

@main
struct KamasutraGuideApp: App {
    @StateObject private var appState = AppState()
    @StateObject private var localization = LocalizationManager()
    @StateObject private var audioManager = AudioManager.shared
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(appState)
                .environmentObject(localization)
                .environmentObject(audioManager)
                .preferredColorScheme(.dark)
        }
    }
}
