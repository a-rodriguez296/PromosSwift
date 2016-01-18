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
        
        
        tableView.registerNib(UINib(nibName: Constants.Cells.CommerceCell.CommerceNibName, bundle: nil), forCellReuseIdentifier: Constants.Cells.CommerceCell.CommerceCellIdentifier)
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        
        let commerce = object as! Commerce
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.Cells.CommerceCell.CommerceCellIdentifier) as? CommerceCell
        cell?.configureCellWithCommerce(commerce)
        
        return cell
    }

}
