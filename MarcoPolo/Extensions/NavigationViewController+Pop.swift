//
//  NavigationViewController+Pop.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 05/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


extension NavigationViewController {
    
    /// Pops and returns the popped controller.
    @discardableResult public func popViewController(animation: Animation = .default()) -> UIViewController? {
        guard viewControllers.count > 1, let upperViewController = viewControllers.last else {
            return nil
        }
        
        // Update animation if neccessary
        switch animation.storage {
        case .default, .none:
            break
        default:
            upperViewController.navigationManager?.animation = animation
        }
        
        let previousViewController = viewControllers[viewControllers.count - 2]
        
        // Add previous view controller back on
        add(childViewController: previousViewController)
        view.bringSubview(toFront: upperViewController.view)
        view.bringSubview(toFront: navigationBar)
        
        // Animate
        let time = animate(upperViewController: upperViewController, to: previousViewController) {
            self.remove(childViewController: upperViewController)
        }
        change(navigationItemFrom: previousViewController, animationTime: time)
        remove(managerFor: upperViewController)
        return viewControllers.removeLast()
    }
    
    /// Pops view controllers until the one specified is on top. Returns the popped controllers.
    @discardableResult public func pop(to viewController: UIViewController, animation: Animation = .default()) -> [UIViewController]? {
        guard viewControllers.count > 1 else {
            return nil
        }
        fatalError("Not implemented")
    }
    
    /// Pops until there's only a single view controller left on the stack. Returns the popped controllers.
    @discardableResult public func popToRootViewController(animation: Animation = .default()) -> [UIViewController]? {
        return pop(to: rootViewController, animation: animation)
    }
    
}
