import Foundation

struct RecentTransaction: Identifiable {
    let id = UUID()
    let imageName: String
    let symbol: String     // e.g. "BTC"
    let type: String       // e.g. "Receive" or "Send"
    let amount: Double     // e.g. 0.002126
    let date: String       // e.g. "20 March"
    let isReceive: Bool    // true = Receive, false = Send
}
