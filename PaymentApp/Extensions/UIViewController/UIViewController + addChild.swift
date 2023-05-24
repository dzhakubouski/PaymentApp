//
//  UIViewController + addChild.swift
//  PaymentApp
//
//  Created by Admin on 23.05.23.
//

import UIKit

extension UIViewController {
    
    ///Add child view controller to its parent 
    func add(child: UIViewController,
             frame: CGRect? = nil) {
        addChild(child)
        
        if let frame = frame {
            child.view.frame = frame
        }
        
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
}
