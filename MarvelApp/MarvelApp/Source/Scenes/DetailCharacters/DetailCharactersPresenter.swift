//
//  DetailCharactersPresenter.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 15/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import UIKit

protocol DetailCharactersPresentationLogic {

    func showDataCharacter(data: ListCharacter)
    func getError()
}

class DetailCharactersPresenter: DetailCharactersPresentationLogic {
    
    var viewController: DetailCharactersDisplayLogic?
    
    func showDataCharacter(data: ListCharacter) {
        viewController?.loadDataCharacter(data: data)

    }
    
    func getError() {
        viewController?.showError()
    }
}
