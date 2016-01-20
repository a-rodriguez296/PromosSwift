//
//  CommerceHeaderView.swift
//  Promos
//
//  Created by Alejandro Rodriguez on 1/20/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class CommerceHeaderView: UIView {

    @IBOutlet var view: UIView!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        NSBundle.mainBundle().loadNibNamed("CommerceHeaderView", owner: self, options: nil)
        bounds = view.bounds
        addSubview(view)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


}
