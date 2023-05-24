//
//  Service.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import Foundation

struct Service: PaymentInterface {
    
    //MARK: - Private Properties
    private let id = UUID()
    private let title: String
    private let imagePath: String
    private let price: Double
    
    //MARK: - Initializers
    init(title: String,
         imagePath: String,
         price: Double) {
        self.title = title
        self.imagePath = imagePath
        self.price = price
    }
    
    //MARK: - Public Methods
    func getServicePrice() -> Double {
        return price
    }
    
    func getServiceIdentifier() -> String {
        return id.uuidString
    }
    
    func getTitle() -> String {
        return title
    }
    
    func getImagePath() -> String {
        return imagePath
    }
}
