import SwiftUI

struct MainView: View {
    @State private var selectedTab: Tab = .Analytics
    @State private var showOverlays: Bool = true
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Content of selected tab
            Group {
                switch selectedTab {
                case .Analytics:
                                    AnalyticsView() // 👈 pass binding
                                case .Exchange:
                                    TransactionsSummaryScreenView(showOverlays: $showOverlays)
                case .Record:
                    Text("Record Screen")
                case .Wallet:
                    Text("Wallet Screen")
                }
            }
          
            if showOverlays{
                // Top bar (always visible across all screens)
                TopMenuBar()
            }
            
            // Bottom blur + Custom TabBar
            VStack {
                Spacer()
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(
                        LinearGradient(
                            stops: [
                                .init(color: .black, location: 0.1),
                                .init(color: .clear, location: 1)
                            ],
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    .frame(height: 190)
            }
            .ignoresSafeArea(.all)

            
            if showOverlays{
                
                CustomTabBar(selectedTab: $selectedTab)
            }

        }
    }
}

#Preview {
    MainView()
}
