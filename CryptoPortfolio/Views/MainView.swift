import SwiftUI

struct MainView: View {
    @State private var selectedTab: Tab = .Analytics
    
    var body: some View {
        VStack(spacing: 0) {
            // Content area (changes depending on selectedTab)
            ZStack {
                switch selectedTab {
                case .Analytics:
                    Text("Analytics Screen")
                case .Exchange:
                    Text("Exchange Screen")
                case .Record:
                    Text("Record Screen")
                case .Wallet:
                    Text("Wallet Screen")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Custom tab bar at the bottom
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    MainView()
}
