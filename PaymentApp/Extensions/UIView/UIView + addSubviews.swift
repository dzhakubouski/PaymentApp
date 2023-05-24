//
//  UIView + addSubviews.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import UIKit

extension UIView {
    
    ///Add multiple subviews to parent view 
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach( {addSubview($0)} )
    }
}
