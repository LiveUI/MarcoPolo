//
//  NavigationViewController+Push.swift
//  Navigo
//
//  Created by Ondrej Rafaj on 05/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


extension NavigationViewController {
    
    open func push(viewController: UIViewController, animation: Animation = .default) {
        register(managerFor: viewController, animation: animation)
        
        viewController.navigationViewController = self
        viewControllers.append(viewController)
        
        add(childViewController: viewController)
    }
    
}
