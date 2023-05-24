//
//  BlurBackgroundView.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import UIKit

final class BlurBackgroundView: UIView {
    
    private let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear)
    private let visualEffectView = UIVisualEffectView(effect: nil)
    
    var fractionComplete = 0.1
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupView()
        setupViewPropertyAnimator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        setupView()
        setupViewPropertyAnimator()
    }
    
    deinit {
        animator.stopAnimation(true)
    }
    
    // MARK: - Public Functions
    public func stopAnimation() {
        animator.stopAnimation(true)
    }
    
    // MARK: - Private Functions
    private func setupViewPropertyAnimator() {
        animator.addAnimations { [weak self] in
            self?.visualEffectView.effect = UIBlurEffect(style: .regular)
        }
        animator.pausesOnCompletion = true
        animator.fractionComplete = self.fractionComplete
        animator.pauseAnimation()
    }
    
    private func setupUI() {
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    private func setupView() {
        self.addSubview(visualEffectView)
        
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        visualEffectView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        visualEffectView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
}
