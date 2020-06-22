//
//  WelcomeRouter.swift
//  UI
//
//  Created by Jean Paull on 21/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//


public final class WelcomeRouter {
    
    private let navigation:NavigationController
    private let loginFactory: (() -> LoginViewController)
    private let signupFactory: (() -> SignUpViewController)
    
    
    //Aqui passamos uma function e nao a instacia do COntroller porque com o objeto instanciado o app vai ficar com os dados em cache
    public init(navigation: NavigationController, loginFactory:@escaping() -> LoginViewController, signupFactory:@escaping() -> SignUpViewController) {
        
        self.navigation     = navigation
        self.loginFactory   = loginFactory
        self.signupFactory  = signupFactory
    }
    
    public func goToLogin(){
        navigation.pushViewController(loginFactory(), animated: false)
    }
    
    public func goToSingUp(){
        navigation.pushViewController(signupFactory(), animated: false)
    }
    
    
}


