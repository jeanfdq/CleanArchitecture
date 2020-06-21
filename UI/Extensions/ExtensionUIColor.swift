//
//  ExtensionUIColor.swift
//  UI
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import UIKit

extension UIColor {
    
    func toRGB(red: CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
}
