//
//  PaymentCardCollectionViewCell.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import UIKit

final class PaymentCardCollectionViewCell: UICollectionViewCell{
    
    //MARK: - UI Elements
    private lazy var paymentCardImageView: UIImageView = {
        let paymentCardImageView: UIImageView = UIImageView()
        paymentCardImageView.contentMode = .scaleToFill
        paymentCardImageView.image = .renderImage(forName: Constants.ImageNames.paymentCardImage)
        
        return paymentCardImageView
    }()
    
    private lazy var totalAmountLabel: UILabel = {
        let totalAmountLabel: UILabel = UILabel()
        totalAmountLabel.font = .systemFont(ofSize: 35,
                                            weight: .heavy)
        totalAmountLabel.textColor = .white
        
        return totalAmountLabel
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.roundCorners(radius: 12)
    }
    
    //MARK: - Private Methods
    private func configure() {
        isUserInteractionEnabled = false 
        createViewHierachy()
        layout()
    }
    
    //MARK: - Public Methods
    func update(wallet: Wallet) {
        let newAmount = "\(wallet.getTotalAmount()) \(wallet.getCurrency().symbol)"
        totalAmountLabel.text = newAmount
    }
}

//MARK: - Extensions
extension PaymentCardCollectionViewCell: Layout {
    
    func createViewHierachy() {
        contentView.addSubview(paymentCardImageView)
        paymentCardImageView.addSubview(totalAmountLabel)
    }
    
    func layout() {
        paymentCardImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        totalAmountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.leading.equalToSuperview().inset(25)
        }
    }
}

extension PaymentCardCollectionViewCell: CellConfigurable {
    
    func configure(with data: Wallet) {
        let totalAmount: String = "\(data.getTotalAmount()) \(data.getCurrency().symbol)"
        totalAmountLabel.text = totalAmount
    }
}
