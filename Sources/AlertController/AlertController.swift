//
//  AlertController.swift
//
//
//  Created by Kristóf Kálai on 2023. 05. 28..
//

import Combine
import UIKit

open class AlertController: ViewController {
    private let alertController = CurrentValueSubject<UIAlertController?, Never>(nil)
    private var cancellables = Set<AnyCancellable>()

    private var _modalPresentationStyle: UIModalPresentationStyle = .overFullScreen
    public override var modalPresentationStyle: UIModalPresentationStyle {
        get {
            _modalPresentationStyle
        }
        set {
            _modalPresentationStyle = newValue
        }
    }

    public var showWithAnimation = true
    public var hidePreviousAlertControllerWithAnimation = true
}

extension AlertController {
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        alertController
            .compactMap { $0 }
            .sink { [unowned self] in
                presentedViewController?.dismiss(animated: hidePreviousAlertControllerWithAnimation)
                present($0, animated: showWithAnimation)
            }
            .store(in: &cancellables)
    }
}

extension AlertController {
    public func set(alertController: UIAlertController) {
        self.alertController.send(alertController)
    }

    public func show(on viewController: UIViewController) {
        viewController.present(self, animated: false)
    }

    public func close() {
        dismiss(animated: false)
    }
}
