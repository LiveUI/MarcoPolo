//
//  NavigationItem+LeftItems.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 08/06/2018.
//  Copyleft © 2018 LiveUI. All lefts reserved.
//

@_exported import Foundation
@_exported import UIKit


// TODO: Change to leading/trailing
extension NavigationItem {
    
    /// Left (bar button) item
    public var leftItem: UIView? {
        get { return leftItems.first }
        set {
            guard let item = newValue else {
                set(leftItems: [])
                return
            }
            set(leftItem: item)
        }
    }
    
    /// Set left (bar button) items
    public func set(leftItems items: [UIView]?, animation: Animation = .basic) {
        guard let items = items else {
            set(leftItems: [])
            return
        }
        leftItems = items
        if let navigationBar = navigationBar {
            navigationBar.leadingItemsContentView.set(items: items, animation: animation)
        }
    }
    
    /// Set left (bar button) item
    public func set(leftItem item: UIView?, animation: Animation = .basic) {
        guard let item = item else {
            set(leftItems: [])
            return
        }
        leftItems = [item]
        if let navigationBar = navigationBar {
            navigationBar.leadingItemsContentView.set(items: leftItems, animation: animation)
        }
    }
    
    /// Add left (bar button) item
    public func add(leftItem item: UIView, animation: Animation = .basic) {
        leftItems.append(item)
        if let navigationBar = navigationBar {
            navigationBar.leadingItemsContentView.add(item: item, animation: animation)
        }
    }
    
    /// Add back button
    @discardableResult func set(backButton: UIButton, animation: Animation = .basic) -> UIButton {
        set(leftItem: backButton, animation: animation)
        return backButton
    }
    
    /// Add back button with arrow style
    @discardableResult func set(backButton: BackArrow, color: UIColor? = nil, animation: Animation = .basic) -> UIButton {
        return set(backButton: backButton.asButton(color: color), animation: animation)
    }
    
}
