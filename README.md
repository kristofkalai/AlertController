# AlertController
UIAlertController's subclass replacement! 🚨

## Setup

Add the following to `Package.swift`:

```swift
.package(url: "https://github.com/stateman92/AlertController", exact: .init(0, 0, 1))
```

[Or add the package in Xcode.](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)

## Usage

```swift
import UIKit
import AlertController

final class CustomAlertController: AlertController {
    override init() {
        super.init()
        set(alertController: getAlertController())
    }

    private func getAlertController() -> UIAlertController {
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        alertController.addAction(.init(title: "Close", style: .cancel, handler: { [weak self] _ in
            self?.close()
        }))
        return alertController
    }
}

// ...

CustomAlertController().show(on: self) // where self is a UIViewController
```

For details see the Example app.

## Example

<p style="text-align:center;"><img src="https://github.com/stateman92/AlertController/blob/main/Resources/screenshot.png?raw=true" width="50%" alt="Example"></p>
