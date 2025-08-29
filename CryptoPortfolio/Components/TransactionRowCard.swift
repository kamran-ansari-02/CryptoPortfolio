import SwiftUI

struct TransactionRowCard: View {
    let tx: RecentTransaction
    
    var body: some View {
        HStack {
            // Icon
            Image(tx.imageName) // asset image: "btc.png", "eth.png", etc.
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
//                .frame(
//                    width:tx.imageName == "Bitcoin_Logo" ? 50 : 36,
//                    height:tx.imageName == "Bitcoin_Logo" ? 50 : 36)
                .padding(8)
//                .background(tx.imageName == "Bitcoin_Logo" ? Color.clear.opacity(0.2) : Color.white.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            // Left info
            VStack(alignment: .leading, spacing: 4) {
                Text(tx.type)
                    .font(.footnote)
                    .foregroundColor(.white)
                Text(tx.date)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Right info
            VStack(alignment: .trailing, spacing: 4) {
                Text(tx.symbol)
                    .font(.footnote)
                    .foregroundColor(.white)
                
                Text(String(format: "%@%.6f",
                            tx.isReceive ? "+" : "-",
                            tx.amount))
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
    }
}

#Preview {
    VStack(spacing: 16) {
        TransactionRowCard(
            tx: RecentTransaction(
                imageName: "Bitcoin_Logo",
                symbol: "BTC",
                type: "Receive",
                amount: 0.002126,
                date: "20 March",
                isReceive: true
            )
        )
        
        TransactionRowCard(
            tx: RecentTransaction(
                imageName: "Exchange_TabBar_Icon",
                symbol: "BTC",
                type: "Send",
                amount: 0.001000,
                date: "18 March",
                isReceive: false
            )
        )
    }
}
