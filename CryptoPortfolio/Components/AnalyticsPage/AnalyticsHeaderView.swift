import SwiftUI

struct AnalyticsHeaderView: View {
    @ObservedObject var viewModel: AnalyticsViewModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                // Title
                Text("Portfolio Value")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Image(systemName: "chevron.right")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                // Figma-style Icon Toggle
                HStack(spacing: 0) {
                    // INR Icon
                    Image("Money_Logo_Header")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(viewModel.showINR ? .white : .gray)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(
                            viewModel.showINR ? Color.black : Color.clear
                        )
                        .clipShape(Capsule())
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                viewModel.showINR = true
                            }
                        }

                    // BTC Icon
                    Image("Bitcoin_Logo_Header")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(!viewModel.showINR ? .white : .gray)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(
                            !viewModel.showINR ? Color.black : Color.clear
                        )
                        .clipShape(Capsule())
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                viewModel.showINR = false
                            }
                        }
                }
                .background(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 999)
                        .inset(by: 0.5)
                        .stroke(.white.opacity(0.3), lineWidth: 0.3)
                )
                .cornerRadius(40)
            }
            
            // Big Value aligned to leading
            HStack {
                Text(viewModel.showINR ? "₹\(Int(viewModel.portfolioINR))"
                                       : "≈ 2.1 BTC")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                Spacer()
            }
            .padding(.bottom, 32)
            
        }
      
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: 250)
        .background(
            LinearGradient(
                   gradient: Gradient(colors: [Color("Color_Tab_Bar"), Color.black]),
                   startPoint: UnitPoint(x: 0.6, y: 0.9),   // bottom-left
                   endPoint: UnitPoint(x: 0.8, y: 0.1)      // top-right but more slanted
               )
        )
        .cornerRadius(40)
    }
}

#Preview {
    AnalyticsHeaderView(viewModel: AnalyticsViewModel())
}
