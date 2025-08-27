//
//  ContentView.swift
//  CryptoPortfolio
//
//  Created by kamran ansari on 25/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Portfolio", systemImage: "chart.line.uptrend.xyaxis")
            }
                   
            ExchangeView()
                .tabItem {
                    Label("Exchange", systemImage: "arrow.swap")
            }
            
            TransactionsView()
                .tabItem {
                    Label("Transactions", systemImage: "list.bullet")
            }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
            }
        }
    }
}

#Preview {
    ContentView()
}
