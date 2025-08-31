
import SwiftUI

struct SmoothLineShape: Shape {
    var points: [CGPoint]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        guard points.count > 1 else { return path }

        path.move(to: points[0])

        for i in 1..<points.count {
            let prev = points[i - 1]
            let current = points[i]
            let mid = CGPoint(x: (prev.x + current.x) / 2,
                              y: (prev.y + current.y) / 2)

            if i == 1 {
                path.addQuadCurve(to: mid, control: prev)
            } else {
                let prevMid = CGPoint(x: (points[i - 2].x + prev.x) / 2,
                                      y: (points[i - 2].y + prev.y) / 2)
                path.addCurve(to: mid,
                              control1: prevMid,
                              control2: prev)
            }

            if i == points.count - 1 {
                path.addQuadCurve(to: current, control: mid)
            }
        }

        return path
    }
}


