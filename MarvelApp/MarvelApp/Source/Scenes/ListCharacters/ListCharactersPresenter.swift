//
//  ListCharactersPresenter.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 15/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import UIKit

protocol ListCharactersPresentationLogic {
    
    func getData(data: DataCharacter)
    func getError()
}

class ListCharactersPresenter: ListCharactersPresentationLogic {
    
    var viewController: ListCharactersDisplayLogic?
    
    func getData(data: DataCharacter) {
        viewController?.loadData(data: data)
       }
    
    func getError() {
        viewController?.showError()
    }
       
}
