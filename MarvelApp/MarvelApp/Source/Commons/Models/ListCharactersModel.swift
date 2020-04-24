//
//  ListCharactersModel.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 15/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import Foundation

struct ListCharactersModel: Decodable {
    var id: String?
    var name: String?
    var thumbnail: ImageCharacter?
    let limit: Int?
    let offset: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case thumbnail = "thumbnail"
        case limit = "limit"
        case offset = "offset"
    }
    
    init(name: String? = nil,
            id: String? = nil,
            thumbnail: ImageCharacter? = nil,
            limit: Int? = nil,
            offset: Int? = nil) {
        self.name = name
        self.id = id
        self.thumbnail = thumbnail
        self.limit = limit
        self.offset = offset
       }
}
