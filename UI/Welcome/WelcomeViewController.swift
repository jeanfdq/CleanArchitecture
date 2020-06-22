//
//  WelcomeViewController.swift
//  UI
//
//  Created by Jean Paull on 21/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import UIKit

public class WelcomeViewController: UIViewController {

    public var welcomeLogin: (()->Void)?
    public var welcomeSingUp:(()->Void)?
    
    lazy var btnLogin:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Login", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.setTitleColor(.lightGray, for: .normal)
        btn.makeConerRadius(corner: 10)
        btn.makeBorder(borderWidth: 0.7, color: .lightGray)
        btn.addTarget(self, action: #selector(self.login), for: .touchUpInside)
        return btn
    }()
    
    lazy var btnSignUp:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Sign-Up", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.setTitleColor(.lightGray, for: .normal)
        btn.makeConerRadius(corner: 10)
        btn.makeBorder(borderWidth: 0.7, color: .lightGray)
        btn.addTarget(self, action: #selector(self.signup), for: .touchUpInside)
        return btn
    }()
    
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupFieldsView()
        
    }

    fileprivate func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    fileprivate func setupFieldsView() {
        let stackView = UIStackView(arrangedSubviews: [btnLogin, btnSignUp])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        
        view.addSubview(stackView)
        stackView.applyCenterIntoSuperView(size: .init(width: view.frame.width * 0.7, height: 150))
    }
    
    @objc func login(){
        welcomeLogin?()
    }
    
    @objc func signup(){
        welcomeSingUp?()
    }
    
}
