import UIKit

class Pie: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        let colors = [UIColor.gray000, UIColor.main800]

        let values: [CGFloat] = [75, 25]
        let total = values.reduce(0, +)
        
        //x degree = x * π / 180 radian
        var startAngle: CGFloat = (-(.pi) / 10)
        var endAngle: CGFloat = 0.0
        
        values.forEach { (value) in
            endAngle = (value / total) * (.pi * 2)
            
            let path = UIBezierPath()
            path.move(to: center)
            path.addArc(withCenter: center,
                        radius: 55,
                        startAngle: startAngle,
                        endAngle: startAngle + endAngle,
                        clockwise: true)
            
            colors.randomElement()?.set()
            path.fill()
            startAngle += endAngle
            path.close()
            
        }
        
        let semiCircle = UIBezierPath(arcCenter: center,
                                      radius: 45,
                                      startAngle: 0,
                                      endAngle: (360 * .pi) / 180,
                                      clockwise: true)
        UIColor.white.set()
        semiCircle.fill()
    }
}
