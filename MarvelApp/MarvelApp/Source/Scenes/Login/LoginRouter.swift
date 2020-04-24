//
//  LoginRoutingLogic.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 15/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import UIKit

protocol LoginRoutingLogic {
    func goToList()
}

protocol LoginDataPassing {
    
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
    
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    func goToList() {
        
        viewController?.performSegue(withIdentifier: Constants.Segues.listCharacters, sender: self)
    }
    
}
