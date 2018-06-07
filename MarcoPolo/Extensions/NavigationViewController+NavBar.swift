//
//  NavigationViewController+NavBar.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 07/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


extension NavigationViewController {
    
    func change(navigationItemFrom viewController: UIViewController, animationTime: TimeInterval) {
        navigationBar.titleView?.content = viewController.navigation.content
    }
    
}
