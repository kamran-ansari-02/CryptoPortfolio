import SwiftUI

struct TransactionsSectionView: View {
    let transactions: [RecentTransaction]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            // --- Header Row ---
            HStack {
                Text("Transactions")
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Button(action: {
                    // Dummy "View All" action
                }) {
                    Text("Last 4 days")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            
            // --- Transaction Rows (all with arrows) ---
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(transactions, id: \.date) { tx in
                        TransactionRowCard(
                            tx: tx,
                            overrideImage: tx.isReceive ? "arrow.down" : "arrow.up"
                        )
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    let sampleTxs = [
        RecentTransaction(
            imageName: "Bitcoin_Logo",
            symbol: "BTC",
            type: "Receive",
            amount: 0.002126,
            date: "20 March",
            isReceive: true
        ),
        RecentTransaction(
            imageName: "Exchange_TabBar_Icon",
            symbol: "ETH",
            type: "Send",
            amount: 0.001000,
            date: "18 March",
            isReceive: false
        ),
        RecentTransaction(
            imageName: "Bitcoin_Logo",
            symbol: "BTC",
            type: "Receive",
            amount: 0.005000,
            date: "15 March",
            isReceive: true
        ),
        RecentTransaction(
            imageName: "Litecoin_Logo",
            symbol: "LTC",
            type: "Send",
            amount: 0.003500,
            date: "10 March",
            isReceive: false
        )
    ]
    
    VStack {
        TransactionsSectionView(transactions: sampleTxs)
    }
   
}
