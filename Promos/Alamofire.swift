//
//  Alamofire.swift
//  Promos
//
//  Created by arodriguez on 1/21/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import Alamofire
import PassKit

enum Router: URLRequestConvertible {
    static let baseURLString = Constants.UrbanAirship.BaseURL
    
    case DonwloadPass(String)
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSMutableURLRequest {
        let result: (path: String, parameters: [String: AnyObject]?) = {
            switch self {
            case .DonwloadPass(let passIdentifier):
                return ("\(Constants.UrbanAirship.downloadPassEndpoint)\(passIdentifier)", nil)
                
            }
        }()
        
        let URL = NSURL(string: Router.baseURLString)!
        let URLRequest = NSURLRequest(URL: URL.URLByAppendingPathComponent(result.path))
        let encoding = Alamofire.ParameterEncoding.URL
        
        return encoding.encode(URLRequest, parameters: result.parameters).0
    }
}


extension Request{
    
    public static func PKPassSerializer() -> ResponseSerializer<PKPass, NSError> {
        
        return ResponseSerializer{ request, response, data, error in
            
            guard error == nil else { return .Failure(error!) }
            
            var error: NSError?
            let pass = PKPass(data: data!, error: &error )
            if let unwrappedError = error{
                return .Failure(unwrappedError)
            }
            else{
                return .Success(pass)
            }
        }
    }
    
    public func responsePKPass(completionHandler: Response<PKPass, NSError> -> Void) -> Self {
        return response(responseSerializer: Request.PKPassSerializer(), completionHandler: completionHandler)
    }
}

