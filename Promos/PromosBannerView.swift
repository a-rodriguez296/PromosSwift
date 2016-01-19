//
//  PromosBannerView.swift
//  Promos
//
//  Created by arodriguez on 1/19/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import UIKit
import ParseUI
import iCarousel

class PromosBannerView: UIView, iCarouselDataSource, iCarouselDelegate {
    
    @IBOutlet weak var carousel: iCarousel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        carousel.delegate = self
        carousel.dataSource = self
    }
    
    var objects:Array<AnyObject>?{
        didSet{
            NSObject.cancelPreviousPerformRequestsWithTarget(self, selector: "moveToNext", object: nil)
            carousel.reloadData()
            moveToNext()
        }
    }
    
    var delegate:PromosBannerDelegate?
    
    
    func moveToNext(){
        
        var nextInt = carousel.currentItemIndex
        nextInt++
        
        carousel.scrollToItemAtIndex(nextInt, duration: Constants.Animations.PromosBanner.ScrollSpeed)
        performSelector("moveToNext", withObject: nil, afterDelay: Constants.Animations.PromosBanner.AutomaticScrollDelay)
    }
    
    
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
        if let unwrappedObjects = objects{
            return unwrappedObjects.count
        }
        else{
            return 0
        }
    }
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        
        var imgView:PFImageView?
        let promo = objects![index] as! Promo
        let featuredImageFile = promo.featuredImage
        imgView = PFImageView(frame: frame)
        imgView?.file = featuredImageFile
        imgView?.loadInBackground()
        imgView?.contentMode = .ScaleToFill
        
        return imgView!
    }
    
    
    func carousel(carousel: iCarousel, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        
        switch option{
        case .Wrap:
            return 1.0
        case .Spacing:
            return value
        default:
            return value
        }
    }
    
    func carouselWillBeginDragging(carousel: iCarousel) {
        NSObject.cancelPreviousPerformRequestsWithTarget(self, selector: "moveToNext", object: nil)
    }
    
    func carouselDidEndDecelerating(carousel: iCarousel) {
        performSelector("moveToNext", withObject: nil, afterDelay: Constants.Animations.PromosBanner.AutomaticScrollDelay)
    }
    
    func carousel(carousel: iCarousel, didSelectItemAtIndex index: Int) {
        let promo = objects![index] as! Promo
        delegate?.promosBanner(self, didTouchBannerAtIndex: index, promoObject: promo)
    }
    
    
    
}
