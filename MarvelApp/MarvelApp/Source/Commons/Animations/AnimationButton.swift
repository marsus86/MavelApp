//
//  AnimationButton.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 16/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 2
        flash.toValue = 0.3
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 40
        
        layer.add(flash, forKey: nil)
    }
}
