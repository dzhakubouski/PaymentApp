//
//  UIView + applyBlur.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import Foundation
import UIKit

extension UIView {
    
    ///Blur parent view using visul effect
    func applyBlur() {
        let blurView = BlurBackgroundView(frame: self.bounds)
        self.addSubview(blurView)
        self.sendSubviewToBack(blurView)
    }
}
