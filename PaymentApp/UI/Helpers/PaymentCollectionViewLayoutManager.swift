//
//  PaymentCollectionViewLayoutManager.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import UIKit

final class PaymentCollectionViewLayoutManager: CollectionViewLayoutManaging, SectionProviding {
    
    var sections: [PaymentSection] {
        return PaymentSection.allCases
    }
    
    func createLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            
            switch self.sections[sectionIndex] {
                
            case .paymentCard: return self.createPaymentCardSection()
                
            case .services: return self.createServicesSection()
                
            }
        }
    }
    
    //MARK: - Private Methods
    private func createLayoutSection(
        group: NSCollectionLayoutGroup,
        behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
        interGroupSpacing: CGFloat,
        supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem],
        contentInserts: Bool
    ) -> NSCollectionLayoutSection {
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItems
        section.supplementariesFollowContentInsets = contentInserts
        
        return section
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(30)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
    
    private func createPaymentCardSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 10,
                                          supplementaryItems: [supplementaryHeaderItem()],
                                          contentInserts: false)
        section.contentInsets = .init(top: 0,
                                      leading: 20,
                                      bottom: 24,
                                      trailing: 20)
        
        return section
    }
    
    private func createServicesSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0/3),
                                                            heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = .init(top: .zero,
                                   leading: .zero,
                                   bottom: 8,
                                   trailing: 8)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                         heightDimension: .estimated(150)),
                                                     subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]

        section.contentInsets = .init(top: 0,
                                      leading: 20,
                                      bottom: 0,
                                      trailing: 20 - 8)
        
        return section
    }
}
