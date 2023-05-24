//
//  ServiceCollectionViewCell.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import UIKit

final class ServiceCollectionViewCell: UICollectionViewCell {
    
    //MARK: - UI Elements
    private lazy var serviceImageView: UIImageView = {
        let serviceImageView: UIImageView = UIImageView()
        serviceImageView.contentMode = .scaleAspectFit
        
        return serviceImageView
    }()
    
    private lazy var serviceDescriptionLabel: UILabel = {
        let serviceDescriptionLabel: UILabel = UILabel()
        serviceDescriptionLabel.font = .systemFont(ofSize: 17, weight: .regular)
        serviceDescriptionLabel.textColor = .black
        serviceDescriptionLabel.numberOfLines = .zero
        
        return serviceDescriptionLabel
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        createViewHierachy()
        layout()
        roundCorners(radius: 10)
        fillBorder(color: .black,
                   borderWidth: 1)
    }
}

//MARK: - Extensions
extension ServiceCollectionViewCell: Layout {
    
    func createViewHierachy() {
        contentView.addSubviews(
            serviceImageView,
            serviceDescriptionLabel
        )
    }
    
    func layout() {
        serviceImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(15)
            $0.height.width.equalTo(30)
        }
        
        serviceDescriptionLabel.snp.makeConstraints {
            $0.bottom.leading.equalToSuperview().inset(15)
            $0.trailing.lessThanOrEqualToSuperview()
        }
    }
}

extension ServiceCollectionViewCell: CellConfigurable {
    
    func configure(with data: Service) {
        serviceImageView.image = .renderImage(forName: data.getImagePath())
        serviceDescriptionLabel.text = data.getTitle()
    }
}
