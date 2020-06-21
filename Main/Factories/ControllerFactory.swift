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
import Data
import Infra
import Domain

class ControllerFactory {
    static func makeSignUp(addAccount: AddAccount) -> SignUpViewController {
    
        let controller = SignUpViewController()
        let presenter = SingUpPresenter(alertView: controller, emailValidator: controller, addAccount: addAccount, loadingView: controller)
        controller.signUp = presenter.singUp
        return controller
    }
}
