//
//  MainActionButton.swift
//  PaymentApp
//
//  Created by Admin on 23.05.23.
//

import UIKit

final class MainActionButton: UIButton {
    
    //MARK: - Typealias
    typealias ActionHandler = () -> Void
    
    //MARK: - Private Properties
    private var actionHandler: ActionHandler? = nil
    
    //MARK: - Initializers
    convenience init(title: String,
                     backgroundColor: UIColor,
                     actionHandler: @escaping ActionHandler) {
        self.init(type: .system)
        self.titleLabel?.font = .systemFont(ofSize: 20,
                                            weight: .medium)
        self.setTitleColor(.white, for: .normal)
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        self.isUserInteractionEnabled = false
        self.actionHandler = actionHandler
        
        addTarget(self,
                  action: #selector(didTap),
                  for: .touchUpInside)
    }
    
    //MARK: - Life Cycle Methods
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(radius: nil)
    }
    
    //MARK: - Actions 
    @objc
    private func didTap() {
        actionHandler?()
    }
}
