//
//  NavigationViewController+Stack.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 05/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


extension NavigationViewController {
    
    /// Return view controller that has been pushed latest
    open var topViewController: UIViewController {
        guard let c = viewControllers.last else {
            return rootViewController
        }
        return c
    }
    
    /// View controller stack
    public var viewControllers: [UIViewController] {
        get {
            if _viewControllers.count == 0 {
                _viewControllers.append(rootViewController)
            }
            return _viewControllers
        }
        set {
            _viewControllers = newValue
        }
    }
    
}
