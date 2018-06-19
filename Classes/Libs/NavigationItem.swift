//
//  NavigationItem.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 06/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


public class NavigationItem {
    
    /// Navigation (bar button) item animation type
    public enum Animation {
        
        /// No animation
        case none
        
        /// Basic animation (fade)
        case basic
        
    }
    
    /// Navigation bar reference
    var navigationBar: NavigationBar?
    
    /// Left (bar button) items
    public var leftItems: [UIView] = []
    
    /// Right (bar button) items
    public var rightItems: [UIView] = []
    
    /// Private interface for title views content
    private var _content: TitleView.Content?
    
    /// Content for title view
    public var content: TitleView.Content {
        get {
            guard let content = _content else {
                let content = TitleView.Content()
                self.content = content
                return content
            }
            return content
        }
        set { _content = newValue }
    }
    
    /// Activate navigation item
    func activate(_ navigationBar: NavigationBar, on viewController: UIViewController) {
        if content.title == nil {
            content.title = viewController.title
        }
        navigationBar.titleView?.content = content
        self.navigationBar = navigationBar
        
        if viewController == navigationBar.navigationViewController.rootViewController {
            navigationBar.leadingItemsContentView.set(items: viewController.navigation.leftItems, animation: .none)
        } else {
            let count = navigationBar.navigationViewController.viewControllers.count
            if viewController.navigation.leftItems.isEmpty && count > 1 {
                viewController.navigation.set(backButton: .regular(), animation: .none).addTarget(navigationBar.navigationViewController, action: #selector(NavigationViewController.goBack(_:)), for: .touchUpInside)
            } else {
                navigationBar.leadingItemsContentView.set(items: viewController.navigation.leftItems, animation: .none)
            }
        }
        
        navigationBar.trailingItemsContentView.set(items: viewController.navigation.rightItems, animation: .none)
    }
    
}
