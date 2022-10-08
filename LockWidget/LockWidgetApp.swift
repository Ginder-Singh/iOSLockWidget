//
//  LockWidgetApp.swift
//  LockWidget
//
//  Created by Ginder Singh on 2022-10-08.
//
import Foundation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setApplicationWindow()
        return true
    }
    
    private func setApplicationWindow() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = self.window else { return }
        window.backgroundColor = UIColor.black
        let mainViewController = ViewController()
        let viewController = UINavigationController(rootViewController: mainViewController)
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.window?.rootViewController = viewController
        }, completion: nil)
        self.window?.makeKeyAndVisible()
    }
}
