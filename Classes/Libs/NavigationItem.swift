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
    
    /// Navigation bar reference
    private var navigationBar: NavigationBar?
    
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
    func activate(_ navigationBar: NavigationBar) {
        navigationBar.titleView?.content = content
        self.navigationBar = navigationBar
    }
    
}
