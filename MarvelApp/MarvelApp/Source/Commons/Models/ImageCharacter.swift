//
//  Image.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 17/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import Foundation

struct ImageCharacter: Codable {
    var path: String?
    var fileExtension: String?
       
    init(json: [String: Any]) {
        self.path = json["path"] as? String
        self.fileExtension = json["extension"] as? String
    }
}
