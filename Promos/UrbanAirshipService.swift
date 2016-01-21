//
//  UrbanAirshipService.swift
//  Promos
//
//  Created by Alejandro Rodriguez on 1/18/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import Alamofire
import PassKit


class UrbanAirshipService {
    
    
    typealias PassClosure = (pass : PKPass) -> (Void)
    
    class func dowloadPass(id: String, closure: PassClosure){
        
        
        Alamofire.request(Router.DonwloadPass(id)).responsePKPass{(response) -> Void in
            closure(pass: response.result.value!)
        }
    }
}



