import SwiftUI

struct TransactionsSummaryScreenView: View {
    @StateObject private var vm = AnalyticsViewModel()
    @Binding var showOverlays: Bool
    
    var body: some View {
        NavigationStack{
            ScrollView (.vertical,){
                VStack {
                    PortfolioCardView(viewModel: vm)
                        .padding(.top, 70)
                        .padding(.bottom, 20)

                    ActionButtonsBarView(showOverlays: $showOverlays)
                            
                    TransactionsSectionView(transactions: vm.transactions)
                }
            }
        }
    }
}

#Preview {
    TransactionsSummaryScreenView(showOverlays: .constant(true))
}
