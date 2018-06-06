//
//  NavigationViewController+Children.swift
//  Navigo
//
//  Created by Ondrej Rafaj on 06/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import UIKit


extension NavigationViewController {
    
    func updateSafeArea() {
        if #available(iOS 11.0, *) {
            for vc in viewControllers {
                vc.additionalSafeAreaInsets.top = navigationBar.height - vc.view.safeAreaInsets.top
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
        childViewController.willMove(toParent: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParent()
    }
    
    /// Adds child view controller onto the topn of the screen (below nav bar)
    func add(childViewController: UIViewController) {
        addChild(childViewController)
        view.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
        view.bringSubviewToFront(navigationBar)
        childViewController.navigationManager?.leftConstraint = setConstraints(on: childViewController)
        updateSafeArea()
    }

}
