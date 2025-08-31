import SwiftUI

struct PortfolioCardView: View {
    @ObservedObject var viewModel: AnalyticsViewModel
    
    var body: some View {
        ZStack {
            // --- BACK CARDS ---
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("Portfolio_Exchange_C4"))
                .offset(y: 20)
                .padding(.horizontal, 16)
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("Portfolio_Exchange_C3"))
                .offset(y: 10)
                .padding(.horizontal, 8)
            
            // --- MAIN CARD ---
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 30)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color("Portfolio_Exchange_C1"), Color("Portfolio_Exchange_C2")]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                
                VStack {
                    // INR capsule
                    Text("INR")
                        .font(.caption)
                        .frame(width: 25, height: 25)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color("Portfolio_Exchange_C2").opacity(0.4))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    // Portfolio Value
                    Text("₹\(viewModel.portfolioINR, specifier: "%.2f")")
                        .font(.system(size: 38, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.bottom, 1)
                    
                    // Sub-value (mock right now)
                    HStack(spacing: 6) {
                        Text("₹1,342")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.9))
                        Spacer()
                        
                        Text("+4.6%")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.green)
                    }
                    .padding(.horizontal, 125)
                }
                .padding(.vertical, 28)
            }
            .frame(height: 200)
       
        }
        .frame(height: 205) // extra height so background cards show
        .padding(.horizontal)
    }
}

#Preview {
    let analyticsVM = AnalyticsViewModel()
    PortfolioCardView(viewModel: analyticsVM)   // ✅ Use AnalyticsViewModel directly
}
