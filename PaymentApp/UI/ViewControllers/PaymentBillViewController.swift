//
//  PaymentBillViewController.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import Foundation
import UIKit

final class PaymentBillViewController: UIViewController {
    
    //MARK: - UI Elements
    private lazy var paymentBillBackgroundView: UIView = {
        let paymentBillBackgroundView: UIView = UIView()
        paymentBillBackgroundView.backgroundColor = .white
        
        return paymentBillBackgroundView
    }()
    
    private lazy var paymentBillTitleLabel: UILabel = {
        let paymentBillTitleLabel: UILabel = UILabel()
        paymentBillTitleLabel.textColor = .black
        paymentBillTitleLabel.font = .systemFont(ofSize: 27, weight: .bold)
        paymentBillTitleLabel.text = Constants.StaticLabelTitles.paymentCompleted
        paymentBillTitleLabel.numberOfLines = .zero
        paymentBillTitleLabel.textAlignment = .center
        
        return paymentBillTitleLabel
        
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let arrangedSubviews: [UIView] = [serviceTitleLabel, servicePayedPriceLabel, dateLabel]
        let stackView: UIStackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        
        return stackView
    }()
    
    private lazy var serviceTitleLabel: UILabel = {
        let serviceTitleLabel: UILabel = UILabel()
        serviceTitleLabel.textColor = .black
        serviceTitleLabel.font = .systemFont(ofSize: 20, weight: .medium)
        
        return serviceTitleLabel
    }()
    
    private lazy var servicePayedPriceLabel: UILabel = {
        let servicePayedPriceLabel: UILabel = UILabel()
        servicePayedPriceLabel.textColor = .black
        servicePayedPriceLabel.font = .systemFont(ofSize: 20, weight: .medium)
        
        return servicePayedPriceLabel
    }()
    
    private lazy var dateLabel: UILabel = {
        let dateLabel: UILabel = UILabel()
        dateLabel.textColor = .black
        dateLabel.font = .systemFont(ofSize: 20, weight: .medium)
        
        return dateLabel
    }()
    
    //MARK: - Private Properties
    private let service: Service
    
    //MARK: - Initializers
    init(service: Service) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(coder.debugDescription)
    }
    
    //MARK: - Life Cycle Methods 
    override func viewDidLoad() {
        super.viewDidLoad()
        createViewHierachy()
        layout()
        view.applyBlur()
        setupBill()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.dismiss(animated: true)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        paymentBillBackgroundView.roundCorners(radius: 10)
    }
    
    //MARK: - Private Methods
    private func setupBill() {
        serviceTitleLabel.text = "Name: \(service.getTitle())"
        servicePayedPriceLabel.text = "Price: \(service.getServicePrice())"
        dateLabel.text = "Current date:"
    }
}

extension PaymentBillViewController: Layout {
    
    func createViewHierachy() {
        view.addSubview(paymentBillBackgroundView)
        paymentBillBackgroundView.addSubviews(
            paymentBillTitleLabel,
            verticalStackView
        )
    }
    
    func layout() {
        paymentBillBackgroundView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(view.frame.width / 1.5)
            $0.height.equalTo(view.frame.height / 3)
        }
        
        paymentBillTitleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(20)
        }
        
        verticalStackView.snp.makeConstraints {
            $0.top.equalTo(paymentBillTitleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}
