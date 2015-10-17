import UIKit
import AutoLayoutHelper

class MyView: UIView {
	var _size: CGSize = CGSize(width: 20, height: 20)
	func setSize(size: CGSize) {
		_size = size
		setNeedsLayout()
	}
	
	override func intrinsicContentSize() -> CGSize {
		return _size
	}
}


class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
//		fill()
//		anchorCorners()
//		anchorToEgde()
//		anchorAndFillHorz()
//		anchorAndFillVert()
		alignToAnchor()
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

	func viewWithColor(color: UIColor) -> MyView {
		let v = MyView()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.backgroundColor = color
		return v
	}
	
	func alignToAnchor() {
		let anchor = viewWithColor(UIColor.blackColor())
		view.addSubview(anchor)
		anchor.setSize(CGSize(width: 100, height: 100))
		anchor.centerInSuperView()
		
		let green = viewWithColor(UIColor.greenColor())
		view.addSubview(green)
		green.alignToAnchor(anchor, align: .AboveMatchingLeft, padding: 5)

		let blue = viewWithColor(UIColor.blueColor())
		view.addSubview(blue)
		blue.alignToAnchor(anchor, align: .AboveMatchingCenter, padding: 5)

		let orange = viewWithColor(UIColor.orangeColor())
		view.addSubview(orange)
		orange.alignToAnchor(anchor, align: .AboveMatchingRight, padding: 5)

		let yellow = viewWithColor(UIColor.yellowColor())
		view.addSubview(yellow)
		yellow.alignToAnchor(anchor, align: .BelowMatchingLeft, padding: 5)

		let purple = viewWithColor(UIColor.purpleColor())
		view.addSubview(purple)
		purple.alignToAnchor(anchor, align: .BelowMatchingCenter, padding: 5)

		let brown = viewWithColor(UIColor.brownColor())
		view.addSubview(brown)
		brown.alignToAnchor(anchor, align: .BelowMatchingRight, padding: 5)

		let cyan = viewWithColor(UIColor.cyanColor())
		view.addSubview(cyan)
		cyan.alignToAnchor(anchor, align: .LeftMatchingTop, padding: 5)
		
		let red = viewWithColor(UIColor.redColor())
		view.addSubview(red)
		red.alignToAnchor(anchor, align: .LeftMatchingCenter, padding: 5)
		
		let magenta = viewWithColor(UIColor.magentaColor())
		view.addSubview(magenta)
		magenta.alignToAnchor(anchor, align: .LeftMatchingBottom, padding: 5)

		let brown2 = viewWithColor(UIColor.brownColor())
		view.addSubview(brown2)
		brown2.alignToAnchor(anchor, align: .RightMatchingTop, padding: 5)
		
		let cyan2 = viewWithColor(UIColor.cyanColor())
		view.addSubview(cyan2)
		cyan2.alignToAnchor(anchor, align: .RightMatchingCenter, padding: 5)
		
		let purple2 = viewWithColor(UIColor.purpleColor())
		view.addSubview(purple2)
		purple2.alignToAnchor(anchor, align: .RightMatchingBottom, padding: 5)
		
		
}

}


