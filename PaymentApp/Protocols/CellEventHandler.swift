//
//  CellEventHandler.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import Foundation

protocol CellEventHandler: AnyObject {
    
    func eventDidHappen(_ event: Event,
                        sender: CollectionViewCellControllerProtocol)
}
