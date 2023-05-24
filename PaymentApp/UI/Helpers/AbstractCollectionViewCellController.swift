//
//  AbstractCollectionViewCellController.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import UIKit

class AbstractCollectionViewCellController: CollectionViewCellControllerProtocol {
    
    weak var cellEventHandler: CellEventHandler? = nil 
    
    var sectionItems: [PaymentInterface] = []
    
    class func registerCell(on collectionView: UICollectionView) { }
    
    func cellForItem(in collectionView: UICollectionView,
                     atIndexPath indexPath: IndexPath) -> UICollectionViewCell { return UICollectionViewCell() }
    
    func didSelectCell(in collectionView: UICollectionView,
                       atIndexPath indexPath: IndexPath) { }
    
}
