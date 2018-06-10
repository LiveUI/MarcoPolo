//
//  NavigationViewController+Push.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 05/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


extension NavigationViewController {
    
    /// Push a new view controller (default animation is `.paralax()`)
    public func push(viewController: UIViewController, animation: Animation = .default()) {
        guard let previous = viewControllers.last else {
            fatalError("This should never happen")
        }
        isAnimating = true
        
        register(managerFor: viewController, animation: animation)
        
        viewController.navigationViewController = self
        viewControllers.append(viewController)
        
        add(childViewController: viewController)
        
        let time = animate(viewController, over: previous) {
            self.remove(childViewController: previous)
            
            self.isAnimating = false
        }
        change(navigationItemFrom: viewController, animationTime: time)
    }
    
}
