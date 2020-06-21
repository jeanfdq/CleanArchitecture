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

class SignUpFactory {
    static func makeSignUpController() -> SignUpViewController {
        
        let controller = SignUpViewController()
        let url = URL(string: HttpUrls.urlAddAccount)!
        let alamofireAdapter = AlamofireAdapter()
        let remoteAddAccount = RemoteAddAccount(url: url, httpPostClient: alamofireAdapter)
        let presenter = SingUpPresenter(alertView: controller, emailValidator: controller, addAccount: remoteAddAccount, loadingView: controller)
        controller.signUp = presenter.singUp
        return controller
    }
}
