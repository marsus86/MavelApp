//
//  ListCharactersInteractor.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 15/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import UIKit

protocol ListCharactersBussinessLogic {

    func loadData()
}

protocol ListCharactersDataStore {
}

class ListCharactersInteractor: ListCharactersBussinessLogic, ListCharactersDataStore {
    
    var characterDetail: ListCharacter?
    var presenter: ListCharactersPresentationLogic?
    var listCharacter:  DataCharacter?

    func loadData() {
        
        let service = Services(baseUrl: "https://gateway.marvel.com:443/v1/public/")
        service.getNameCharactersFrom(endPoint: "characters", callback: { (data, status, error)  in
            if status {
                self.listCharacter = data
                self.presenter?.getData(data: self.listCharacter!)
                
            } else {
                self.presenter?.getError()
                
            }
        })
    }
}

