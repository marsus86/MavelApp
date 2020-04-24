//
//  ComicSummary.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 20/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import Foundation

struct ItemSummary: Codable {
    var resourceURI: String?
    var name: String?
    
    init(json: [String: Any]) {
        self.resourceURI = json["resourceURI"] as? String
        self.name = json["name"] as? String
    }
}
