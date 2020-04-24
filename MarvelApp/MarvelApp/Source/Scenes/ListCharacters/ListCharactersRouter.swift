//
//  ListCharactersRouter.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 15/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import UIKit

protocol ListCharactersRoutingLogic {

    func goToDetail()
    func handleSegue(_ segue: UIStoryboardSegue)
}

protocol ListCharactersDataPassing {
    
    var dataStore: ListCharactersDataStore? { get }
}

class ListCharactersRouter: NSObject, ListCharactersRoutingLogic, ListCharactersDataPassing {
   
    weak var viewController: ListCharactersViewController?
    var dataStore: ListCharactersDataStore?
    
    func goToDetail() {
    
        viewController?.performSegue(withIdentifier: Constants.Segues.detailCharacters, sender: nil)
    }
    
    func handleSegue(_ segue: UIStoryboardSegue) {
        
        if let detail = segue.destination as? DetailCharactersViewController {
            var detailInteractor = detail.router?.dataStore
            detailInteractor?.idCharacter = viewController?.idCharacter
        }
    }
}
