//
//  NavigationItem+LeftItems.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 08/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


extension NavigationItem {
    
    /// Left (bar button) item
    public var leftItem: UIView? {
        get { return leftItems.first }
        set {
            guard let item = newValue else {
                leftItems.removeAll()
                return
            }
            leftItems = [item]
        }
    }
    
    /// Set left (bar button) items
    public func set(leftItems: [UIView], animated: Bool = true) {
        
    }
    
    /// Set left (bar button) item
    public func set(leftItem: UIView, animated: Bool = true) {
        
    }
    
}
