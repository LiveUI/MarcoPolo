//
//  NavigationViewController+Animations.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 06/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


extension NavigationViewController {
    
    /// Animate a new view controller over an old one (push)
    @discardableResult func animate(upperViewController: UIViewController, to lowerViewController: UIViewController, finished: @escaping (() -> Void)) -> TimeInterval {
        guard
            let upperManager = upperViewController.navigationManager,
            let lowerManager = lowerViewController.navigationManager,
            upperManager.animation.storage != Animation.Storage.none,
            let lowerLeftConstraint = lowerManager.leftConstraint,
            let upperLeftConstraint = upperManager.leftConstraint else {
                finished()
                return 0.0
        }
        
        // TODO: Add shadow on lower screen!!!
        if upperManager.animation.storage == .bounce {
            lowerLeftConstraint.constant = -(view.bounds.size.width / 2)
            upperLeftConstraint.constant = 0
            view.layoutIfNeeded()
            
            upperLeftConstraint.constant = -12
            UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }) { _ in
                lowerLeftConstraint.constant = 0
                upperLeftConstraint.constant = self.view.bounds.size.width
                UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                    self.view.layoutIfNeeded()
                }) { _ in
                    finished()
                }
            }
            return 0.35
        } else {
            // Set starting position
            upperLeftConstraint.constant = 0
            switch upperManager.animation.storage {
            case .move:
                lowerLeftConstraint.constant = -view.bounds.size.width
            case .over:
                lowerLeftConstraint.constant = 0
            default:
                lowerLeftConstraint.constant = -(view.bounds.size.width / 2)
            }
            view.layoutIfNeeded()
            
            // Animate top out
            lowerLeftConstraint.constant = 0
            upperLeftConstraint.constant = view.bounds.size.width
            UIView.animate(withDuration: upperManager.animation.storage.animationTime, delay: 0.0, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
            }) { _ in
                finished()
            }
            return upperManager.animation.storage.animationTime
        }
    }
    
    /// Animate a new view controller over an old one (push)
    @discardableResult func animate(_ viewController: UIViewController, over previousViewController: UIViewController, finished: @escaping (() -> Void)) -> TimeInterval {
        guard
            let previousManager = previousViewController.navigationManager,
            let newManager = viewController.navigationManager,
            newManager.animation.storage != Animation.Storage.none,
            let newLeftConstraint = newManager.leftConstraint,
            let previousLeftConstraint = previousManager.leftConstraint else {
                finished()
                return 0.0
        }
        newLeftConstraint.constant = view.bounds.size.width
        view.layoutIfNeeded()
        
        // TODO: Add shadow on lower screen!!!
        if newManager.animation.storage == .bounce {
            newLeftConstraint.constant = -12
            previousLeftConstraint.constant = -(view.bounds.size.width / 2)
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            }) { _ in
                newLeftConstraint.constant = 6
                UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseIn, animations: {
                    self.view.layoutIfNeeded()
                }) { _ in
                    newLeftConstraint.constant = 0
                    UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseIn, animations: {
                        self.view.layoutIfNeeded()
                    }) { _ in
                        finished()
                    }
                }
            }
            return 0.5
        } else {
            newLeftConstraint.constant = 0
            switch newManager.animation.storage {
            case .move:
                previousLeftConstraint.constant = -view.bounds.size.width
            case .over:
                break
            default:
                previousLeftConstraint.constant = -(view.bounds.size.width / 2)
            }
            UIView.animate(withDuration: newManager.animation.storage.animationTime, delay: 0.0, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
            }) { _ in
                finished()
            }
            return newManager.animation.storage.animationTime
        }
    }
    
}
