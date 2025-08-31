import SwiftUI

struct GraphView: View {
    @ObservedObject var viewModel: AnalyticsViewModel
    let barWidth: CGFloat = 48
    let spacing: CGFloat = 6

    var body: some View {
        GeometryReader { geo in
            let maxValue = viewModel.chartData.max() ?? 1

            ScrollView(.horizontal, showsIndicators: false) {
                ZStack {
                    // Bars
                    HStack(alignment: .bottom, spacing: spacing) {
                        ForEach(viewModel.chartData.indices, id: \.self) { index in
                            let value = viewModel.chartData[index]
                            RoundedRectangle(cornerRadius: 8)
                                .overlay(
                                       LinearGradient(
                                           gradient: Gradient(colors: [
                                               Color.black.opacity(1), // bottom dark fade
                                               Color.black.opacity(0.8)
                                           ]),
                                           startPoint: .bottom,
                                           endPoint: .top
                                       )
                                   )
                                .frame(
                                    width: barWidth,
                                    height: CGFloat(value / maxValue) * (geo.size.height - 20)
                                )
                        }
                    }
                    .padding(.horizontal, 15)

                    // Smooth line overlay
                    let points: [CGPoint] = viewModel.chartData.enumerated().map { index, value in
                        var x = CGFloat(index) * (barWidth + spacing) + barWidth / 2 + 15
                        // Stretch start and end
                        if index == 0 {
                            x = 15 // very left edge
                        } else if index == viewModel.chartData.count - 1 {
                            x = CGFloat(index) * (barWidth + spacing) + barWidth + 15 // right edge
                        }

                        let y = geo.size.height - (CGFloat(value / maxValue) * (geo.size.height - 20)) + 30
                        return CGPoint(x: x, y: y)
                    }

                    SmoothLineShape(points: points)
                        .stroke(Color.green, style: StrokeStyle(lineWidth: 1.5, lineJoin: .round))
                }
                .frame(height: geo.size.height)
            }
        }
        .frame(height: 250)
    }
}

#Preview {
    GraphView(viewModel: AnalyticsViewModel())
}
