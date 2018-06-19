//
//  NavigationItem+RightItem.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 08/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


// TODO: Change to leading/trailing
extension NavigationItem {
    
    /// Right (bar button) item
    public var rightItem: UIView? {
        get { return rightItems.first }
        set {
            guard let item = newValue else {
                set(rightItems: [])
                return
            }
            set(rightItems: [item])
        }
    }
    
    /// Set right (bar button) items
    public func set(rightItems items: [UIView]?, animation: Animation = .basic) {
        guard let items = items else {
            set(rightItems: [])
            return
        }
        rightItems = items
        if let navigationBar = navigationBar {
            navigationBar.trailingItemsContentView.set(items: items, animation: animation)
        }
    }
    
    /// Set right (bar button) item
    public func set(rightItem item: UIView?, animation: Animation = .basic) {
        guard let item = item else {
            set(rightItems: [])
            return
        }
        rightItems = [item]
        if let navigationBar = navigationBar {
            navigationBar.trailingItemsContentView.set(items: rightItems, animation: animation)
        }
    }
    
    /// Add right (bar button) item
//    public func add(rightItem item: UIView, animation: Animation = .basic) {
//        rightItems.append(item)
//        if let navigationBar = navigationBar {
//            navigationBar.trailingItemsContentView.add(item: item, animation: animation)
//        }
//    }
    
}
