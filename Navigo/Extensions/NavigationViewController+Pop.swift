//
//  NavigationViewController+Pop.swift
//  Navigo
//
//  Created by Ondrej Rafaj on 05/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


extension NavigationViewController {
    
    /// Returns the popped controller.
    @discardableResult open func popViewController(animation: Animation = .default) -> UIViewController? {
        guard viewControllers.count > 1, let viewController = viewControllers.last else {
            return nil
        }
        
        // TODO: Add previous view controller back on
        // TODO: Animate
        remove(childViewController: viewController)
        remove(managerFor: viewController)
        return viewControllers.removeLast()
    }
    
    /// Pops view controllers until the one specified is on top. Returns the popped controllers.
    @discardableResult open func pop(to viewController: UIViewController, animation: Animation = .default) -> [UIViewController]? {
        guard viewControllers.count > 1 else {
            return nil
        }
        fatalError("Not implemented")
    }
    
    /// Pops until there's only a single view controller left on the stack. Returns the popped controllers.
    @discardableResult open func popToRootViewController(animation: Animation = .default) -> [UIViewController]? {
        return pop(to: rootViewController, animation: animation)
    }
    
}
