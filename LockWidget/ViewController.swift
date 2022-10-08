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
    // One of the way to share data between host app and its extentions
    // https://developer.apple.com/documentation/xcode/configuring-app-groups
    let userDefaults = UserDefaults(suiteName: "group.io.ginder")
    
    var background: UIView!
    var textField: UITextField!
    var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up UI and its constraints.
        addViews()
        addConstraints()
        // Load last saved value in to the input field.
        guard let lastSavedItem = userDefaults?.value(forKey: "saved_item") as? String else {
            return
        }
        textField.text = lastSavedItem
    }
    
    @objc func onButtonClick() {
        guard let text = textField.text else { return }
        // Save value to shared user defaults
        userDefaults?.set(text, forKey: "saved_item")
        // Reload widget
        WidgetCenter.shared.reloadAllTimelines()
        // Show alert
        let alert = UIAlertController(title: "", message: "\(text) added successfully.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
