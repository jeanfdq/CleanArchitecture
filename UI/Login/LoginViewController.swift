//
//  LoginViewController.swift
//  UI
//
//  Created by Jean Paull on 21/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import UIKit
import Presentation

public class LoginViewController: UIViewController {

    public var login:((LoginRequestViewModel)->Void)?
    
    let emailTextField:UITextField = {
        let textF = UITextField()
        textF.makeConerRadius(corner: 10)
        textF.makeBorder(borderWidth: 0.6, color: .lightGray)
        textF.placeholder = "E-mail:"
        textF.keyboardType = .emailAddress
        return textF
    }()
    
    let passwordTextField:UITextField = {
        let textF = UITextField()
        textF.makeConerRadius(corner: 10)
        textF.makeBorder(borderWidth: 0.6, color: .lightGray)
        textF.isSecureTextEntry = true
        textF.keyboardType = .numberPad
        textF.placeholder = "Senha:"
        return textF
    }()
    
    lazy var btnLogin:UIButton = {
        let btn = UIButton(type: .custom)
        btn.makeConerRadius(corner: 10)
        btn.makeBorder(borderWidth: 0.7, color: .lightGray)
        btn.backgroundColor = .white
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.lightGray, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(self.loginAccount), for: .touchUpInside)
        return btn
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupFieldsView()
        
    }
    
    fileprivate func setupView() {
        view.backgroundColor = .systemBackground
        
        dismissKeyboard()
    }
    
    fileprivate func setupFieldsView() {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, btnLogin])
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 10
        
        view.addSubview(stackView)
        stackView.applyCenterIntoSuperView(size: .init(width: view.frame.width * 0.7, height: 0))
    }
    
    //MARK: - Functions
    @objc fileprivate func loginAccount(){
        
        let viewModel = LoginRequestViewModel(email: emailTextField.text, password: passwordTextField.text)
        login?(viewModel)
    }
    

}

extension LoginViewController:AlertView {
    
    public func showMessage(viewModel: AlertViewModel) {
        self.showAlertSingle(title: viewModel.title, message: viewModel.message)
    }
    
}
