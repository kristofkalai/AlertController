//
//  ViewController.swift
//  Example
//
//  Created by Kristóf Kálai on 2023. 05. 28..
//

import UIKit
import AlertController

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow.withAlphaComponent(0.33)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            CustomAlertController().show(on: self)
        }
    }
}

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
