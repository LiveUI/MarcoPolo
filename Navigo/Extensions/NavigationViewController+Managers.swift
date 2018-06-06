//
//  NavigationViewController+Managers.swift
//  Navigo
//
//  Created by Ondrej Rafaj on 06/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


extension NavigationViewController {
    
    func register(managerFor viewController: UIViewController, animation: Animation) {
        let manager = NavigationManager()
        manager.animation = animation
        navigationManagers[ObjectIdentifier(viewController)] = manager
    }
    
    func remove(managerFor viewController: UIViewController) {
        navigationManagers.removeValue(forKey: ObjectIdentifier(viewController))
    }
    
}
