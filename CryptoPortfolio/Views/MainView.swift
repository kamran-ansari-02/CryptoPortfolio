import SwiftUI

struct MainView: View {
    @State private var selectedTab: Tab = .Analytics
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Content of selected tab
            Group {
                switch selectedTab {
                case .Analytics:
                    AnalyticsView()
                case .Exchange:
                    TransactionsSummaryScreenView()
                case .Record:
                    Text("Record Screen")
                case .Wallet:
                    Text("Wallet Screen")
                }
            }
          
            
            // Top bar (always visible across all screens)
            VStack {
                HStack {
                    // Left menu button
                    Button(action: {
                        print("Menu tapped")
                    }) {
                        Image("Menu_Icon")
                            .resizable()              // make scalable
                            .scaledToFit()
                            .frame(width: 62, height: 62) // adjust size as needed
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    // Right bell button
                    Button(action: {
                        print("Bell tapped")
                    }) {
                        Image("Notify_Icon")
                            .resizable()              // make scalable
                            .scaledToFit()
                            .frame(width: 62, height: 62) // adjust size as needed
                            .foregroundColor(.white)                    }
                }
                .padding(.horizontal)
                .padding(.top, 0)
                
                Spacer()
            }
            
            // Bottom blur + Custom TabBar
            VStack {
                Spacer()
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(
                        LinearGradient(
                            stops: [
                                .init(color: .black, location: 0.3),
                                .init(color: .clear, location: 1)
                            ],
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    .frame(height: 190)
            }
            .ignoresSafeArea(.all)

            CustomTabBar(selectedTab: $selectedTab)

        }
    }
}

#Preview {
    MainView()
}
