//
//  SectionProviding.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import Foundation

protocol SectionProviding {
    associatedtype SectionType
    
    var sections: [SectionType] { get }
}
