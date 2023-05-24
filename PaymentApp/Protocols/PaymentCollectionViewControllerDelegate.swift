//
//  PaymentCollectionViewControllerDelegate.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import Foundation

protocol PaymentCollectionViewControllerDelegate: AnyObject {
    
    func payService(_ service: Service,
                    canProccedToPayment: Bool)
}
