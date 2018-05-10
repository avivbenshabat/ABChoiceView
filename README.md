# ABChoiceView

[![Build Status](https://travis-ci.com/avivbenshabat/ABChoiceView.svg?branch=master)](https://travis-ci.com/avivbenshabat/ABChoiceView) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![License](https://img.shields.io/cocoapods/l/BadgeSwift.svg?style=flat)](/LICENSE) <img src="https://img.shields.io/badge/Swift-4.1-orange.svg" />
---
##### ABChoiceView is a Swift written, custom view library for iOS 9.1+
##### ABChoiceView is very flexible and customable. It can be used in different sizes and shapes and every feature in it is modular.</br>

By default, ChoiceView looks like this:

![default0]
![default1]

When Selected:

```swift
choiceView.checked == true
```

![selected0]

You can change the check image:

```swift
choiceView.checkImage = UIImage(named: "check_x")
```
![selected1]

And add a mask:

```swift
choiceView.maskWhenChecked == true
```

![selected2]

Without image and with different font:

```swift
choiceView.image = nil
choiceView.font = UIFont(name: "Courier", size: 30.0)
```

![noImage]

Without text:

```swift
choiceView.text = nil
```

![noText]

Different size:

![small]

__Borders & mask are also customable__

## Installation

### CocoaPods

Add one of the following lines to your Podfile depending on your Swift version:

```ruby
target 'MyApp' do
  pod 'ABChoiceView', '~> 1.0.3'
end
```

### Carthage

Add one of the following lines to your Cartfile depending on your Swift version:

```ruby
github "avivbenshabat/ABChoiceView"
```

## Usage

### Interface Builder (May not work with Carthage)

Drag a `UIView` into your storyboard. Open the Identity Inspetcor and set `ABChoiceView` as both the class and module.

![interfacebuilder](https://github.com/avivbenshabat/ABChoiceView/blob/master/DemoImages/autolayouts.gif)


### Code

```swift
choiceView.image = UIImage(named: "banana")
choiceView.text = "Banana"
choiceView.font = UIFont(name: "Courier", size: 18)
choiceView.checkImage = UIImage(named: "x_icon")
choiceView.borderPolicy = .noDashes // default is "dashedWhenUnchecked"
choiceView.maskWhenChecked = true // default is false
choiceView.maskData = DiagonalBackgroundView.Data(lineWidth: 3.0, spacing: 5.0, lineColor: .gray, backgroundColor: .darkGray)
```    

You can also set a delegate:

```swift
choiceView.id = "13"
choiceView.delegate = self
```

```swift
func onViewStateChange(checked: Bool, id: String?) {
    // Do something...
}
```

__OR__ a closure:

```swift
choiceView.id = "13"
choiceView.clicked = { [weak self] checked, id in
    // Do something...
}
```

Note: If you don't set an id, the callback will return the view's text as and id. if the view is image-only, it will return `nil`

#### Special thanks to [Efrat Silberhaft](https://www.behance.net/efratbarzilai) for the UX/UI design!

### Enjoy!

[default0]: https://github.com/avivbenshabat/ABChoiceView/blob/master/DemoImages/demo00.png "Default ChoiceView"
[default1]: https://github.com/avivbenshabat/ABChoiceView/blob/master/DemoImages/demo01.png "Default ChoiceView"
[selected0]: https://github.com/avivbenshabat/ABChoiceView/blob/master/DemoImages/demo02.png "Selected (default)"
[selected1]: https://github.com/avivbenshabat/ABChoiceView/blob/master/DemoImages/demo03.png "Selected with different check icon"
[selected2]: https://github.com/avivbenshabat/ABChoiceView/blob/master/DemoImages/demo04.png "Selected with mask"
[noImage]: https://github.com/avivbenshabat/ABChoiceView/blob/master/DemoImages/demo05.png "No image, only text"
[noText]: https://github.com/avivbenshabat/ABChoiceView/blob/master/DemoImages/demo06.png "No text, only image"
[small]: https://github.com/avivbenshabat/ABChoiceView/blob/master/DemoImages/demo07.png "Small"