import SwiftUI

struct CurvedSideRectangle: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: 0),
                          control: CGPoint(x: rect.midX, y: rect.midY / 2))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))

        path.closeSubpath()
        return path
    }
}


struct CurvedSideRectangle_Previews: PreviewProvider {
    static var previews: some View {
        CurvedSideRectangle()

    }
}
