//
//  CollectionViewCellControllerProtocol.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import Foundation
import UIKit

protocol CollectionViewCellControllerProtocol: AnyObject {
    
    var cellEventHandler: CellEventHandler? { get } 
    
    var sectionItems: [PaymentInterface] { get set }
    
    static func registerCell(on collectionView: UICollectionView)
    
    func cellForItem(in collectionView: UICollectionView,
                     atIndexPath indexPath: IndexPath) -> UICollectionViewCell
    
    func didSelectCell(in collectionView: UICollectionView,
                       atIndexPath indexPath: IndexPath)
}
