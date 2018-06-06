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
        guard viewControllers.count > 1, let viewController = viewControllers.last else {
            return nil
        }
        
        // Update animation if neccessary
        switch animation.storage {
        case .default, .none:
            break
        default:
            viewController.navigationManager?.animation = animation
        }
        
        let previousViewController = viewControllers[viewControllers.count - 2]
        
        // Add previous view controller back on
        add(childViewController: previousViewController)
        view.bringSubview(toFront: viewController.view)
        view.bringSubview(toFront: navigationBar)
        
        // Animate
        animate(upperViewController: viewController, to: previousViewController) {
            self.remove(childViewController: viewController)
        }
        remove(managerFor: viewController)
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
