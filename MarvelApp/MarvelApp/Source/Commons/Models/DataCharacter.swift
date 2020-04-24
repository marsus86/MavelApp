//
//  DataCharacter.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 20/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import Foundation

struct DataCharacter: Codable {
    var offset: Int64?
    var limit: Int64?
    var total: Int?
    var count: Int?
    var results: [ListCharacter] = []
    
    init(json: [String: Any]) {
        self.offset = json["offset"] as? Int64
        self.limit = json["limit"] as? Int64
        self.total = json["total"] as? Int
        self.count = json["count"] as? Int
        
        if let r = json["results"] as? [[String:Any]] {
            r.forEach { (list) in
                let o = ListCharacter(json: list)
                results.append(o)
            }
            
        } else {
            
        }
    }
   
}
