//
//  ViewController.swift
//  LockWidget
//
//  Created by Ginder Singh on 2022-10-08.
//

import Foundation
import UIKit
import WidgetKit
class ViewController: UIViewController {
    let userDefaults = UserDefaults(suiteName: "group.io.ginder")
    var background: UIView!
    var textField: UITextField!
    var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        addConstraints()
        guard let lastSavedItem = userDefaults?.value(forKey: "saved_item") as? String else {
            return
        }
        textField.text = lastSavedItem
    }
    
    @objc func onButtonClick() {
        guard let text = textField.text else { return }
        userDefaults?.set(text, forKey: "saved_item")
        WidgetCenter.shared.reloadAllTimelines()
        let alert = UIAlertController(title: "", message: "\(text) added successfully.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
