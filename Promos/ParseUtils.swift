//
//  ParseUtils.swift
//  Promos
//
//  Created by Alejandro Rodriguez on 1/15/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class ParseUtils: NSObject {
    
    
    static func initializeParseObjects(){
        
        Promo.initialize()
        
    }
    
    
    static func parseKeys() -> (String, String){
        
        let path = NSBundle.mainBundle().pathForResource("ParseKeys", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!) as? [String: AnyObject]
        

        let applicationId = dict!["ApplicationID"] as! String
        let clientKey = dict!["ClientKey"] as! String
        
        return (applicationId,clientKey)
        
        
    }
    
    
    
    
}
