//
//  ViewController+UI.swift
//  LockWidget
//
//  Created by Ginder Singh on 2022-10-08.
//
import Foundation
import UIKit
extension ViewController {
    
    func addViews() {
        background = UIView()
        background.backgroundColor = UIColor.red
        view.addSubview(background)
        
        textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = 4
        let paddingView = UIView(frame: CGRectMake(8, 8, 8, 8))
        textField.leftViewMode = .always
        textField.leftView = paddingView
        view.addSubview(textField)
        
        button = UIButton()
        button.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
        button.backgroundColor = UIColor.clear
        button.layer.borderWidth = 2
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 24
        view.addSubview(button)
    }
    
    func addConstraints() {
        background.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints([
            NSLayoutConstraint(item: background!, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: background!, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item:background!, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item:background!, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0)
        ])
        self.view.addConstraints([
            NSLayoutConstraint(item: textField!, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: textField!, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 50),
            NSLayoutConstraint(item: textField!, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: -50),
            NSLayoutConstraint(item: textField!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 50)
        ])
        self.view.addConstraints([
            NSLayoutConstraint(item: button!, attribute: .top, relatedBy: .equal, toItem: textField, attribute: .bottom, multiplier: 1.0, constant: 50),
            NSLayoutConstraint(item: button!, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 50),
            NSLayoutConstraint(item: button!, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: -50),
            NSLayoutConstraint(item: button!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 50)
        ])
    }
}
