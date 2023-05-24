//
//  ViewController.swift
//  PaymentApp
//
//  Created by Admin on 23.05.23.
//

import UIKit
import SnapKit

final class PaymentContainerViewController: UIViewController, ActivityIndicatorPresentable {
    //MARK: - UI Elements
    private lazy var paymentButton: MainActionButton = {
        let paymentButton: MainActionButton = MainActionButton(title: Constants.ButtonTitles.paymentButtonTitle,
                                                               backgroundColor: .blue) { [unowned self] in
            self.pay()
        }
        
        return paymentButton
    }()
    
    //MARK: - Private Properties 
    private var child: UIViewController!
    private var service: Service!
    
    //MARK: - Internal Properties
    var activityIndicatorViewController: ActivityIndicatorViewController!
    
    //MARK: - Initializers
    convenience init(child: UIViewController,
                     title: String) {
        self.init(nibName: nil, bundle: nil)
        self.child = child
        self.title = title
    }
    
    //MARK: - Life Cycle Methods 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createViewHierachy()
        add(child: child)
        layout()
        (child as? PaymentCollectionViewController)?.delegate = self
    }
    
    private func pay() {
        guard paymentButton.isUserInteractionEnabled == true else { return }
        self.presentActivity()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            guard let paymentCollectionViewController = self.child as? PaymentCollectionViewController else { return }
            paymentCollectionViewController.task?()
            
            self.activityIndicatorViewController.dismissActivity { [unowned self] in
                self.presentPaymentBill(forService: service)
            }
        }
    }
}

//MARK: - Extensions
extension PaymentContainerViewController: Layout {
    
    func createViewHierachy() {
        view.addSubviews(
            child.view,
            paymentButton
        )
    }
    
    func layout() {
        paymentButton.snp.makeConstraints {
            $0.trailing.leading.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(65)
        }
        
        child.view.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.leading.equalToSuperview()
            $0.bottom.equalTo(paymentButton.snp.top)
        }
    }
}

extension PaymentContainerViewController: PaymentBillPresentable {}

extension PaymentContainerViewController: PaymentCollectionViewControllerDelegate {
    
    func payService(_ service: Service, canProccedToPayment: Bool) {
        self.service = service
        paymentButton.isUserInteractionEnabled = canProccedToPayment
    }
}
