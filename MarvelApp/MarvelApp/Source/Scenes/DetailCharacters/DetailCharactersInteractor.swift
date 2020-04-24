//
//  DetailCharactersInteractor.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 15/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import UIKit

protocol DetailCharactersBussinessLogic {

    func getDataCharacter()
}

protocol DetailCharactersDataStore {

    var characterDetail: ListCharacter? { get set }
    var idCharacter: Int? { get set }
}

class DetailCharactersInteractor: DetailCharactersBussinessLogic, DetailCharactersDataStore {
    var idCharacter: Int?
    var characterDetail: ListCharacter?
    var presenter: DetailCharactersPresentationLogic?
    
    func getDataCharacter() {
        let service = Services(baseUrl: "https://gateway.marvel.com:443/v1/public/characters/")
    
        let id = String(idCharacter!)

        service.getCharacterFrom(endPoint: id, callback: { (data, status, error)  in
            if status {
                self.characterDetail = data
                self.presenter?.showDataCharacter(data: self.characterDetail!)

            } else {
                self.presenter?.getError()
            }
        })
    }
}
