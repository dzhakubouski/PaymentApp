//
//  PaymentCardCollectionViewCellController.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import UIKit

final class PaymentCardCollectionViewCellController: AbstractCollectionViewCellController {
    
    override init() {
        super.init()
        
        sectionItems = [Wallet(totalAmount: 2500,
                               currency: .usd)]
    }
    
    override class func registerCell(on collectionView: UICollectionView) {
        collectionView.register(PaymentCardCollectionViewCell.self,
                                forCellWithReuseIdentifier: PaymentCardCollectionViewCell.reusableIdentifier)
    }
    
    override func cellForItem(in collectionView: UICollectionView,
                              atIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        guard let paymentCardCell = collectionView.dequeueReusableCell(withReuseIdentifier: PaymentCardCollectionViewCell.reusableIdentifier,
                                                                       for: indexPath) as? PaymentCardCollectionViewCell,
              let wallet = sectionItems[indexPath.item] as? Wallet
        else { return UICollectionViewCell() }
        
        paymentCardCell.configure(with: wallet)
        
        return paymentCardCell
    }
    
    func update(wallet: Wallet) {
        sectionItems.removeAll()
        sectionItems.append(wallet)
    }
}
