//
//  PromosBannerDelegate.swift
//  Promos
//
//  Created by arodriguez on 1/19/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import Parse

protocol PromosBannerDelegate{
    
    func promosBanner(banner: PromosBannerView, didTouchBannerAtIndex index: Int, promoObject  object:Promo)
    
}
