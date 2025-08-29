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
                
                ForEach(transactions) { tx in
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
        )
    ])
}
