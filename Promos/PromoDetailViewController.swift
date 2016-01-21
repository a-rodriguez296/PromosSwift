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
import Social
import MBProgressHUD

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
        
        
        
        let progressHud = MBProgressHUD.showHUDAddedTo(view, animated: true)
        progressHud.labelText = NSLocalizedString("Cargando", comment: "Mensaje progress hud")
        UrbanAirshipService.dowloadPass(promo!.passURL) { [unowned self, progressHud] (data) -> (Void) in
            
            progressHud.hide(true)
            
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
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            let tweet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            tweet.setInitialText(NSLocalizedString("Con Promo's acabo de obtener un \(promo?.title) en \(promo?.subtitle)", comment: "Texto tweet usuario compartir promoción"))
            tweet.completionHandler = { (result) -> (Void) in
            
                if result == SLComposeViewControllerResult.Done {
                    //TODO poner un tracker que la persona compartió en Twitter
                }
                else{
                    //TODO poner un tracker que la persona se arrepintió de compartir en Twitter
                }
            }
            presentViewController(tweet, animated: true, completion: nil)
        }
        else{
            //TODO poner un tracker que el usuario no tiene instalado twitter
            showAlertForMissingSocialNetwork()
        }
    }

    @IBAction func didTapShareFacebook(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            let facebookPost = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookPost.setInitialText(NSLocalizedString("Con Promo's acabo de obtener un \(promo?.title) en \(promo?.subtitle)", comment: "Texto tweet usuario compartir promoción"))
            facebookPost.completionHandler = {result in
            
                if result == SLComposeViewControllerResult.Done {
                    //TODO poner un tracker que la persona compartió en Facebook
                }
                else{
                    //TODO poner un tracker que la persona se arrepintió de compartir en Facebook
                }
            }
            presentViewController(facebookPost, animated: true, completion: nil)
        }
        else{
            
            //TODO poner un tracker que el usuario no tiene instalado Facebook
            showAlertForMissingSocialNetwork()
        }
    }
    
    func addPassesViewControllerDidFinish(controller: PKAddPassesViewController) {
        self .dismissViewControllerAnimated(true, completion: nil)
    }
    
    func showAlertForMissingSocialNetwork(){
        let alert = UIAlertController(title: NSLocalizedString("Atención", comment: ""), message: NSLocalizedString("Para compartir en esta red social debes instalarla primero", comment: ""), preferredStyle: .Alert)
        let firstAction = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .Default, handler: nil)
        alert.addAction(firstAction)
        presentViewController(alert, animated: true, completion:nil)
    }
}
