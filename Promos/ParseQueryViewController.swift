//
//  ParseQueryViewController.swift
//  Promos
//
//  Created by Alejandro Rodriguez on 1/15/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import UIKit
import ParseUI

class ParseQueryViewController: PFQueryTableViewController {


    override init(style: UITableViewStyle, className: String?) {
        super.init(style: style, className: className)
        pullToRefreshEnabled = true
        paginationEnabled = true
        objectsPerPage =  Constants.CommonTableAttributes.ObjectsPerPage
    }
        

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: self.parseClassName!)
        
        
        //If pull to refresh is enabled, query against the network by default
        if(pullToRefreshEnabled == true){
            query.cachePolicy = .NetworkOnly
        }
        
        //If no objects are loaded in memory, llok first in cache and then do a network request
        if(objects?.count == 0){
            query.cachePolicy = .CacheThenNetwork
        }
        
        
        query.orderByDescending(Constants.CommonTableAttributes.CreatedAt)
        
        return query
    }

}
