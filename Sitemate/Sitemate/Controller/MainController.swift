//
//  ViewController.swift
//  Sitemate
//
//  Created by Ramiz Rafiq on 10/07/2022.
//

import UIKit
import Alamofire

class MainController: UIViewController {
    
    @IBOutlet weak var txtArtist:UITextField!
    @IBOutlet weak var txtTitle:UITextField!
    @IBOutlet weak var txtLyrics:UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
                
        DataStorage.delegate = self
        NetworkLayer.delegate = self
    }
    func fetchLyricsData()
    {
        Api_Wrapper.getSitemapSongLyricsData(artist: txtArtist.text!, title: txtTitle.text!)
        self.view.endEditing(true)
    }
    func clearStorage()
    {
        DataStorage.removeStoredLyrics()
        txtLyrics.text = ""
    }
    @IBAction func validateParamToCallApi()
    {
        if checkParamValidation()
        {
            fetchLyricsData()
        }
    }
    
    func checkParamValidation() -> Bool
    {
        if txtArtist.text?.count == 0
        {
            Common.sendAlert(title: "Error", msg: "Enter artist name please", viewController: self)
            return false
        }
        else if txtTitle.text?.count == 0
        {
            Common.sendAlert(title: "Error", msg: "Enter song title please", viewController: self)
            return false
        }
        
        return true
    }
}

// Mark: Protocols for Data Storage Layer
extension MainController:DataStorageDelegate
{
    func dataProcessedSuccesfully() {
        
        let lyricsObj = DataFetch.getSavedLyrics()
        txtLyrics.text = lyricsObj.lyrics
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

