//
//  ReusableView.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import Foundation

protocol ReusableView: AnyObject {
    static var reusableIdentifier: String { get }
}

extension ReusableView {
    
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
