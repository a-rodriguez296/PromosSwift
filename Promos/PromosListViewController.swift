//
//  PromosListViewController.swift
//  Promos
//
//  Created by Alejandro Rodriguez on 1/15/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import UIKit
import ParseUI

class PromosListViewController: PFQueryTableViewController {

    
    convenience init() {
        self.init(style: .Plain, className: nil)
        
        title = NSLocalizedString("Promociones", comment: "titulo VC promociones")
        parseClassName = Constants.PromosTable.PromosName
        pullToRefreshEnabled = true
        paginationEnabled = true
        objectsPerPage =  Constants.CommonTableAttributes.ObjectsPerPage

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
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cellIdentifier = "cell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? PFTableViewCell
        if cell == nil {
            cell = PFTableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
        }
        
        // Configure the cell to show todo item with a priority at the bottom
        if let object = object {
            cell!.textLabel?.text = object[Constants.PromosTable.PromosTitle] as? String
            
        }
        
        return cell
    }


}
