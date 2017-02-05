import UIKit

enum ShapeType {
    case Rectangle
    case Circle
    case Triangle
    case Pentagon
    case All
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red

        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        view.backgroundColor = .blue
        self.view.addSubview(view)

        //        self.maskLayerWith(inputView: view, shape: .Rectangle)
        //        self.maskLayerWith(inputView: view, shape: .Circle)
        //        self.maskLayerWith(inputView: view, shape: .Triangle)
        //        self.maskLayerWith(inputView: view, shape: .Pentagon)
        self.maskLayerWith(inputView: view, shape: .All)

    }

    func maskLayerWith(inputView:UIView, shape: ShapeType) {

        let finalPath = UIBezierPath(rect: inputView.bounds)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = inputView.bounds

        if (shape == .Rectangle) {
            finalPath.append(self.rectanglePath())
        } else if (shape == .Circle) {
            finalPath.append(self.circlePath())
        } else if (shape == .Triangle) {
            finalPath.append(self.trianglePath())
        } else if (shape == .Pentagon) {
            finalPath.append(self.pentagonPath())
        } else if (shape == .All) {
            finalPath.append(self.rectanglePath())
            finalPath.append(self.circlePath())
            finalPath.append(self.trianglePath())
            finalPath.append(self.pentagonPath())
        }
        maskLayer.fillRule = kCAFillRuleEvenOdd
        maskLayer.path = finalPath.cgPath
        inputView.layer.mask = maskLayer
    }

    func rectanglePath() -> UIBezierPath {
        let rect = CGRect(x: 250, y: 50, width: 100, height: 100)
        return UIBezierPath(rect: rect)
    }

    func circlePath() -> UIBezierPath {
        let radius: CGFloat = 50.0
        let rect = CGRect(x:100, y: 300, width: 2 * radius, height: 2 * radius)
        return UIBezierPath(ovalIn: rect)
    }

    func trianglePath() -> UIBezierPath {
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: view.frame.size.width/2, y: 400))
        trianglePath.addLine(to: CGPoint(x:100, y: 500))
        trianglePath.addLine(to: CGPoint(x: view.frame.size.width - 100, y: 500))
        trianglePath.close()
        return trianglePath
    }

    func pentagonPath() -> UIBezierPath {
        // Ref: https://developer.apple.com/library/content/documentation/2DDrawing/Conceptual/DrawingPrintingiOS/BezierPaths/BezierPaths.html
        let pentagonPath = UIBezierPath()
        // Set the starting point of the shape.
        pentagonPath.move(to: CGPoint(x: 100, y: 70))
        pentagonPath.addLine(to: CGPoint(x: 200, y: 110))
        pentagonPath.addLine(to: CGPoint(x: 160, y: 210))
        pentagonPath.addLine(to: CGPoint(x: 40, y: 210))
        pentagonPath.addLine(to: CGPoint(x: 0, y: 110))
        pentagonPath.close()
        return pentagonPath
    }
    
}
