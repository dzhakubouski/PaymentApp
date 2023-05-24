//
//  roundCorners.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import UIKit

extension UIView {
    
    ///Round view's corners with specified radius
    func roundCorners(radius: CGFloat?) {
        clipsToBounds = true 
        layer.cornerRadius = (radius == nil ? bounds.height / 2 : radius)!
    }
}
