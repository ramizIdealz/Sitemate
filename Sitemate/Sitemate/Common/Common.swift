//
//  Common.swift
//  Sitemate
//
//  Created by Ramiz Rafiq on 10/07/2022.
//

import UIKit
import RealmSwift

class Common: NSObject {
    
    class func setupRealm()
    {
        // use if realm updated
        
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 1,
            
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
        })
        
        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
    }
    
    class func sendAlert(title:String,msg:String,viewController:UIViewController)
    {
        let actionSheetController = UIAlertController(title: title, message:msg, preferredStyle: .alert)
        let cancelActionButton = UIAlertAction(title: "Ok", style: .cancel) { action -> Void in}
        actionSheetController.addAction(cancelActionButton)
        viewController.present(actionSheetController, animated: true, completion: nil)
    }

    class func getStringValueForKey(key:String) -> String
    {
        let fileName = "En"
        let path = Bundle.main.path(forResource: fileName, ofType: "strings")
        let labelDic = NSDictionary.init(contentsOfFile: path!)
        
        if labelDic != nil
        {
            if let valueLabel = labelDic![key] as? String
            {
                return valueLabel
            }
        }
        
        return key
    }

}
