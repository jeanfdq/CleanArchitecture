//
//  LoadingView.swift
//  Presentation
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

public protocol LoadingView {
    func display(loadingViewModel:LoadingViewModel)
}

public struct LoadingViewModel: Equatable {
    public let isLoading:Bool
    
    init(isLoading:Bool) {
        self.isLoading  = isLoading
    }
    
}
