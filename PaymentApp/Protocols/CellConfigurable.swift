//
//  CellConfigurable.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import Foundation

protocol CellConfigurable {
    associatedtype DataType
    
    func configure(with data: DataType)
}
