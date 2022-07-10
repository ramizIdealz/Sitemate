//
//  DataStorage.swift
//  Sitemate
//
//  Created by Ramiz Rafiq on 10/07/2022.
//

import UIKit

class DataStorage: NSObject {
    
    static var delegate:DataStorageDelegagte? = nil

    class func storeSitemapData(arr:NSArray)
    {
        
        delegate?.dataProcessedSuccesfully()
    }
    
}
