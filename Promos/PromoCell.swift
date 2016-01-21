//
//  PromoCell.swift
//  Promos
//
//  Created by Alejandro Rodriguez on 1/17/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import UIKit
import ParseUI
import Parse

class PromoCell: PFTableViewCell {

    @IBOutlet weak var imgPromo: PFImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblSubtitle: UILabel!
    
    @IBOutlet weak var lblCommerceName: UILabel!
    
    weak var delegate:PromosCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        selectionStyle = .None
    }
    
    func configureCellWithPromo<T:PromosCellDelegate>(promo: Promo, parentViewController vc:T){
        
        delegate = vc
        
        lblTitle.text = promo.title
        lblSubtitle.text = promo.subtitle
        lblCommerceName.text = promo.commerceName
        
        imgPromo.file = promo.logo
        imgPromo.loadInBackground()
        
        
    }
    
    override func prepareForReuse() {
        lblTitle.text = ""
        lblSubtitle.text = ""
        lblCommerceName.text = ""
        imgPromo.image = nil
    }
    
    
    @IBAction func didTapDownloadPass(sender: AnyObject) {
        
        delegate?.promosCell(didTapDonwloadPassWithCell: self)
    }
    
}
