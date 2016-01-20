//
//  Constants.swift
//  Promos
//
//  Created by Alejandro Rodriguez on 1/15/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import UIKit

struct Constants {
    
    
    struct PromosTable {
        
        static let PromosTableName = "Promo"
        static let PromosTitle = "title"
        static let PromosIsFeatured = "featured"
        
    }
    
    struct CommerceTable {
        static let CommerceTableName = "Commerce"
        static let CommerceName = "commerceName"
    }
    
    
    struct CommonTableAttributes {
        static let CreatedAt = "createdAt"
        static let ObjectsPerPage:UInt = 25
    }
    
    struct Cells {
        struct PromosCell {
            static let PromosNibName = "PromoCell"
            static let PromosCellIdentifier = "promosCellIdentifier"
            static let PromosCellHeight:CGFloat = 77.0
        }
        
        struct CommerceCell {
            static let CommerceNibName = "CommerceCell"
            static let CommerceCellIdentifier = "commerceCellIdentifier"
            static let CommerceCellHeight:CGFloat = 73.0

        }

    }
    
    struct FontNames {
        static let MyriadRegular = "MyriadPro-Regular"
        static let MyriadRegularSemiBold = "MyriadPro-Semibold"
    }
    
    struct Animations {
        struct PromosBanner {
            static let ScrollSpeed = 0.7
            static let AutomaticScrollDelay = 2.5
        }
    }
    
    
    
    
}


