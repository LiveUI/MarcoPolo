//
//  NavigationViewController.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 05/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


open class NavigationViewController: UIViewController {
    
    /// Navigation bar
    public internal(set) var navigationBar: NavigationBar!
    
    /// Root view controller
    public let rootViewController: UIViewController
    
    /// Private view controller stack
    var _viewControllers: [UIViewController] = []
    
    /// Navigation managers
    var navigationManagers: [ObjectIdentifier: NavigationManager] = [:]
    
    /// Is animating
    var isAnimating: Bool = false
    
    // MARK: View lifecycle
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateSafeArea()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Navigation bar
        navigationBar = NavigationBar(minHeight: 44)
        navigationBar.navigationViewController = self
        view.addSubview(navigationBar)
        navigationBar.layout.sides()
        navigationBar.layout.top()
        
        // Add the root view controller onto the scene
        register(managerFor: rootViewController, animation: .none)
        add(childViewController: rootViewController)
        change(navigationItemFrom: rootViewController, animationTime: 0.0)
    }
    
    // MARK: Initialization
    
    /// Designated initializer
    public init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        
        super.init(nibName: nil, bundle: nil)
        
        rootViewController.navigation.navigationController = self
    }
    
    /// Not implemented
    @available(*, unavailable, message: "Initializer unavailable")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    
    @objc public func goBack(_ sender: Any) {
        popViewController()
    }
    
}
