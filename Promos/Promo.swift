//
//  Promo.swift
//  Promos
//
//  Created by Alejandro Rodriguez on 1/15/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import Foundation
import Parse





class Promo: PFObject, PFSubclassing {
    
    @NSManaged var title: String
    @NSManaged var subtitle: String
    @NSManaged var logo: PFFile
    @NSManaged var featured: Bool
    @NSManaged var featuredImage: PFFile
    @NSManaged var passURL: String
    @NSManaged var commerceName: String
    
    
    class func parseClassName() -> String {
        return Constants.PromosTable.PromosTableName;
    }
    
    
    override class func initialize(){
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    
    override var description:String{
        return self.title
    }
}
