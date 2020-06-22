//
//  SignUpFactory.swift
//  Main
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import UIKit
import UI
import Presentation
import Domain

//class ControllerFactory {
//    static func makeSignUp(addAccount: AddAccount) -> SignUpViewController {
//    
//        let controller = SignUpViewController()
//        let emailValid = UseCases.makeRemoteEmailValidator(email: controller.singUpViewModel?.email)
//        let presenter = SingUpPresenter(alertView: controller, emailValidator: emailValid, addAccount: addAccount, loadingView: controller)
//        
//        controller.signUp = presenter.singUp
//        return controller
//    }
//}

func MakeLogin(authenticationProtocol:AuthenticationProtocol) -> LoginViewController {
    let controller = LoginViewController()
    let presenter = LoginPresenter(authenticationProtocol: authenticationProtocol, alertView: controller)
    controller.login = presenter.login
    
    return controller
}

func MakeSignUp(addAccount: AddAccountProtocol) -> SignUpViewController {

    let controller = SignUpViewController()
    let emailValid = MakeRemoteEmailValidator(email: controller.singUpViewModel?.email)
    let presenter = SingUpPresenter(alertView: controller, emailValidator: emailValid, addAccount: addAccount, loadingView: controller)
    
    controller.signUp = presenter.singUp
    return controller
}

func MakeWelcome(_ navigation:NavigationController) -> WelcomeViewController {
    
    let singUpFactory: () -> SignUpViewController = {
        let remoteAddAccount = MakeRemoteAddAccount()
        return MakeSignUp(addAccount: remoteAddAccount)
    }
    
    let loginFactory: () -> LoginViewController = {
        return MakeLogin(authenticationProtocol: MakeRemoteAuthentication())
    }
    
    let welcomeVC =  WelcomeViewController()
    let welcomeRouter = WelcomeRouter(navigation: navigation, loginFactory: loginFactory, signupFactory: singUpFactory)
    
    welcomeVC.welcomeLogin  = welcomeRouter.goToLogin
    welcomeVC.welcomeSingUp = welcomeRouter.goToSingUp
    
    return welcomeVC
}
