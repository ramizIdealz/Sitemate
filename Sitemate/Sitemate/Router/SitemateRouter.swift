//
//  SitemateRouter.swift
//  Sitemate
//
//  Created by Ramiz Rafiq on 10/07/2022.
//

import UIKit

class SitemateRouter: NSObject {

    static func createBaseModule() -> UIViewController {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return mainStoryboard.instantiateViewController(withIdentifier: "MainView")
        
    }

}
