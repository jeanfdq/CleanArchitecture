//
//  NavigationController.swift
//  UI
//
//  Created by Jean Paull on 21/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import UIKit

public final class NavigationController: UINavigationController {
    
    private var currentVC:UIViewController?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        navigationBar.barTintColor          = .blue
        navigationBar.tintColor             = .white
        navigationBar.titleTextAttributes   = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBar.isTranslucent         = false
        navigationBar.barStyle              = .black
        
    }

    public convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    public func setRootController(_ viewController:UIViewController){
        setViewControllers([viewController], animated: true)
        currentVC = viewController
        removeTextBackButton()
    }
    
    private func removeTextBackButton(){
        currentVC?.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
    }

    
}
