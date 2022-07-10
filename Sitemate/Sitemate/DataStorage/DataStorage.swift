//
//  DataStorage.swift
//  Sitemate
//
//  Created by Ramiz Rafiq on 10/07/2022.
//

import UIKit
import RealmSwift

class DataStorage: NSObject {
    
    static var delegate:DataStorageDelegate? = nil

    class func storeLyricsData(response:Dictionary<String, Any>)
    {
        if response["error"] == nil
        {
            if let userMapped =  Lyrics(JSON: response)
            {
                let realmObj = try! Realm()
                try! realmObj.write {
                    realmObj.add(userMapped)
                }
            }
            
            delegate?.dataProcessedSuccesfully()
        }
        else
        {
            let errorStrings = response["error"] as! String
            delegate?.dataStorageError(error: errorStrings)
        }
        
    }
    
    // Normally we don't use this, we update the saved data with their id, but this is a show and kill feature
    class func removeStoredLyrics()
    {
        let realmObj = try! Realm()
        let userSaved:Results<Lyrics> = realmObj.objects(Lyrics.self)
        try! realmObj.write {
            realmObj.delete(userSaved)
        }
    }

}
