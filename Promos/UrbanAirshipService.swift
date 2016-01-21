//
//  UrbanAirshipService.swift
//  Promos
//
//  Created by Alejandro Rodriguez on 1/18/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import Alamofire


class UrbanAirshipService {
    
    
    typealias PassClosure = (data : NSData) -> (Void)
    
    class func dowloadPass(id: String, closure: PassClosure){
        
        Alamofire.request(.GET, "https://wallet-api.urbanairship.com/v1/download/pass/\(id)", parameters: nil).responseData
            { response in
            
                
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                
                closure(data: response.data!)
                
                
            
        }
    }
    
}

//struct UrbanAirshipService {

//    enum Router: URLRequestConvertible{
//        
//        static let baseURLString = "https://wallet-api.urbanairship.com/v1"
//        
//        
//        case DonwloadPass(String)
//        
//        var URLRequests: NSMutableURLRequest{
//            let result: (path: String, parameters : [String: AnyObject]) = {
//                switch self {
//                case .DonwloadPass(let passID):
//                    return ("/\(passID)")
//                }
//                let URL = NSURL(string: Router.baseURLString)
//                let URLRequest = NSURLRequest(URL: URL!.URLByAppendingPathComponent(result.path))
//                let encoding = Alamofire.ParameterEncoding.URL
//                return encoding.encode(URLRequest, parameters: result.parameters).0
//            }
//            
//        }
//        
//    }
//}
