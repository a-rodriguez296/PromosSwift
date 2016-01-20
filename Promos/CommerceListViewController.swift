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
        self.init(style: .Plain, className: Constants.CommerceTable.CommerceTableName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: Constants.Cells.CommerceCell.CommerceNibName, bundle: nil), forCellReuseIdentifier: Constants.Cells.CommerceCell.CommerceCellIdentifier)
        tableView.tableHeaderView = CommerceHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 126))
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.title = NSLocalizedString("Marcas", comment: "titulo VC marcas")
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        
        let commerce = object as! Commerce
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.Cells.CommerceCell.CommerceCellIdentifier) as? CommerceCell
        cell?.configureCellWithCommerce(commerce)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return Constants.Cells.CommerceCell.CommerceCellHeight
    }
    
}
