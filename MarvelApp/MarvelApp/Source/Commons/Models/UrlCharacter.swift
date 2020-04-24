//
//  UrlCharacter.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 20/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import Foundation

struct UrlCharacter: Codable {
    var type: String?
    var url: String?
    
    init(json: [String: Any]) {
        self.type = json["type"] as? String
        self.url = json["url"] as? String
    }
}
