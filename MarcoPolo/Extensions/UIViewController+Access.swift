//
//  UIViewController+Access.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 05/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


private var NavigationViewControllerAssociatedObjectHandle: UInt8 = 0

extension UIViewController {
    
    var navigationManager: NavigationManager? {
        return navigationViewController?.navigationManagers[ObjectIdentifier(self)]
    }
    
    /// [Navigo] Navigation view controller
    public internal(set) var navigationViewController: NavigationViewController? {
        get {
            guard let c = objc_getAssociatedObject(self, &NavigationViewControllerAssociatedObjectHandle) as? NavigationViewController else {
                return nil
            }
            return c
        }
        set {
            objc_setAssociatedObject(self, &NavigationViewControllerAssociatedObjectHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
}
