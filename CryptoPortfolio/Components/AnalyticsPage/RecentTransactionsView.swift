import SwiftUI

struct RecentTransactionsView: View {
    let transactions: [RecentTransaction]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Recent Transactions")
                    .font(.callout)
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                
                ForEach(transactions.prefix(3)) { tx in   // <-- only latest 3
                    TransactionRowCard(tx: tx)
                }
            }
            .padding(.vertical)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    RecentTransactionsView(transactions: [
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
            symbol: "BTC",
            type: "Send",
            amount: 0.001000,
            date: "18 March",
            isReceive: false
        ),
        RecentTransaction(
            imageName: "Exchange_TabBar_Icon",
            symbol: "ETH",
            type: "Receive",
            amount: 1.250000,
            date: "15 March",
            isReceive: true
        ),
        RecentTransaction(
            imageName: "Bitcoin_Logo",
            symbol: "BTC",
            type: "Receive",
            amount: 0.004500,
            date: "12 March",
            isReceive: true
        ),
        RecentTransaction(
            imageName: "Ether_Logo",
            symbol: "ETH",
            type: "Send",
            amount: 0.800000,
            date: "10 March",
            isReceive: false
        )
    ])
}
