//
//  ViewController.swift
//  LockWidget
//
//  Created by Ginder Singh on 2022-10-08.
//

import Foundation
import UIKit
import WidgetKit
class ViewController: UIViewController, UITextFieldDelegate {
    // One of the way to share data between host app and its extentions
    // https://developer.apple.com/documentation/xcode/configuring-app-groups
    let userDefaults = UserDefaults(suiteName: "group.io.ginder")
    
    @IBOutlet weak var mainTextField: UITextField!
    
    @IBAction func onMainButtonClick(_ sender: Any) {
        guard let text = mainTextField.text else { return }
        // Save value to shared user defaults
        userDefaults?.set(text, forKey: "saved_item")
        // Reload widget
        WidgetCenter.shared.reloadAllTimelines()
        // Show alert
        let alert = UIAlertController(title: "", message: "\(text) added successfully.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up UI and its constraints.
        mainTextField.delegate = self
        // Load last saved value in to the input field.
        guard let lastSavedItem = userDefaults?.value(forKey: "saved_item") as? String else {
            return
        }
        mainTextField.text = lastSavedItem
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        mainTextField.resignFirstResponder()
        return true
    }
}
