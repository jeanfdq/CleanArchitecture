//
//  SignUpViewController.swift
//  UI
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import UIKit
import Presentation

class SignUpViewController: UIViewController {

    let loading:UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(style: .medium)
        loading.color = .blue
        loading.hidesWhenStopped = true
        return loading
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

extension SignUpViewController:LoadingView {
    func display(loadingViewModel: LoadingViewModel) {
        
        if loadingViewModel.isLoading {
            loading.startAnimating()
        }else{
            loading.stopAnimating()
        }
        
    }
    
}
