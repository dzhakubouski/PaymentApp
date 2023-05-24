//
//  PaymentBillPresentable.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import Foundation
import UIKit

protocol PaymentBillPresentable {
    
    func presentPaymentBill(forService service: Service)
}
 
extension PaymentBillPresentable where Self: UIViewController {
    
    func presentPaymentBill(forService service: Service) {
        let paymentBillViewController = PaymentBillViewController(service: service)
        paymentBillViewController.modalPresentationStyle = .overFullScreen
        present(paymentBillViewController, animated: true)
    }
}
