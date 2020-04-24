//
//  ComicList.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 20/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import Foundation

struct ItemList: Codable {
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [ItemSummary] = []

    init(json: [String: Any]) {
        self.available = json["offset"] as? Int
        self.returned = json["limit"] as? Int
        self.collectionURI = json["collectionURI"] as? String
              
        if let r = json["items"] as? [[String:Any]] {
            r.forEach { (listItems) in
                let o = ItemSummary(json: listItems)
                    items.append(o)
            }
        } else {
        }
    }
}

