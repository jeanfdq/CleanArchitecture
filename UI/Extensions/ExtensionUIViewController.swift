//
//  ExtensionUIViewController.swift
//  UI
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlertSingle(title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let btnOK = UIAlertAction(title: "OK", style: .default)
        alert.addAction(btnOK)
        self.present(alert, animated: true)
        
    }
    
    func dismissKeyboard(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        gesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc fileprivate func hideKeyboard() {
        self.view.endEditing(true)
    }
    
}
