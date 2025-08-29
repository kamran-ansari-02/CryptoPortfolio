import SwiftUI

struct MainView: View {
    @State private var selectedTab: Tab = .Analytics
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group{
                switch selectedTab {
                case .Analytics:
                    AnalyticsView()
                case .Exchange:
                    Text("Exchange Screen")
                case .Record:
                    Text("Record Screen")
                case .Wallet:
                    Text("Wallet Screen")
                }
            }
            .overlay(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask {
                           LinearGradient(
                                stops: [
                                    .init(color: .black, location: 0.3),  // bottom
                                    .init(color: .clear, location: 0.9)   // fade ends 90% up
                                ],
                               startPoint: .bottom,
                               endPoint: .top
                           )
                       }
                    .frame(height: 150)
                , alignment: .bottom
            )
            .ignoresSafeArea(.all)
            // Custom tab bar at the bottom
            CustomTabBar(selectedTab: $selectedTab)
            
        }
    }
}

#Preview {
    MainView()
}
