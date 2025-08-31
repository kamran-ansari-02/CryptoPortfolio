import SwiftUI

struct TransactionRowCard: View {
    let tx: RecentTransaction
    var overrideImage: String? = nil // optional system image name
    
    var body: some View {
        HStack {
            // Icon
            if let override = overrideImage {
                Image(systemName: override) // use system image if override provided
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding(8)
                    .background(Color("Custom_Light_Gray_BG"))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .foregroundColor(.white)
            } else {
                Image(tx.imageName) // asset image fallback
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(8)
                    .background(tx.imageName == "Bitcoin_Logo" ? Color.clear.opacity(0.2) : Color.white.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
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
