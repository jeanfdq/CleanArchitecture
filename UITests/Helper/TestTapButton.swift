//
//  TestTapButton.swift
//  UITests
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import UIKit

//Simula um TAP de um Botao

extension UIControl {
    
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
    
    func simulate(event: UIControl.Event){
        allTargets.forEach{ target in
            actions(forTarget: target, forControlEvent: event)?.forEach({ (action) in
                
                (target as NSObject).perform(Selector(action))
                
            })
        }
    }
    
}
