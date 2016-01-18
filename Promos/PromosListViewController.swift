//
//  PromosListViewController.swift
//  Promos
//
//  Created by Alejandro Rodriguez on 1/15/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import UIKit
import ParseUI

class PromosListViewController: ParseQueryViewController {


    
    convenience init() {
        self.init(style: .Plain, className: nil)
        
        title = NSLocalizedString("Promociones", comment: "titulo VC promociones")
        parseClassName = Constants.PromosTable.PromosTableName
        pullToRefreshEnabled = true
        paginationEnabled = true
        objectsPerPage =  Constants.CommonTableAttributes.ObjectsPerPage
        
        tableView.registerNib(UINib(nibName: Constants.PromosCell.PromosNibName, bundle: nil), forCellReuseIdentifier: Constants.PromosCell.PromosCellIdentifier)
        
        

    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let promo = object as! Promo
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.PromosCell.PromosCellIdentifier) as? PromoCell
        cell?.configureCellWithPromo(promo)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return Constants.PromosCell.PromosCellHeight
    }
    
    


}
