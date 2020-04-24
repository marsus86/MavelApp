//
//  StorySummary.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 20/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import Foundation

struct StorySummary: Codable {
    var resourceURI: String?
    var name: String?
    var type: String?
    
    init(json: [String: Any]) {
        self.resourceURI = json["resourceURI"] as? String
        self.name = json["name"] as? String
        self.type = json["type"] as? String
    }
}
