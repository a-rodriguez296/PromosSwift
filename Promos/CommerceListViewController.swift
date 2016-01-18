//
//  CommerceListViewController.swift
//  Promos
//
//  Created by Alejandro Rodriguez on 1/15/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import UIKit
import ParseUI

class CommerceListViewController: ParseQueryViewController {

    convenience init() {
        self.init(style: .Plain, className: nil)
        
        self.navigationController?.title = NSLocalizedString("Marcas", comment: "titulo VC marcas")
        parseClassName = Constants.CommerceTable.CommerceTableName
        pullToRefreshEnabled = true
        paginationEnabled = true
        objectsPerPage =  Constants.CommonTableAttributes.ObjectsPerPage
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cellIdentifier = "cell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? PFTableViewCell
        if cell == nil {
            cell = PFTableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
        }
        
        // Configure the cell to show todo item with a priority at the bottom
        if let object = object {
            cell!.textLabel?.text = object[Constants.CommerceTable.CommerceName] as? String
            
        }
        
        return cell
    }

}
