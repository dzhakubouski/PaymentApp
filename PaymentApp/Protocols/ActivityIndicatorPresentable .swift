//
//  ActivityIndicatorPresentable .swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import Foundation
import UIKit

protocol ActivityIndicatorPresentable: AnyObject {
    
    var activityIndicatorViewController: ActivityIndicatorViewController! { get set }
    
    func presentActivity()
}

extension ActivityIndicatorPresentable where Self: UIViewController {
    
    func presentActivity() {
        activityIndicatorViewController = ActivityIndicatorViewController()
        activityIndicatorViewController.modalPresentationStyle = .overCurrentContext
        present(activityIndicatorViewController, animated: true)
    }
}
