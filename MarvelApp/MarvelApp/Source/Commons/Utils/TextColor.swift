//
//  TextColor.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 24/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertAction {
    var titleTextColor: UIColor? {
        get {
            return self.value(forKey: "titleTextColor") as? UIColor
        } set {
            self.setValue(newValue, forKey: "titleTextColor")
        }
    }
}
