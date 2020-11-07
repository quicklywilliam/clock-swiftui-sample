
import SwiftUI

struct ClockMarks: View {
    
    private let relativeLength: CGFloat = 0.08
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<24) { n in
                Path { path in
                    path.move(to: CGPoint(x: geometry.size.width / 2, y: 0))
                    path.addLine(to: CGPoint(x: geometry.size.width / 2, y: self.relativeLength * geometry.size.height / CGFloat((n%2+1))))
                }
                .stroke(Color.primary)
                .rotationEffect(Angle(degrees: Double(n) * 360 / 24))
            }
        }
    }
}
