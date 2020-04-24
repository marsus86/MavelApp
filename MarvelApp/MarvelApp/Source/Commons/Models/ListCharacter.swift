//
//  ListCharacter.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 20/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import Foundation

struct ListCharacter: Codable {
    var id: Int?
    var name: String?
    var description: String?
    var modified: Date?
    var resourceURI: String?
    var urls: [UrlCharacter] = []
    var thumbnail: ImageCharacter?
    var comics: ItemList?
    var stories: StoryList?
    var events: ItemList?
    var series: ItemList?
    
    init(json: [String: Any]) {
        self.id = json["id"] as? Int
        self.name = json["name"] as? String
        self.description = json["description"] as? String
        self.modified = json["modified"] as? Date
        self.resourceURI = json["resourceURI"] as? String
              
        if let ur = json["urls"] as? [[String:Any]] {
            ur.forEach { (listUrls) in
                let o = UrlCharacter(json: listUrls)
                    urls.append(o)
            }
        }
        
        if let th = json["thumbnail"] as? [String:Any] {
            thumbnail = ImageCharacter(json: th)
        } 
        
        if let com = json["comics"] as? [String:Any] {
            comics = ItemList(json: com)
        }
        
        if let st = json["stories"] as? [String:Any] {
           stories = StoryList(json: st)
        }
        
        if let ev = json["events"] as? [String:Any] {
            events = ItemList(json: ev)
        }
        
        if let ser = json["series"] as? [String:Any] {
            series = ItemList(json: ser)
        }
    }
}
