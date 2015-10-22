#AutoLayoutHelper

AutoLayoutHelper is a framework to help using Autolayout in iOS. It encapsulates common tasks to simple functions of a view. the following tasks are supported:
Every view that shall be layouted should be added to a superview. Otherwise the method will return without doing anything. There ist no need to call `view.translatesAutoresizingMaskIntoConstraints = false`anymore.
The API of AutoLayoutHelper is inspired by [mamaral/Neon](https://github.com/mamaral/Neon)

## Center in SuperView

If you simply want to center a view in its superview without changing the size of the view you can call

```
view.centerInSuperView()
```

If you want to fill the entire superview then you call

```
view.fillSuperView()
view.fillSuperViewWithPadding(top:10, left:10, right:10, bottom:10)
```

##Anchor in Corner
You can stick the view in the corner of its superview.

```
view.anchorInCorner(.TopLeft)
view.anchorInCorner(.TopRight)
view.anchorInCorner(.BottomLeft)
view.anchorInCorner(.BottomRight)
```
And of course you can add a padding:

```
view.anchorInCorner(.TopLeft, xPad: 10, yPad: 10)
view.anchorInCorner(.TopRight, xPad: 10, yPad: 10)
view.anchorInCorner(.BottomLeft, xPad: 10, yPad: 10)
view.anchorInCorner(.BottomRight, xPad: 10, yPad: 10)
```

... to be continued
