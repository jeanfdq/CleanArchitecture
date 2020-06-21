//
//  MainQueueDecorator.swift
//  Main
//
//  Created by Jean Paull on 21/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

//Design Pattern Decorator (Adiciona comportamento do Metodo sem modificar o metodo)
public final class MainQueueDecorator<T> {
    
    public let instance:T
    
    public init(_ instance:T) {
        self.instance = instance
    }
    
    func dispatch(completion:@escaping()->Void){
        
        //Se eu estiver já na Main Thread eu nao uso o Dispatch
        if Thread.isMainThread {
            completion()
        }else{
            DispatchQueue.main.async {
                completion()
            }
        }

    }
}
