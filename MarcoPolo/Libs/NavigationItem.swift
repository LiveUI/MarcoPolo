//
//  NavigationItem.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 06/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


public class NavigationItem {
    
    var navigationBar: NavigationBar
    
    public var prompt: String?
    public var title: String?
    public var subtitle: String?
    
    init(_ navigationBar: NavigationBar) {
        self.navigationBar = navigationBar
    }
    
}
