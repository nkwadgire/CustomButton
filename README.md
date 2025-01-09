# SwiftUIButton

The purpose of the library is to simplify the creation of SwiftUI components through a single method call by providing the necessary parameters.

## Example

![Example](./example.png?raw=true)
```swift
let automaticButton: SwiftUIButton.ButtonType<PlainButtonStyle, Color> = .automaticButton(title: "Automatic Button", buttonWidth: 200.0, buttonHeight: 50.0, font: .title3, fontWidth: .standard, foregroundStyle: .green, padding: 5) {
            automaticButtonAction()
}
        
VStack(spacing: 5) {
    SwiftUIButton.createButton(for: SwiftUIButton.ButtonType<DefaultButtonStyle, Color>.plainButton(title: "Plain Button", action: {
        print("You clicked the Plain button.")
    }))
    SwiftUIButton.createButton(for: automaticButton)
}

func automaticButtonAction() {
    print("You clicked the Automatic button.")
}
```

## Installation
Requirements iOS 16.1+

### Cocoapods
Simply add the following line to your `Podfile`:
```ruby
pod 'SwiftUIButton'
``` 

## Usage

Import the SwiftUIButton package to your view:
```swift
import SwiftUIButton
```

Invoke the `createButton` method of the SwiftUIButton framework by passing a reference to the required button type. The button's UI can be customized by providing the necessary arguments when creating the button type object:
```swift
    SwiftUIButton.createButton(for: SwiftUIButton.ButtonType<DefaultButtonStyle, Color>.plainButton(title: "Plain Button", action: {
        print("You clicked the Plain button.")
    }))
```

You can create the button type separately and pass it as an argument when invoking the createButton method of the SwiftUIButton framework. 
The button click action can be defined either while creating the button type reference or in a separate function, which can then be called from the action block:
```swift
let plainButton: SwiftUIButton.ButtonType<PlainButtonStyle, Color> = .plainButton(title: "Plain Button", buttonWidth: 200.0, buttonHeight: 50.0, font: .title3, fontWidth: .standard, foregroundStyle: .green, padding: 5) {
            plainButtonAction()
}
SwiftUIButton.createButton(for: automaticButton)

func plainButtonAction() {
    print("You clicked the Plain button.")
}
```

### Types of buttons Supported

The SwiftUIButton framework supports below types of buttons
* Plain Button
* Automatic Button
* Bordered Button
* Bordered Prominant Button
* Borderless Button
* Image Button
* IconText Button
* TextIcon Button
* Icon Button
* Destructive Button
* Cancel Button

You need to create an object of the button type by passing the necessary arguments. All arguments are optional and can be used to customize the button's style. 
Once the button type is defined, invoke the `createButton` method from the SwiftUIButton framework, passing the button type reference to generate the custom button. 
The framework also provides an action callback method, allowing users to define actions as needed.


## Contribute
You can contribute to this project by assisting with [reported issues or feature requests](https://github.com/nkwadgire/SwiftUIButton/issues) and submitting a pull request.

## License
SwiftUIButton was originally developed by Nagraj Wadgire and is released under the [Apache License 2.0](LICENSE).
