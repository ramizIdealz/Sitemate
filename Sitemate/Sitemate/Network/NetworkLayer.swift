//
//  Network.swift
//  Sitemate
//
//  Created by Ramiz Rafiq on 10/07/2022.
//

import UIKit
import Alamofire

class NetworkLayer: NSObject {
    
    static var delegate:NetworkLayerContract? = nil
        
    class func getBaseSiteMateData(api_path:String,method:HTTPMethod)
    {
        let apiUrl = Api_Base_Url + api_path
        
        Alamofire.request(apiUrl, method: method, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if let resultRes = response.result.value {
                    
                    DataStorage.storeSitemapData(arr: resultRes as! NSArray)
                }
                break
            case .failure(let _):
                if let data = response.data {
                 
                    delegate?.apiFailed(error: parseApiFailure(data: data))
                }
                break
            }
        }
    }
    
    // Seperate mehtod for SOLID, easier for dependency injection
    class func parseApiFailure(data:Data) -> String
    {
        if let json = String(data: data, encoding: String.Encoding.utf8)
        {
            return json
        }
        
        return Common.getStringValueForKey(key: "Api_Failed_Error")
    }
}
