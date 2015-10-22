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
	
	public enum Align {
		case AboveMatchingLeft
		case AboveMatchingCenter
		case AboveMatchingRight
		case BelowMatchingLeft
		case BelowMatchingCenter
		case BelowMatchingRight
		case LeftMatchingTop
		case LeftMatchingCenter
		case LeftMatchingBottom
		case RightMatchingTop
		case RightMatchingCenter
		case RightMatchingBottom
	}
	
	public func centerInSuperView() {
		guard let mySuperView = superview else {
			print("\(self) expected to be embedded in superview")
			return
		}
		
		translatesAutoresizingMaskIntoConstraints = false
		let centerX = NSLayoutConstraint(item: self, attribute: .CenterX, relatedBy: .Equal, toItem: mySuperView, attribute: .CenterX, multiplier: 1.0, constant: 0)
		let centerY = NSLayoutConstraint(item: self, attribute: .CenterY, relatedBy: .Equal, toItem: mySuperView, attribute: .CenterY, multiplier: 1.0, constant: 0)
		mySuperView.addConstraints([centerX, centerY])
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
		guard let mySuperView = superview else {
			print("\(self) expected to be embedded in superview")
			return
		}

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
		guard let mySuperView = superview else {
			print("\(self) expected to be embedded in superview")
			return
		}
		
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
		guard let mySuperView = superview else {
			print("\(self) expected to be embedded in superview")
			return
		}
		
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
	
	public func alignToAnchor(anchor: UIView, align: Align, padding: CGFloat = 0) {
		guard let ourSuperView = superview else {
			print("\(self) expected to be embedded in superview")
			return
		}
		
		guard let otherSuperView = anchor.superview else {
			print("\(anchor) expected to be embedded in superview")
			return
		}
		
		if ourSuperView != otherSuperView {
			print("\(anchor) expected to be embedded in superview")
			return
		}

		translatesAutoresizingMaskIntoConstraints = false
		let leftV = NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: anchor, attribute: .Leading, multiplier: 1.0, constant: 0)
		let centerV = NSLayoutConstraint(item: self, attribute: .CenterX, relatedBy: .Equal, toItem: anchor, attribute: .CenterX, multiplier: 1.0, constant: 0)
		let rightV = NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: anchor, attribute: .Trailing, multiplier: 1.0, constant: 0)
		let bottomV = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: anchor, attribute: .Top, multiplier: 1.0, constant: -padding)
		let topV = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: anchor, attribute: .Bottom, multiplier: 1.0, constant: padding)
		let leftH = NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: anchor, attribute: .Leading, multiplier: 1.0, constant: -padding)
		let rightH = NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: anchor, attribute: .Trailing, multiplier: 1.0, constant: padding)
		let topH = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: anchor, attribute: .Top, multiplier: 1.0, constant: 0)
		let centerH = NSLayoutConstraint(item: self, attribute: .CenterY, relatedBy: .Equal, toItem: anchor, attribute: .CenterY, multiplier: 1.0, constant: 0)
		let bottomH = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: anchor, attribute: .Bottom, multiplier: 1.0, constant: 0)

		switch align {
		case .AboveMatchingLeft:
			ourSuperView.addConstraints([leftV, bottomV])
		case .AboveMatchingCenter:
			ourSuperView.addConstraints([centerV, bottomV])
		case .AboveMatchingRight:
			ourSuperView.addConstraints([rightV, bottomV])
		case .BelowMatchingLeft:
			ourSuperView.addConstraints([leftV, topV])
		case .BelowMatchingCenter:
			ourSuperView.addConstraints([centerV, topV])
		case .BelowMatchingRight:
			ourSuperView.addConstraints([rightV, topV])
		case .LeftMatchingTop:
			ourSuperView.addConstraints([leftH, topH])
		case .LeftMatchingCenter:
			ourSuperView.addConstraints([leftH, centerH])
		case .LeftMatchingBottom:
			ourSuperView.addConstraints([leftH, bottomH])
		case .RightMatchingTop:
			ourSuperView.addConstraints([rightH, topH])
		case .RightMatchingCenter:
			ourSuperView.addConstraints([rightH, centerH])
		case .RightMatchingBottom:
			ourSuperView.addConstraints([rightH, bottomH])
		}
	}
	
	public func applyAspectRatio(ratio: CGFloat) {
		translatesAutoresizingMaskIntoConstraints = false
		let aspect = NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: ratio, constant: 0)
		addConstraint(aspect)
	}
	
	public func applySameSizeToSubviews(views: [UIView]) {
		applySameHeigthToSubviews(views)
		applySameWidthToSubviews(views)
	}
	
	public func applyHeightsToSubviews(views: [UIView], withRelations relations: [Float]) {
		if views.count != relations.count {
			print("expect to have equal counts, views.count \(views.count) - relations.count \(relations.count)")
			return
		}

		translatesAutoresizingMaskIntoConstraints = false
		if let first = views.first {
			for (index, view) in views.enumerate() {
				if view != first {
					let multiplier = CGFloat(relations[index]) / CGFloat(relations[0])
					addConstraint(NSLayoutConstraint(item: view, attribute: .Height, relatedBy: .Equal, toItem: first, attribute: .Height, multiplier: multiplier, constant: 0))
				}
			}
		}
	}
	
	public func applySameHeigthToSubviews(views: [UIView]) {
		if !haveSameSuperView(views) {
			print ("expect to have the same superView")
			return
		}
		
		var relations: [Float] = []
		for _ in 0..<views.count {
			relations.append(1.0)
		}
		applyHeightsToSubviews(views, withRelations: relations)
	}
	
	public func applyWidthsToSubviews(views: [UIView], withRelations relations: [Float]) {
		if views.count != relations.count {
			print("expect to have equal counts, views.count \(views.count) - relations.count \(relations.count)")
			return
		}
		
		translatesAutoresizingMaskIntoConstraints = false
		if let first = views.first {
			for (index, view) in views.enumerate() {
				if view != first {
					let multiplier = CGFloat(relations[index]) / CGFloat(relations[0])
					addConstraint(NSLayoutConstraint(item: view, attribute: .Width, relatedBy: .Equal, toItem: first, attribute: .Width, multiplier: multiplier, constant: 0))
				}
			}
		}
	}

	
	public func applySameWidthToSubviews(views: [UIView]) {
		if !haveSameSuperView(views) {
			print ("expect to have the same superView")
			return
		}
		
		var relations: [Float] = []
		for _ in 0..<views.count {
			relations.append(1.0)
		}
		applyWidthsToSubviews(views, withRelations: relations)
	}
	
	func haveSameSuperView(views: [UIView]) -> Bool {
		let filtered = views.filter() { $0.superview == views.first?.superview }
		return filtered.count == views.count
	}

}
