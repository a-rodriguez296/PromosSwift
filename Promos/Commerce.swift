//
//  Commerce.swift
//  Promos
//
//  Created by Alejandro Rodriguez on 1/17/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import Parse


class Commerce: PFObject, PFSubclassing {

    @NSManaged var commerceName: String
    @NSManaged var commerceId: String
    
    
    class func parseClassName() -> String {
        return Constants.CommerceTable.CommerceTableName;
    }
    
    
    override class func initialize(){
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }


    
}
