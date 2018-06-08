//
//  NavigationViewController+Children.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 06/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import UIKit


extension NavigationViewController {
    
    func updateSafeArea() {
        if #available(iOS 11.0, *) {
            for c in viewControllers {
                // TODO: Fix 6, THE MAGIC NUMBER!!!!
                c.additionalSafeAreaInsets.top = navigationBar.bounds.height - view.safeAreaInsets.top
            }
        }
    }
    
    /// Set constraints to satisfy a view
    func setConstraints(on viewController: UIViewController) -> NSLayoutConstraint {
        viewController.view.layout.pinVerticalEdgesToSuperView()
        viewController.view.layout.pinWidthToSuperview()
        return viewController.view.layout.pinLeadingToSuperview()
    }
    
    /// Remove view controller from the stack
    func remove(childViewController: UIViewController) {
        childViewController.willMove(toParentViewController: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParentViewController()
    }
    
    /// Adds child view controller onto the topn of the screen (below nav bar)
    func add(childViewController: UIViewController) {
        addChildViewController(childViewController)
        view.addSubview(childViewController.view)
        childViewController.didMove(toParentViewController: self)
        view.bringSubview(toFront: navigationBar)
        childViewController.navigationManager?.leftConstraint = setConstraints(on: childViewController)
        
        updateSafeArea()
    }

}
