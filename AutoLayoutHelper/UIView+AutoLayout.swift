import UIKit

public extension UIView {
	
	public enum Corner {
		case TopLeft
		case TopRight
		case BottomLeft
		case BottomRight
	}
	
	public enum Egde {
		case Top
		case Left
		case Bottom
		case Right
	}
	
	public func fillSuperView() {
		self.fillSuperViewWithPadding(top: 0, left: 0, bottom: 0, right: 0)
	}
	
	public func fillSuperViewWithPadding(top top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
		guard let mySuperView = superview else {
			print("\(self) expected to be embedded in superview")
			return
		}
		
		translatesAutoresizingMaskIntoConstraints = false
		let tc = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: mySuperView, attribute: .Top, multiplier: 1.0, constant: top)
		tc.identifier = "top"
		let bc = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: mySuperView, attribute: .Bottom, multiplier: 1.0, constant: -bottom)
		bc.identifier = "bottom"
		let lc = NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: mySuperView, attribute: .Leading, multiplier: 1.0, constant: left)
		lc.identifier = "left"
		let rc = NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: mySuperView, attribute: .Trailing, multiplier: 1.0, constant: -right)
		rc.identifier = "right"
		mySuperView.addConstraints([tc, bc, lc, rc])
	}
	
	public func anchorInCorner(corner: Corner) {
		anchorInCorner(corner, xPad: 0, yPad: 0)
	}
	
	public func anchorInCorner(corner: Corner, xPad: CGFloat, yPad: CGFloat) {
		guard let mySuperView = superview else { return }

		translatesAutoresizingMaskIntoConstraints = false
		let left = NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: mySuperView, attribute: .Leading, multiplier: 1.0, constant: xPad)
		let right = NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: mySuperView, attribute: .Trailing, multiplier: 1.0, constant: -xPad)
		let top = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: mySuperView, attribute: .Top, multiplier: 1.0, constant: yPad)
		let bottom = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: mySuperView, attribute: .Bottom, multiplier: 1.0, constant: -yPad)

		switch corner {
		case .TopLeft:
			mySuperView.addConstraints([top, left])
		case .TopRight:
			mySuperView.addConstraints([top, right])
		case .BottomLeft:
			mySuperView.addConstraints([bottom, left])
		case .BottomRight:
			mySuperView.addConstraints([bottom, right])
		}
	}
	
	public func anchorToEgde(egde: Egde, padding: CGFloat = 0) {
		guard let mySuperView = superview else { return }
		
		translatesAutoresizingMaskIntoConstraints = false
		let left = NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: mySuperView, attribute: .Leading, multiplier: 1.0, constant: padding)
		let right = NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: mySuperView, attribute: .Trailing, multiplier: 1.0, constant: -padding)
		let top = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: mySuperView, attribute: .Top, multiplier: 1.0, constant: padding)
		let bottom = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: mySuperView, attribute: .Bottom, multiplier: 1.0, constant: -padding)
		let vCenter = NSLayoutConstraint(item: self, attribute: .CenterY, relatedBy: .Equal, toItem: mySuperView, attribute: .CenterY, multiplier: 1.0, constant: 0)
		let hCenter = NSLayoutConstraint(item: self, attribute: .CenterX, relatedBy: .Equal, toItem: mySuperView, attribute: .CenterX, multiplier: 1.0, constant: 0)
		
		switch egde {
		case .Left:
			mySuperView.addConstraints([left, vCenter])
		case .Right:
			mySuperView.addConstraints([right, vCenter])
		case .Bottom:
			mySuperView.addConstraints([bottom, hCenter])
		case .Top:
			mySuperView.addConstraints([top, hCenter])
		}
		
	}

	public func anchorAndFillEdge(egde: Egde) {
		anchorAndFillEdge(egde, xPad: 0, yPad: 0)
	}
	
	public func anchorAndFillEdge(egde: Egde, xPad: CGFloat, yPad: CGFloat) {
		guard let mySuperView = superview else { return }
		
		translatesAutoresizingMaskIntoConstraints = false
		let left = NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: mySuperView, attribute: .Leading, multiplier: 1.0, constant: xPad)
		let right = NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: mySuperView, attribute: .Trailing, multiplier: 1.0, constant: -xPad)
		let top = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: mySuperView, attribute: .Top, multiplier: 1.0, constant: yPad)
		let bottom = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: mySuperView, attribute: .Bottom, multiplier: 1.0, constant: -yPad)

		switch egde {
		case .Left:
			mySuperView.addConstraints([left, top, bottom])
		case .Right:
			mySuperView.addConstraints([right, top, bottom])
		case .Bottom:
			mySuperView.addConstraints([left, right, bottom])
		case .Top:
			mySuperView.addConstraints([left, right, top])
		}
	}
	

}
