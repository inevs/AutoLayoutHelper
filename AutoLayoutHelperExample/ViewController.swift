import UIKit
import AutoLayoutHelper

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
//		fill()
//		anchorCorners()
//		anchorToEgde()
//		anchorAndFillHorz()
		anchorAndFillVert()
	}
	
	func fill() {
		let red = viewWithColor(UIColor.redColor())
		view.addSubview(red)
		red.fillSuperViewWithPadding(top: 10, left: 10, bottom: 10, right: 10)
	}
	
	func anchorCorners() {
		let red = viewWithColor(UIColor.redColor())
		view.addSubview(red)
		red.anchorInCorner(.TopLeft)
		let green = viewWithColor(UIColor.greenColor())
		view.addSubview(green)
		green.anchorInCorner(.TopRight)
		let blue = viewWithColor(UIColor.blueColor())
		view.addSubview(blue)
		blue.anchorInCorner(.BottomLeft)
		let orange = viewWithColor(UIColor.orangeColor())
		view.addSubview(orange)
		orange.anchorInCorner(.BottomRight)
	}
	
	func anchorToEgde() {
		let red = viewWithColor(UIColor.redColor())
		view.addSubview(red)
		red.anchorToEgde(.Top, padding: 10)
		let green = viewWithColor(UIColor.greenColor())
		view.addSubview(green)
		green.anchorToEgde(.Left, padding: 10)
		let blue = viewWithColor(UIColor.blueColor())
		view.addSubview(blue)
		blue.anchorToEgde(.Bottom, padding: 10)
		let orange = viewWithColor(UIColor.orangeColor())
		view.addSubview(orange)
		orange.anchorToEgde(.Right, padding: 10)
	}
	
	func anchorAndFillHorz() {
		let red = viewWithColor(UIColor.redColor())
		view.addSubview(red)
		red.anchorAndFillEdge(.Left, xPad: 10, yPad: 10)
		let green = viewWithColor(UIColor.greenColor())
		view.addSubview(green)
		green.anchorAndFillEdge(.Right, xPad: 10, yPad: 10)
	}

	func anchorAndFillVert() {
		let red = viewWithColor(UIColor.redColor())
		view.addSubview(red)
		red.anchorAndFillEdge(.Top, xPad: 10, yPad: 10)
		let green = viewWithColor(UIColor.greenColor())
		view.addSubview(green)
		green.anchorAndFillEdge(.Bottom, xPad: 10, yPad: 10)
	}

	func viewWithColor(color: UIColor) -> UIView {
		let v = MyView()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.backgroundColor = color
		return v
	}

}

class MyView: UIView {
	override func intrinsicContentSize() -> CGSize {
		return CGSizeMake(100, 100)
	}
}

