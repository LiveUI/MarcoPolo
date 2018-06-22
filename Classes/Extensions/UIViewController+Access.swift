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
private var NavigationItemAssociatedObjectHandle: UInt8 = 1

extension UIViewController {
    
    /// [MarcoPolo] Navigation item (details)
    public internal(set) var navigation: NavigationItem {
        get {
            guard let item = objc_getAssociatedObject(self, &NavigationItemAssociatedObjectHandle) as? NavigationItem else {
                let item = NavigationItem()
                item.content.title = title
                item.content.viewController = self
                self.navigation = item
                return item
            }
            return item
        }
        set {
            objc_setAssociatedObject(self, &NavigationItemAssociatedObjectHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// [MarcoPolo] Navigation manager (only available to pushed view controllers)
    var navigationManager: NavigationManager? {
        return navigation.navigationController?.navigationManagers[ObjectIdentifier(self)]
    }
    
//    /// [MarcoPolo] Navigation view controller (only available to pushed view controllers)
//    public internal(set) var navigationViewController: NavigationViewController? {
//        get {
//            guard let c = objc_getAssociatedObject(self, &NavigationViewControllerAssociatedObjectHandle) as? NavigationViewController else {
//                return nil
//            }
//            return c
//        }
//        set {
//            objc_setAssociatedObject(self, &NavigationViewControllerAssociatedObjectHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
    
}
