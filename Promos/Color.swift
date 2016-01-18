//
//  Color.swift
//  Promos
//
//  Created by Alejandro Rodriguez on 1/17/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import Foundation


extension UIColor{
    
    class func generateColorWithRGB(red: Double,green:Double, blue:Double,alpha:Double) -> UIColor{
        return UIColor(red: CGFloat(red/255.0), green: CGFloat(green/255) , blue: CGFloat (blue/255), alpha: CGFloat(alpha))
    }
    
}
