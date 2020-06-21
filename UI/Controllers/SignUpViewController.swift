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
    
    let nameTextField:UITextField = {
        let txf = UITextField()
        txf.placeholder = "Nome: "
        return txf
    }()
    
    let emailTextField:UITextField = {
        let txf = UITextField()
        txf.placeholder = "E-mail: "
        return txf
    }()
    
    let passwordTextField:UITextField = {
        let txf = UITextField()
        txf.placeholder = "Senha: "
        return txf
    }()
    
    let passwordCfmTextField:UITextField = {
        let txf = UITextField()
        txf.placeholder = "Confirme sua senha : "
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
        btn.addTarget(self, action: #selector(self.addAccount), for: .touchUpInside)
        return btn
    }()
    
    
    //MARK: - Life Cycles
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
    
    //MARK: - Functions
    @objc private func addAccount(){
        
        signUp?(SignUpViewModel(name:nil, email:nil, password:nil, passwordConfirmation:nil))
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

extension SignUpViewController:EmailValidator {
    
    public func isValid(email: String) -> Bool {
        return email.isEmailValid()
    }
    
    
}
