//
//  PromosListViewController.swift
//  Promos
//
//  Created by Alejandro Rodriguez on 1/15/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import UIKit
import ParseUI
import Parse

class PromosListViewController: ParseQueryViewController {

    
    var promosBanner:PromosBannerView?

    
    convenience init() {
        self.init(style: .Plain, className: nil)
        
        title = NSLocalizedString("Promociones", comment: "titulo VC promociones")
        parseClassName = Constants.PromosTable.PromosTableName
        pullToRefreshEnabled = true
        paginationEnabled = true
        objectsPerPage =  Constants.CommonTableAttributes.ObjectsPerPage
        
        tableView.registerNib(UINib(nibName: Constants.Cells.PromosCell.PromosNibName, bundle: nil), forCellReuseIdentifier: Constants.Cells.PromosCell.PromosCellIdentifier)
        
        
        promosBanner = NSBundle.mainBundle().loadNibNamed("PromosBannerView", owner: self, options: nil).first as? PromosBannerView
        tableView.tableHeaderView = promosBanner
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        let featuredQuery = PFQuery(className: Constants.PromosTable.PromosTableName)
        featuredQuery.whereKey(Constants.PromosTable.PromosIsFeatured, equalTo:true)
        featuredQuery.cachePolicy = .CacheThenNetwork
        featuredQuery.limit = 3
        featuredQuery.findObjectsInBackgroundWithBlock { (objects:[PFObject]?, error:NSError?) -> Void in
            
            self.promosBanner?.objects = objects
        }
        
        
        promosBanner?.frame = CGRectMake(0, 0, view.frame.width, 150)
        promosBanner?.layoutSubviews()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let promo = object as! Promo
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.Cells.PromosCell.PromosCellIdentifier) as? PromoCell
        cell?.configureCellWithPromo(promo)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return Constants.Cells.PromosCell.PromosCellHeight
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let promo = objectAtIndexPath(indexPath) as! Promo
        
        let detailVC = PromoDetailViewController(promo: promo)
        navigationController?.pushViewController(detailVC, animated: true)
        
    }

}
