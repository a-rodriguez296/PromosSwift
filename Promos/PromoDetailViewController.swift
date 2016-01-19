//
//  PromoDetailViewController.swift
//  Promos
//
//  Created by Alejandro Rodriguez on 1/18/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import UIKit
import ParseUI
import PassKit

class PromoDetailViewController: UIViewController, PKAddPassesViewControllerDelegate {
    
    
    @IBOutlet weak var imgPromo: PFImageView!
    @IBOutlet weak var lblPromoTitle: UILabel!
    @IBOutlet weak var lblPromoSubtitle: UILabel!
    
    var promo:Promo?

    
    convenience init(promo:Promo){
        self.init()
        self.promo = promo
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .None
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        title = NSLocalizedString("Detalle", comment: "Titulo VC detalle")
        
        lblPromoTitle.text = promo?.title
        lblPromoSubtitle.text = promo?.subtitle
        imgPromo.file = promo?.logo
        imgPromo.loadInBackground()
        
    }
    
    
    @IBAction func didTapDownloadPass(sender: AnyObject) {
        
        UrbanAirshipService.dowloadPass(promo!.passURL) { (data) -> (Void) in
            
            
            if PKPassLibrary.isPassLibraryAvailable(){
                
                let newPass = PKPass(data: data, error: nil)
                let passVC = PKAddPassesViewController(pass: newPass)
                
                passVC.delegate = self
                self.presentViewController(passVC, animated: true, completion: nil)
                
            }
        }
        
    }
    
    @IBAction func didTapSeeComments(sender: AnyObject) {
    }
    
    @IBAction func didTapShareTweeter(sender: AnyObject) {
        
        
    }

    @IBAction func didTapShareFacebook(sender: AnyObject) {
        
        
    }
    
    
    
    func addPassesViewControllerDidFinish(controller: PKAddPassesViewController) {
        
        
        self .dismissViewControllerAnimated(true, completion: nil)
        
    }
}
