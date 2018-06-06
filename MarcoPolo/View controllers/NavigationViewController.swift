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
    
    var navigationBarYPosition: NSLayoutConstraint!
    
    /// Root view controller
    public let rootViewController: UIViewController
    
    /// Private view controller stack
    var _viewControllers: [UIViewController] = []
    
    /// Navigation managers
    var navigationManagers: [ObjectIdentifier: NavigationManager] = [:]
    
    /// Is animating
    var isAnimating: Bool = false
    
    // MARK: View lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // TODO: Fix following
        var safeAreaTop: CGFloat = 20.0
        if #available(iOS 11.0, *) {
            safeAreaTop = view.safeAreaInsets.top + 44.0
        }
        navigationBar = NavigationBar(minHeight: (safeAreaTop + 84.0))
        view.addSubview(navigationBar)
        navigationBar.layout.pinHorizontalEdgesToSuperView()
        navigationBarYPosition = navigationBar.layout.pinTopToSuperview()
        
        register(managerFor: rootViewController, animation: .none)
        add(childViewController: rootViewController)
    }
    
    // MARK: Initialization
    
    /// Designated initializer
    public init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        
        super.init(nibName: nil, bundle: nil)
        
        rootViewController.navigationViewController = self
    }
    
    @available(*, unavailable, message: "Initializer unavailable")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
