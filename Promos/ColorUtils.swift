//
//  ColorUtils.swift
//  Promos
//
//  Created by Alejandro Rodriguez on 1/17/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class ColorUtils: NSObject {
    
    class func backgroundColor() -> UIColor{
        return UIColor.generateColorWithRGB(109.0, green: 219.0, blue: 41.0, alpha: 1.0)
    }
    
    class func greenTextColor() -> UIColor {
        return UIColor.generateColorWithRGB(111.0, green: 200.0, blue: 31.0, alpha: 1.0)
    }
    
    

}
