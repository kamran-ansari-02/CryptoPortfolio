import SwiftUI

struct TransactionsSummaryScreenView: View {
    @StateObject private var vm = AnalyticsViewModel()
    
    var body: some View {
        ScrollView (.vertical,){
            VStack {
                PortfolioCardView(viewModel: vm)
                    .padding(.top, 70)
                    .padding(.bottom, 20)

                ActionButtonsBarView()
                        
                TransactionsSectionView(transactions: vm.transactions)
            }
        }
    }
}

#Preview {
    TransactionsSummaryScreenView()
}
