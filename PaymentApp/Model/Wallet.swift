//
//  Wallet.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import Foundation

struct Wallet: PaymentInterface {
    
    private let totalAmount: Double
    private let currency: Currency
    
    init(totalAmount: Double,
         currency: Currency) {
        self.totalAmount = totalAmount
        self.currency = currency
    }
    
    func getTotalAmount() -> Double {
        return totalAmount
    }
    
    func getCurrency() -> Currency {
        return currency
    }
}
