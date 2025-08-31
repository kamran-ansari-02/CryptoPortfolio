import SwiftUI

struct TimeSelectorView: View {
    @ObservedObject var viewModel: AnalyticsViewModel
    let timeRanges = ["1h", "8h", "1d", "1w", "1m", "6m", "1y"]
    @Namespace private var animationNamespace
    let buttonWidth: CGFloat = 48
    let capsuleHeight: CGFloat = 40

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 6) {
                ForEach(timeRanges, id: \.self) { range in
                    ZStack {
                        // Invisible capsule placeholder for layout
                        Capsule()
                            .fill(Color.clear)
                            .frame(width: buttonWidth, height: capsuleHeight)
                        
                        // Moving capsule for selection
                        if viewModel.selectedRange == range {
                            Capsule()
                                .fill(Color.white.opacity(0.15)) // Always visible even on dark
                                .frame(width: buttonWidth, height: capsuleHeight)
                                .matchedGeometryEffect(id: "timeSelector", in: animationNamespace)
                        }
                        
                        Text(range)
                            .font(.subheadline.weight(.semibold))
                            .foregroundColor(viewModel.selectedRange == range ? .white : .gray)
                            
                    }
                    .onTapGesture {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                            viewModel.selectedRange = range
                        }
                    }
                }
            }
            .padding(.horizontal, 15)
        }
    }
}



#Preview {
    TimeSelectorView(viewModel: AnalyticsViewModel())
}
