//
//  BarItemsContentView.swift
//  Demo
//
//  Created by Ondrej Rafaj on 19/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation
import UIKit


class BarItemsContentView: UIView {
    
    /// Position on the navigation bar
    enum Position {
        
        /// Left
        case left
        
        /// Right
        case right
        
    }
    
    /// Position on the navigation bar
    var position: Position
    
    /// Bar items spacing
    var spacing: CGFloat = 6.0
    
    /// Bar items spacing
    var firstItemSpacing: CGFloat = 12
    
    /// Items
    private var items: [UIView] = []
    
    /// Set items
    func set(items: [UIView], animation: NavigationItem.Animation) {
        self.items.removeAllFromSuperview()
        self.items.removeAll()
        self.items = items
        layoutItems()
    }
    
    /// Set item
    func set(item: UIView, animation: NavigationItem.Animation) {
        set(items: [item], animation: animation)
    }
    
    /// Add item
    func add(item: UIView, animation: NavigationItem.Animation) {
        items.append(item)
    }
    
    /// Initializer
    init(_ position: Position) {
        self.position = position
        
        super.init(frame: .zero)
    }
    
    /// Not implemented
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private helpers
    
    /// Layout all items
    private func layoutItems() {
        var previousView: UIView?
        var x: Int = 1
        items.forEach { view in
            addSubview(view)
            view.layout.centerY()
            
            // Place next to the previous view
            if let previousView = previousView {
                switch position {
                case .left:
                    view.layout.next(previousView, margin: spacing)
                case .right:
                    view.layout.before(previousView, margin: spacing)
                }
            } else {
                switch position {
                case .left:
                    view.layout.leading(margin: firstItemSpacing)
                case .right:
                    view.layout.trailing(margin: -firstItemSpacing)
                }
            }
            
            // Manage last item
            if x == items.count {
                switch position {
                case .left:
                    view.layout.match(maxWidth: self)
                case .right:
                    view.layout.leading()
                }
            }
            
            setSizeIfNeccessary(view)
            previousView = view
            x += 1
        }
    }
    
    /// Set size of the bar button item if neccessary
    private func setSizeIfNeccessary(_ view: UIView) {
        if view.constraints.count == 0 {
            // Set height if neccessary
            if view.bounds.size.height == 0 {
                view.layout.height(36)
            } else {
                view.layout.match(maxHeight: self)
            }
            
            // Set height if neccessary
            if view.bounds.size.width == 0 {
                view.layout.width(36)
            }
        }
    }
    
}
