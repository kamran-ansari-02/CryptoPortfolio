import SwiftUI

class AnalyticsViewModel: ObservableObject {
    @Published var showINR: Bool = true
    @Published var selectedRange: String = "6m"
    @Published var selectedIndex: Int? = nil   // <-- new property
    
    // ✅ Added 5 mock transactions
    @Published var transactions: [RecentTransaction] = [
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
            symbol: "BTH",
            type: "Receive",
            amount: 1.250000,
            date: "15 March",
            isReceive: true
        ),
        RecentTransaction(
            imageName: "Bitcoin_Logo",
            symbol: "LTC",
            type: "Send",
            amount: 2.750000,
            date: "13 March",
            isReceive: false
        ),
        RecentTransaction(
            imageName: "Bitcoin_Logo",
            symbol: "DOGE",
            type: "Receive",
            amount: 500.000000,
            date: "10 March",
            isReceive: true
        )
    ]
    
    // Mock portfolio trend data for each time range
    @Published var chartDataByRange: [String: [Double]] = [
        "1h": [50, 30, 50, 60, 65, 50, 96],
        "8h": [100, 105, 13, 58, 110, 37, 40],
        "1d": [70, 40, 50, 115, 50, 38, 75],
        "1w": [120, 45, 23, 30, 35, 70, 138],
        "1m": [90, 55, 40, 138, 45, 15, 48],
        "6m": [170, 220, 205, 255, 230, 200, 265],
        "1y": [80, 50, 70, 55, 75, 100, 138]
    ]
    
    // Computed property to get chart data for currently selected range
    var chartData: [Double] {
        chartDataByRange[selectedRange] ?? []
    }
    
    // Assets
    @Published var assets: [CryptoAsset] = [
        CryptoAsset(symbol: "BTC", name: "Bitcoin", price: 3000000, delta: 2.5, imageName: "Bitcoin_Logo"),
        CryptoAsset(symbol: "ETH", name: "Ether", price: 200000, delta: -1.2, imageName: "Ether_Logo")
    ]
    
    var portfolioINR: Double {
        assets.reduce(0) { $0 + $1.price }
    }
    
    // MARK: - Initializer
    init() {
        updateSelectedIndex()  // ensure default is last bar of 6m
    }
    
    // MARK: - Helpers
    func updateSelectedIndex() {
        let data = chartData
        if !data.isEmpty {
            selectedIndex = data.count - 1  // highlight last bar
        } else {
            selectedIndex = nil
        }
    }
    
    func changeRange(to newRange: String) {
        selectedRange = newRange
        updateSelectedIndex()  // auto-move highlight when range changes
    }
}
