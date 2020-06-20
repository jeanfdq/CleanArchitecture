//
//  AlertView.swift
//  Presentation
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

public protocol AlertView {
    func showMessage(viewModel: AlertViewModel)
}


public struct AlertViewModel: Equatable {
    public let title:String
    public let message:String
    
    init(title:String, message:String) {
        self.title      = title
        self.message    = message
    }
    
}
