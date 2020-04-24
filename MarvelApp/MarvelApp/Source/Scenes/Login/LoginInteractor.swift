//
//  LoginInteractor.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 15/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import UIKit

protocol LoginBussinessLogic {
}

protocol LoginDataStore {
}

class LoginInteractor: LoginBussinessLogic, LoginDataStore {
    
    var presenter: LoginPresentationLogic?
}
