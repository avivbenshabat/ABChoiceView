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
  pod 'ABChoiceView', '~> 1.0'
end
```

### Carthage

Add one of the following lines to your Cartfile depending on your Swift version:

```ruby
github "avivbenshabat/ABChoiceView"
```

## Usage



[default0]: ./DemoImages/demo00.png "Default ChoiceView"
[default1]: ./DemoImages/demo01.png "Default ChoiceView"
[selected0]: ./DemoImages/demo02.png "Selected (default)"
[selected1]: ./DemoImages/demo03.png "Selected with different check icon"
[selected2]: ./DemoImages/demo04.png "Selected with mask"
[noImage]: ./DemoImages/demo05.png "No image, only text"
[noText]: ./DemoImages/demo06.png "No text, only image"
[small]: ./DemoImages/demo07.png "Small"