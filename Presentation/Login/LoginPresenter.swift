//
//  LoginPresenter.swift
//  Presentation
//
//  Created by Jean Paull on 21/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation
import Domain

public final class LoginPresenter {
    
    let authenticationProtocol:AuthenticationProtocol
    let alertView:AlertView
    
    public init(authenticationProtocol:AuthenticationProtocol, alertView:AlertView) {
        self.authenticationProtocol = authenticationProtocol
        self.alertView  = alertView
    }
    
    public func login(viewModel:LoginRequestViewModel) {
        
        let message = validate(viewModel)
        if message.isEmpty {
            
            guard let authenticationModel = viewModel.toAuthenticationModel() else {return}
            
            authenticationProtocol.auth(authenticationModel: authenticationModel){ [weak self] result in
                
                //se caso executar deinit nem é preciso executar as intrucoes abaixo
                guard let self = self else {return}
                
                DispatchQueue.main.async {
                    
                    switch result {
                    case .success(let model):
                        self.alertView.showMessage(viewModel: AlertViewModel(title: "Sucesso", message: "Bem-vindo \(model.name)"))
                        
                    case .failure: self.alertView.showMessage(viewModel: AlertViewModel(title: "Erro", message: "Falaha no Login"))
                    }
                    
                }
                
            }
            
        }else{
            alertView.showMessage(viewModel: AlertViewModel(title: "Erro", message: message))
        }
        
        
    }
    
    private func validate(_ viewModel: LoginRequestViewModel) -> String {
        
        var message = ""
        
        if viewModel.email!.isEmpty || viewModel.email == nil {
            message = "Informe o Login de acesso."
        }else if viewModel.password!.isEmpty || viewModel.password == nil{
            message = "Informe sua senha de acesso."
        }
        
        return message
    }
    
}
