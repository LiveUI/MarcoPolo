//
//  NavigationViewController+Children.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 06/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import UIKit


extension NavigationViewController {
    
    /// Set save area on all involved view controllers
    internal func updateSafeArea() {
        if #available(iOS 11.0, *) {
            for c in viewControllers {
                // TODO: Update only active view controllers!
                c.additionalSafeAreaInsets.top = navigationBar.bounds.height - view.safeAreaInsets.top
            }
        }
    }
    
    /// Set constraints to satisfy a view
    func setConstraints(on viewController: UIViewController) -> NSLayoutConstraint {
        viewController.view.layout.vertical()
        viewController.view.layout.matchWidthToSuperview()
        return viewController.view.layout.leading()
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
