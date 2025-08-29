import Foundation

struct CryptoAsset: Identifiable {
    let id = UUID()
    let symbol: String    // e.g. BTC
    let name: String      // e.g. Bitcoin
    let price: Double     // e.g. 3000000 INR
    let delta: Double     // % change (e.g. 2.5)
    let imageName: String   // NEW: for asset icon

}
