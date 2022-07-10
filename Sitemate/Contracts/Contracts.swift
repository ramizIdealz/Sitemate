//
//  Contracts.swift
//  Sitemate
//
//  Created by Ramiz Rafiq on 10/07/2022.
//

import UIKit

// MARK: Data Storage Contract
protocol DataStorageDelegagte {
    
    func dataProcessedSuccesfully()
    func dataStorageError(error:String)
}

// MARK: Network Layer Contract
@objc
protocol NetworkLayerContract {
    
    // Success function is optional in case you already have delegation there.
    @objc optional func apiSuccess()
    func apiFailed(error:String)
}
