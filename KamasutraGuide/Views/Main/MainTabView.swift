import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var localization: LocalizationManager
    
    var body: some View {
        TabView(selection: $appState.selectedTab) {
            PositionsGridView()
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text(Strings.Tabs.positions(localization))
                }
                .tag(0)
            
            GamesListView()
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                    Text(Strings.Tabs.games(localization))
                }
                .tag(1)
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text(Strings.Tabs.favorites(localization))
                }
                .tag(2)
            
            InfoView()
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text(Strings.Tabs.info(localization))
                }
                .tag(3)
            
            DiscoverView()
                .tabItem {
                    Image(systemName: "sparkles")
                    Text(Strings.Tabs.discover(localization))
                }
                .tag(4)
        }
        .accentColor(Theme.primary)
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(Theme.background)
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}
