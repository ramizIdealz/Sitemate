//
//  ViewController.swift
//  Sitemate
//
//  Created by Ramiz Rafiq on 10/07/2022.
//

import UIKit
import Alamofire

class MainController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Api Testing
        fetchLyricsData()
        
        DataStorage.delegate = self
        NetworkLayer.delegate = self
    }
    func fetchLyricsData()
    {
        Api_Wrapper.getSitemapSongLyricsData(artist: "Coldplay", title: "Adventure of a Lifetime")
    }
}

// Mark: Protocols for Data Storage Layer
extension MainController:DataStorageDelegate
{
    func dataProcessedSuccesfully() {
        
        let lyricsObj = DataFetch.getSavedLyrics()
        print("")
    }
    
    func dataStorageError(error: String) {
        
        Common.sendAlert(title: "Error", msg: error, viewController: self)
    }

}

// Mark: Protocols for Network Layer
extension MainController:NetworkLayerContract
{
    func apiFailed(error: String) {
        
        Common.sendAlert(title: "Error", msg: error, viewController: self)
    }
}

