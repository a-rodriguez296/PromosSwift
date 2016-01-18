//
//  CommerceCell.swift
//  Promos
//
//  Created by Alejandro Rodriguez on 1/17/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import ParseUI

class CommerceCell: PFTableViewCell {
    
    
    @IBOutlet weak var lblCommerceName: UILabel!
    @IBOutlet weak var btnNotifications: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        selectionStyle = .None
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func configureCellWithCommerce(commerce: Commerce){
        
        lblCommerceName.text = commerce.commerceName
        btnNotifications.selected = true

    }
    
    override func prepareForReuse() {
        lblCommerceName.text = ""
    }
    
    @IBAction func didTapNotificationsButton(sender: AnyObject) {
        
        let but = sender as! UIButton
        but.selected = !but.selected
        
    }
    
}
