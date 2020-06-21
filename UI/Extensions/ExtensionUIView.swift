//
//  ExtensionUIView.swift
//  UI
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import UIKit

extension UIView {
    func makeConerRadius(corner:CGFloat){
        layer.cornerRadius  = corner
        layer.masksToBounds = true
    }
    
    func makeBorder(borderWidth:CGFloat, color:UIColor){
        layer.borderWidth = borderWidth
        layer.borderColor = color.cgColor
    }
    
    func applyViewIntoSuperView(){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        leadingAnchor.constraint(equalTo: superview?.leadingAnchor ?? NSLayoutXAxisAnchor()).isActive = true
        topAnchor.constraint(equalTo: superview?.topAnchor ?? NSLayoutYAxisAnchor()).isActive = true
        trailingAnchor.constraint(equalTo: superview?.trailingAnchor ?? NSLayoutXAxisAnchor()).isActive = true
        bottomAnchor.constraint(equalTo: superview?.bottomAnchor ?? NSLayoutYAxisAnchor()).isActive = true
        
    }
    
    func applyViewConstraints(_ leading: NSLayoutXAxisAnchor?, _ top:NSLayoutYAxisAnchor?, _ trailing:NSLayoutXAxisAnchor?, _ bottom:NSLayoutYAxisAnchor?, size:CGSize = .zero, value:UIEdgeInsets = .zero ){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: value.left).isActive = true
        }
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: value.top).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: value.right).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: value.bottom).isActive = true
        }
        
        if size.width != .zero {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != .zero {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
    
    func applyCenterIntoSuperView(size:CGSize = .zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let centerYSuperView = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: centerYSuperView).isActive = true
        }
        
        if let centerXSuperView = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: centerXSuperView).isActive = true
        }
        
        if size.height != .zero {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
        if size.width != .zero {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
    }
    
    func applyJustSize(size:CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if size.width != .zero {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != .zero {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
}
