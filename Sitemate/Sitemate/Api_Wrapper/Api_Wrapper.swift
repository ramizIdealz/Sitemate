//
//  Api_Wrapper.swift
//  Sitemate
//
//  Created by Ramiz Rafiq on 10/07/2022.
//

import UIKit
import Alamofire

class Api_Wrapper: NSObject {
        
    class func getSitemapSongLyricsData(artist:String,title:String)
    {
        NetworkLayer.getLyrics(api_path: Endpoints.V1,artist: artist,title: title)
    }
}
