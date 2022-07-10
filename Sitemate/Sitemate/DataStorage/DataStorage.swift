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
        }
        
        delegate?.dataProcessedSuccesfully()
    }
    
}
