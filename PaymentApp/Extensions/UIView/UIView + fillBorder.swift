//
//  UIView + fillBorder.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import UIKit

extension UIView {
    
    func fillBorder(color: UIColor,
                    borderWidth: CGFloat) {
        layer.borderWidth = borderWidth
        layer.borderColor = color.cgColor
    }
}
