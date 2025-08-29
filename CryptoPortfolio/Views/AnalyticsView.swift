
import SwiftUI

struct AnalyticsView: View {
    @StateObject private var vm = AnalyticsViewModel()
    
    var body: some View {
        ScrollView (.vertical,){
            VStack {
                AnalyticsHeaderView(viewModel: vm)
                    .frame(height: 250)
                
                // Scrollable timeline + graph container
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack(spacing: 0) {
                        TimeSelectorView(viewModel: vm)
                        
                        GraphView(viewModel: vm)
                            .frame(height: 250) // fixed height for graph
                            
                    }
                    
                }
                
                AssetsListView(assets: vm.assets)
                
                RecentTransactionsView(transactions: vm.transactions)
            }
        }
    }
}


#Preview {
    AnalyticsView()
}
