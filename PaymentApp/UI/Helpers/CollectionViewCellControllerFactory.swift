//
//  CollectionViewCellControllerFactory.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import UIKit

final class CollectionViewCellControllerFactory {
    
    //MARK: - Public Methods
    func registerCells(in collectionView: UICollectionView) {
        PaymentCardCollectionViewCellController.registerCell(on: collectionView)
        ServicesCollectionViewCellController.registerCell(on: collectionView)
    }
    
    func cellControllers() -> [AbstractCollectionViewCellController] {
        return PaymentSection.allCases.map { section in
            switch section {
                
            case .paymentCard: return PaymentCardCollectionViewCellController()
                
            case .services: return ServicesCollectionViewCellController() 
                
            }
        }
    }
}
