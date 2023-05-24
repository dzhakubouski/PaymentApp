//
//  Currency.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import Foundation

enum Currency {
    case usd
    
    var symbol: Character {
        switch self {
            
        case .usd: return "$"
            
        }
    }
}
