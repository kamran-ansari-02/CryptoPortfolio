import Foundation

enum Tab: CaseIterable, Hashable {
    case Analytics, Exchange, Record, Wallet
    
    var iconName: String {
        switch self {
        case .Analytics:   return "Analytics_TabBar_Icon"
        case .Exchange:   return "Exchange_TabBar_Icon"
        case .Record:   return "Record_TabBar_Icon"
        case .Wallet: return "Wallet_TabBar_Icon"
        }
    }

    
    var title: String {
        switch self {
        case .Analytics:   return "Analytics"
        case .Exchange:   return "Exchange"
        case .Record:   return "Record"
        case .Wallet: return "Wallet"
        }
    }
    
}
