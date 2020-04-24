//
//  DetailCharactersRouter.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 15/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import UIKit

protocol DetailCharactersRoutingLogic {
}

protocol DetailCharactersDataPassing {
    
    var dataStore: DetailCharactersDataStore? { get }
}

class DetailCharactersRouter: NSObject, DetailCharactersRoutingLogic, DetailCharactersDataPassing {
    
    weak var viewController: DetailCharactersViewController?
    var dataStore: DetailCharactersDataStore?
    
}
