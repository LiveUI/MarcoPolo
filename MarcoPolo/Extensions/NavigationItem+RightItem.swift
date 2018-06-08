//
//  NavigationItem+RightItem.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 08/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


extension NavigationItem {
    
    /// Right (bar button) item
    public var rightItem: UIView? {
        get { return rightItems.first }
        set {
            guard let item = newValue else {
                rightItems.removeAll()
                return
            }
            rightItems = [item]
        }
    }
    
    /// Set right (bar button) items
    public func set(rightItems: [UIView], animated: Bool = true) {
        
    }
    
    /// Set right (bar button) item
    public func set(rightItem: UIView, animated: Bool = true) {
        
    }
    
}
