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
		case Center
	}
	
	public func centerInSuperView(priority: UILayoutPriority = 1000) {
		guard let mySuperView = superview else {
			print("\(self) expected to be embedded in superview")
			return
		}
		
		translatesAutoresizingMaskIntoConstraints = false
		let centerX = NSLayoutConstraint(item: self, attribute: .CenterX, relatedBy: .Equal, toItem: mySuperView, attribute: .CenterX, multiplier: 1.0, constant: 0)
		let centerY = NSLayoutConstraint(item: self, attribute: .CenterY, relatedBy: .Equal, toItem: mySuperView, attribute: .CenterY, multiplier: 1.0, constant: 0)
		centerX.priority = priority
		centerY.priority = priority
		mySuperView.addConstraints([centerX, centerY])
	}
	
	public func fillSuperView(priority: UILayoutPriority = 1000) {
		self.fillSuperViewWithPadding(top: 0, left: 0, bottom: 0, right: 0, priority: priority)
	}
	
	public func fillSuperViewWithPadding(top top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat, priority: UILayoutPriority = 1000) {
		guard let mySuperView = superview else {
			print("\(self) expected to be embedded in superview")
			return
		}
		
		translatesAutoresizingMaskIntoConstraints = false
		let tc = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: mySuperView, attribute: .Top, multiplier: 1.0, constant: top)
		tc.identifier = "top"
		tc.priority = priority
		let bc = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: mySuperView, attribute: .Bottom, multiplier: 1.0, constant: -bottom)
		bc.identifier = "bottom"
		bc.priority = priority
		let lc = NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: mySuperView, attribute: .Leading, multiplier: 1.0, constant: left)
		lc.identifier = "left"
		lc.priority = priority
		let rc = NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: mySuperView, attribute: .Trailing, multiplier: 1.0, constant: -right)
		rc.identifier = "right"
		rc.priority = priority
		mySuperView.addConstraints([tc, bc, lc, rc])
	}
	
	public func anchorInCorner(corner: Corner, priority: UILayoutPriority = 1000) {
		anchorInCorner(corner, xPad: 0, yPad: 0, priority: priority)
	}
	
	public func anchorInCorner(corner: Corner, xPad: CGFloat, yPad: CGFloat, priority: UILayoutPriority = 1000) {
		guard let mySuperView = superview else {
			print("\(self) expected to be embedded in superview")
			return
		}

		translatesAutoresizingMaskIntoConstraints = false
		let left = NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: mySuperView, attribute: .Leading, multiplier: 1.0, constant: xPad)
		left.priority = priority
		let right = NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: mySuperView, attribute: .Trailing, multiplier: 1.0, constant: -xPad)
		right.priority = priority
		let top = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: mySuperView, attribute: .Top, multiplier: 1.0, constant: yPad)
		top.priority = priority
		let bottom = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: mySuperView, attribute: .Bottom, multiplier: 1.0, constant: -yPad)
		bottom.priority = priority
		
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
	
	public func anchorToEgde(egde: Egde, padding: CGFloat = 0, priority: UILayoutPriority = 1000) {
		guard let mySuperView = superview else {
			print("\(self) expected to be embedded in superview")
			return
		}
		
		translatesAutoresizingMaskIntoConstraints = false
		let left = NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: mySuperView, attribute: .Leading, multiplier: 1.0, constant: padding)
		left.priority = priority
		let right = NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: mySuperView, attribute: .Trailing, multiplier: 1.0, constant: -padding)
		right.priority = priority
		let top = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: mySuperView, attribute: .Top, multiplier: 1.0, constant: padding)
		top.priority = priority
		let bottom = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: mySuperView, attribute: .Bottom, multiplier: 1.0, constant: -padding)
		bottom.priority = priority
		let vCenter = NSLayoutConstraint(item: self, attribute: .CenterY, relatedBy: .Equal, toItem: mySuperView, attribute: .CenterY, multiplier: 1.0, constant: 0)
		vCenter.priority = priority
		let hCenter = NSLayoutConstraint(item: self, attribute: .CenterX, relatedBy: .Equal, toItem: mySuperView, attribute: .CenterX, multiplier: 1.0, constant: 0)
		hCenter.priority = priority
		
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

	public func anchorAndFillEdge(egde: Egde, priority: UILayoutPriority = 1000) {
		anchorAndFillEdge(egde, xPad: 0, yPad: 0, priority: priority)
	}
	
	public func anchorAndFillEdge(egde: Egde, xPad: CGFloat, yPad: CGFloat, priority: UILayoutPriority = 1000) {
		guard let mySuperView = superview else {
			print("\(self) expected to be embedded in superview")
			return
		}
		
		translatesAutoresizingMaskIntoConstraints = false
		let left = NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: mySuperView, attribute: .Leading, multiplier: 1.0, constant: xPad)
		left.priority = priority
		let right = NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: mySuperView, attribute: .Trailing, multiplier: 1.0, constant: -xPad)
		right.priority = priority
		let top = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: mySuperView, attribute: .Top, multiplier: 1.0, constant: yPad)
		top.priority = priority
		let bottom = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: mySuperView, attribute: .Bottom, multiplier: 1.0, constant: -yPad)
		bottom.priority = priority
		
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
	
	public func alignToAnchor(anchor: UIView, align: Align, padding: CGFloat = 0, priority: UILayoutPriority = 1000) {
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
		leftV.priority = priority
		let centerV = NSLayoutConstraint(item: self, attribute: .CenterX, relatedBy: .Equal, toItem: anchor, attribute: .CenterX, multiplier: 1.0, constant: 0)
		centerV.priority = priority
		let rightV = NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: anchor, attribute: .Trailing, multiplier: 1.0, constant: 0)
		rightV.priority = priority
		let bottomV = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: anchor, attribute: .Top, multiplier: 1.0, constant: -padding)
		bottomV.priority = priority
		let topV = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: anchor, attribute: .Bottom, multiplier: 1.0, constant: padding)
		topV.priority = priority
		let leftH = NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: anchor, attribute: .Leading, multiplier: 1.0, constant: -padding)
		leftH.priority = priority
		let rightH = NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: anchor, attribute: .Trailing, multiplier: 1.0, constant: padding)
		rightH.priority = priority
		let topH = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: anchor, attribute: .Top, multiplier: 1.0, constant: 0)
		topH.priority = priority
		let centerH = NSLayoutConstraint(item: self, attribute: .CenterY, relatedBy: .Equal, toItem: anchor, attribute: .CenterY, multiplier: 1.0, constant: 0)
		centerH.priority = priority
		let bottomH = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: anchor, attribute: .Bottom, multiplier: 1.0, constant: 0)
		bottomH.priority = priority
		
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
		case .Center:
			ourSuperView.addConstraints([centerH, centerV])
		}
	}
	
	public func applyAspectRatio(ratio: CGFloat, priority: UILayoutPriority = 1000) {
		translatesAutoresizingMaskIntoConstraints = false
		let aspect = NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: ratio, constant: 0)
		aspect.priority = priority
		addConstraint(aspect)
	}
	
	public func applySameSizeToSubviews(views: [UIView], priority: UILayoutPriority = 1000) {
		applySameHeigthToSubviews(views, priority: priority)
		applySameWidthToSubviews(views)
	}
	
	public func applyHeightsToSubviews(views: [UIView], withRelations relations: [Float], priority: UILayoutPriority = 1000) {
		if views.count != relations.count {
			print("expect to have equal counts, views.count \(views.count) - relations.count \(relations.count)")
			return
		}

		translatesAutoresizingMaskIntoConstraints = false
		if let first = views.first {
			for (index, view) in views.enumerate() {
				if view != first {
					let multiplier = CGFloat(relations[index]) / CGFloat(relations[0])
					let constraint = NSLayoutConstraint(item: view, attribute: .Height, relatedBy: .Equal, toItem: first, attribute: .Height, multiplier: multiplier, constant: 0)
					constraint.priority = priority
					addConstraint(constraint)
				}
			}
		}
	}
	
	public func applySameHeigthToSubviews(views: [UIView], priority: UILayoutPriority = 1000) {
		if !haveSameSuperView(views) {
			print ("expect to have the same superView")
			return
		}
		
		var relations: [Float] = []
		for _ in 0..<views.count {
			relations.append(1.0)
		}
		applyHeightsToSubviews(views, withRelations: relations, priority: priority)
	}
	
	public func applyWidthsToSubviews(views: [UIView], withRelations relations: [Float], priority: UILayoutPriority = 1000) {
		if views.count != relations.count {
			print("expect to have equal counts, views.count \(views.count) - relations.count \(relations.count)")
			return
		}
		
		translatesAutoresizingMaskIntoConstraints = false
		if let first = views.first {
			for (index, view) in views.enumerate() {
				if view != first {
					let multiplier = CGFloat(relations[index]) / CGFloat(relations[0])
					let constraint = NSLayoutConstraint(item: view, attribute: .Width, relatedBy: .Equal, toItem: first, attribute: .Width, multiplier: multiplier, constant: 0)
					constraint.priority = priority
					addConstraint(constraint)
				}
			}
		}
	}

	
	public func applySameWidthToSubviews(views: [UIView], priority: UILayoutPriority = 1000) {
		if !haveSameSuperView(views) {
			print ("expect to have the same superView")
			return
		}
		
		var relations: [Float] = []
		for _ in 0..<views.count {
			relations.append(1.0)
		}
		applyWidthsToSubviews(views, withRelations: relations, priority: priority)
	}
	
	func haveSameSuperView(views: [UIView]) -> Bool {
		let filtered = views.filter() { $0.superview == views.first?.superview }
		return filtered.count == views.count
	}

}
