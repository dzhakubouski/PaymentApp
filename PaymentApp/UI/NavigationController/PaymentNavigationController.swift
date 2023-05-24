//
//  PaymentNavigationController.swift
//  PaymentApp
//
//  Created by Admin on 23.05.23.
//

import UIKit

final class PaymentNavigationController: UINavigationController {
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - Private Methods
    private func configure() {
        navigationBar.prefersLargeTitles = true
    }
}
