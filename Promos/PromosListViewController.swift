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
import PassKit
import MBProgressHUD

class PromosListViewController: ParseQueryViewController, PromosBannerDelegate, PromosCellDelegate, PKAddPassesViewControllerDelegate {

    
    var promosBanner:PromosBannerView?
    
    convenience init() {
        self.init(style: .Plain, className: Constants.PromosTable.PromosTableName)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        title = NSLocalizedString("Promociones", comment: "titulo VC promociones")
        
        
        tableView.registerNib(UINib(nibName: Constants.Cells.PromosCell.PromosNibName, bundle: nil), forCellReuseIdentifier: Constants.Cells.PromosCell.PromosCellIdentifier)
        
        
        promosBanner = NSBundle.mainBundle().loadNibNamed("PromosBannerView", owner: self, options: nil).first as? PromosBannerView
        promosBanner?.delegate = self
        tableView.tableHeaderView = promosBanner
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        Promo.bannerQuery().findObjectsInBackgroundWithBlock { (objects:[PFObject]?, error:NSError?) -> Void in
            
            self.promosBanner?.objects = objects
        }
        
        promosBanner?.frame = CGRectMake(0, 0, view.frame.width, 150)
        promosBanner?.layoutSubviews()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let promo = object as! Promo
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.Cells.PromosCell.PromosCellIdentifier) as? PromoCell
        cell?.configureCellWithPromo(promo, parentViewController: self)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return Constants.Cells.PromosCell.PromosCellHeight
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let promo = objectAtIndexPath(indexPath) as! Promo
        
        let detailVC = PromoDetailViewController(promo: promo)
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    func promosBanner(banner: PromosBannerView, didTouchBannerAtIndex index: Int, promoObject  object:Promo){
        
        let detailVC = PromoDetailViewController(promo: object)
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    func promosCell(didTapDonwloadPassWithCell cell: PromoCell) {
        let indexPath = tableView.indexPathForCell(cell)
        let promo = objectAtIndexPath(indexPath) as! Promo
        
        
        let progressHud = MBProgressHUD.showHUDAddedTo(view, animated: true)
        progressHud.labelText = NSLocalizedString("Cargando", comment: "Mensaje progress hud")

        
        UrbanAirshipService.dowloadPass(promo.passURL) { [unowned self] (pass) -> (Void) in
            
            progressHud.hide(true)
            
            if PKPassLibrary.isPassLibraryAvailable(){
                
                let passVC = PKAddPassesViewController(pass: pass)
                passVC.delegate = self
                self.presentViewController(passVC, animated: true, completion: nil)
            }
        }
    }
    
    func addPassesViewControllerDidFinish(controller: PKAddPassesViewController) {
        self .dismissViewControllerAnimated(true, completion: nil)
    }

}
