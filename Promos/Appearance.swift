//
//  Appearance.swift
//  Promos
//
//  Created by Alejandro Rodriguez on 1/17/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//



class Appearance: NSObject {
    
    class func configureAppearance(){
        
        
        //Color de la barra
        UINavigationBar.appearance().barTintColor = ColorUtils.backgroundColor()
        
        UINavigationBar.appearance().translucent = false
        
        
        //Color de los botones
        UINavigationBar.appearance().tintColor = .whiteColor()
        
        let navBarFont = UIFont(name: Constants.FontNames.MyriadRegularSemiBold, size: 24)
        
        
        let navBarTitleTextAttributes:NSDictionary = NSDictionary(objects: [UIColor(white: 1.0, alpha: 1.0), navBarFont!], forKeys: [NSForegroundColorAttributeName, NSFontAttributeName])
        
        UINavigationBar.appearance().titleTextAttributes = navBarTitleTextAttributes as? [String : AnyObject]
        
        //Tabbar
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:ColorUtils.greenTextColor()], forState: .Selected)
        
    }

}
