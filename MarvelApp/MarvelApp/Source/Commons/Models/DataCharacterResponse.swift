//
//  DataCharacterResponse.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 20/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import Foundation

struct DataCharacterResponse: Codable {
    var code: Int?
    var status: String?
    var copyright: String?
    var attributionText: String?
    var data: DataCharacter?
    var etag: String?
        
    public init(code: Int? = nil, status: String? = nil, copyright: String? = nil, attributionText: String? = nil, data: DataCharacter? = nil, etag: String? = nil) {

        self.code = code
        self.status = status
        self.copyright = copyright
        self.attributionText = attributionText
        self.data = data
        self.etag = etag
    }
    
    init(json: [String: Any]) {
        self.code = json["code"] as? Int
        self.status = json["status"] as? String
        self.copyright = json["copyright"] as? String
        self.attributionText = json["attributionText"] as? String
        self.etag = json["etag"] as? String
        
        if let d = json["data"] as? [String:Any] {
            data = DataCharacter(json: d)
       }
    }
}



