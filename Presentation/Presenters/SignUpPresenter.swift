//
//  SignUpPresenter.swift
//  Presentation
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation
import Domain

public final class SingUpPresenter {
    
    private let alertView:AlertView
    private let emailValidator:EmailValidator
    private let addAccount:AddAccount
    private let loadingView:LoadingView
    
    public init(alertView:AlertView, emailValidator:EmailValidator, addAccount:AddAccount, loadingView:LoadingView) {
        self.alertView      = alertView
        self.emailValidator = emailValidator
        self.addAccount     = addAccount
        self.loadingView    = loadingView
    }
    
    public func singUp(viewModel:SignUpViewModel){
        
        loadingView.display(loadingViewModel: LoadingViewModel(isLoading: true))
        
        if let message = validate(viewModel: viewModel) {
            
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
            loadingView.display(loadingViewModel: LoadingViewModel(isLoading: false))
        }else {
            
            guard let addAccountModel = viewModel.toAddAccountModel() else {return}
            
            addAccount.add(addAccountModel: addAccountModel) { [weak self] result in
                
                switch result {
                    
                    case .failure: self?.alertView.showMessage(viewModel: AlertViewModel(title: "Erro", message: "Algo deu errado ao adicionar a conta."))
                    
                    case .success: self?.alertView.showMessage(viewModel: AlertViewModel(title: "Account", message: "Conta criada com sucesso."))
                    
                }
                
                self?.loadingView.display(loadingViewModel: LoadingViewModel(isLoading: false))
                
            }
        }
        
        
    }
    
    private func validate(viewModel:SignUpViewModel) -> String? {
        
        var message:String? = nil
        
        if viewModel.name == nil || viewModel.name!.isEmpty {
            message = "O campo nome deve ser obrigatório."
        }
        
        if viewModel.email == nil || viewModel.email!.isEmpty {
            message = "O campo e-mail deve ser obrigatório."
        }else if !emailValidator.isValid(email: viewModel.email!) {
            message = "E-mail imformado inválido."
        }
        
        if viewModel.password == nil || viewModel.password!.isEmpty {
            message = "O campo password deve ser obrigatório."
        }
        
        if viewModel.passwordConfirmation == nil || viewModel.passwordConfirmation!.isEmpty {
            message = "O campo de confirmação da senha deve ser obrigatório."
        }
        
        if viewModel.password != nil && !viewModel.password!.isEmpty && viewModel.passwordConfirmation != nil && !viewModel.passwordConfirmation!.isEmpty && viewModel.password !=  viewModel.passwordConfirmation {
            message = "Senha de confirmação não confere com a senha informada.."
        }
        
        return message
        
    }
    
}
