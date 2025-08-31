import SwiftUI

struct AssetsListView: View {
    let assets: [CryptoAsset]
    var showINR: Bool = true
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(assets, id: \.symbol) { asset in
                    VStack {
                        // Logo + name
                        HStack {
                            Image(asset.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)
                                .clipShape(Circle())
                            Spacer()

                            Text(asset.name)
                                .font(.headline)
                                .fontWeight(.regular)
                                .foregroundColor(.white)
                            Text("(\(asset.symbol))")
                                .font(.headline)
                                .fontWeight(.regular)
                                .foregroundColor(.white)
                            
                        }
                        .padding(.top, 12)
                        Spacer()
                        
                        // Price + % change
                        HStack(spacing: 2) {
                            Text(showINR ? "₹\(Int(asset.price))" : "\(asset.price)")
                                .font(.headline)
                                .foregroundColor(.white)
                                .fontWeight(.regular)
                            Spacer()
                            
                            Text(String(format: "%+.2f%%", asset.delta))
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundColor(asset.delta >= 0 ? .green : .red)

                        }
                        .padding(.bottom, 12)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .frame(width: 220, height: 120)
                    .background(Color("Tab_Bar_BG"))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .inset(by: 0.5)
                            .stroke(.white.opacity(0.3), lineWidth: 0.25)
                    )
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    AssetsListView(assets: AnalyticsViewModel().assets, showINR: true)
}
