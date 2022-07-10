//
//  DataFetch.swift
//  Sitemate
//
//  Created by Ramiz Rafiq on 10/07/2022.
//

import UIKit
import RealmSwift

class DataFetch: NSObject {

    class func getSavedLyrics() -> Lyrics
    {
        let realmObj = try! Realm()
        realmObj.refresh()
        let savedLyrics:Results<Lyrics> = realmObj.objects(Lyrics.self)
        
        return savedLyrics.first!
    }
}
