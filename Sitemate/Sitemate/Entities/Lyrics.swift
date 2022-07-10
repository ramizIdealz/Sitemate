//
//  Lyrics.swift
//  Sitemate
//
//  Created by Ramiz Rafiq on 10/07/2022.
//

import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class Lyrics: Object, Mappable {
    
    @objc dynamic var lyrics = ""
    
    // To determine when the object was updated, in case to add any caching removal code
    @objc dynamic var updatedOn = Date()


    required convenience init?(map: Map) {
      self.init()
    }

    func mapping(map: Map) {
        
        lyrics <- map["lyrics"]
    }

}
