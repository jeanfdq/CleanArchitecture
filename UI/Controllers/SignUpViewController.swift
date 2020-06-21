//
//  SignUpViewController.swift
//  UI
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import UIKit
import Presentation

public class SignUpViewController: UIViewController {

    //MARK: - Attributes
   public var signUp: ((SignUpViewModel)->Void)?
    public var singUpViewModel:SignUpViewModel?
    
    lazy var stackField:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameTextField, emailTextField, passwordTextField, passwordCfmTextField,btnAddAccount])
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.spacing = 10
        return stack
    }()
    
    lazy var nameTextField:UITextField = {
        let txf = UITextField()
        txf.placeholder = "Nome: "
        txf.makeConerRadius(corner: 8)
        txf.makeBorder(borderWidth: 0.5, color: .lightGray)
        txf.backgroundColor = .white
        return txf
    }()
    
    let emailTextField:UITextField = {
        let txf = UITextField()
        txf.placeholder = "E-mail: "
        txf.makeConerRadius(corner: 8)
        txf.makeBorder(borderWidth: 0.5, color: .lightGray)
        txf.backgroundColor = .white
        txf.keyboardType = .emailAddress
        return txf
    }()
    
    let passwordTextField:UITextField = {
        let txf = UITextField()
        txf.placeholder = "Senha: "
        txf.makeConerRadius(corner: 8)
        txf.makeBorder(borderWidth: 0.5, color: .lightGray)
        txf.backgroundColor = .white
        txf.keyboardType = .numberPad
        txf.isSecureTextEntry = true
        return txf
    }()
    
    let passwordCfmTextField:UITextField = {
        let txf = UITextField()
        txf.placeholder = "Confirme sua senha : "
        txf.makeConerRadius(corner: 8)
        txf.makeBorder(borderWidth: 0.5, color: .lightGray)
        txf.backgroundColor = .white
        txf.keyboardType = .numberPad
        txf.isSecureTextEntry = true
        return txf
    }()
    
    let loading:UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(style: .medium)
        loading.color = .blue
        loading.hidesWhenStopped = true
        return loading
    }()
    
    lazy var btnAddAccount:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Salvar", for: .normal)
        btn.backgroundColor = .blue
        btn.frame.size = .init(width: view.frame.width * 0.5, height: 55)
        btn.addTarget(self, action: #selector(self.addAccount), for: .touchUpInside)
        return btn
    }()
    
    
    //MARK: - Life Cycles
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        inputUI()
        
    }

    //MARK: - Functions
    
    fileprivate func setupView() {
        self.view.backgroundColor = .systemBackground
        self.dismissKeyboard()
    }
    
    fileprivate func inputUI() {
        view.addSubview(stackField)
        stackField.applyCenterIntoSuperView()
        view.addSubview(loading)
        loading.applyCenterIntoSuperView()
    }
    
    @objc private func addAccount(){
        
        singUpViewModel = SignUpViewModel(name:nameTextField.text, email:emailTextField.text, password:passwordTextField.text, passwordConfirmation:passwordCfmTextField.text)
        
        signUp?(singUpViewModel!)
    }
}

extension SignUpViewController:LoadingView {
    public func display(loadingViewModel: LoadingViewModel) {
        
        //Desabilita a interacao na tela enquanto o loading esta sendo executado
        self.view.isUserInteractionEnabled = !loadingViewModel.isLoading
        
        if loadingViewModel.isLoading {
            loading.startAnimating()
        }else{
            loading.stopAnimating()
        }
        
    }
    
}

extension SignUpViewController:AlertView {
    
    public func showMessage(viewModel: AlertViewModel) {
        self.showAlertSingle(title: viewModel.title, message: viewModel.message)
    }
    
}

//extension SignUpViewController:EmailValidator {
//    
//    public func isValid(email: String) -> Bool {
//        return email.isEmailValid()
//    }
//    
//    
//}
