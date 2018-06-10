//
//  NavigationViewController+Disabled.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 05/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import UIKit


extension NavigationViewController {
    
    @available(*, unavailable, message: "Property unavailable")
    open override var navigationItem: UINavigationItem {
        get { return super.navigationItem }
    }
    
    @available(*, unavailable, message: "Property unavailable")
    open override var navigationController: UINavigationController? {
        get { return super.navigationController }
    }
    
}
